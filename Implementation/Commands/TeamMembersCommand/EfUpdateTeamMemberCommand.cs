using Application.Commands;
using Application.Exceptions;
using Application.ViewModels;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Implementation.Commands
{
	public class EfUpdateTeamMemberCommand : BaseCommand, IUpdateTeamMemberCommand
	{
		private readonly CreateTeamMemberValidator _validator;
		public EfUpdateTeamMemberCommand(ClubDbContext context, CreateTeamMemberValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 24;

		public string Name => "Update selected team member";

		public void Execute(CreateTeamMemberDto request, int id)
		{
			if (request == null)
			{
				throw new BadRequestException("Team Member data is not passed.");
			}

			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch (ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}
			var teamMember = Context.TeamMembers.Find(id);

			if (teamMember == null)
			{
				throw new EntityNotFoundException(id, typeof(TeamMember));
			}

			teamMember.FirstName = request.FirstName;
			teamMember.LastName = request.LastName;
			teamMember.Active = request.Active;
			teamMember.DateOfBirth = request.DateOfBirth;
			teamMember.CountryId = request.CountryId;
			teamMember.TeamRoleId = request.TeamRoleId;
			teamMember.TeamId = request.TeamId;

			if (File.Exists(Path.Combine("wwwroot", "images", teamMember.PhotoPath)))
			{
				File.Delete(Path.Combine("wwwroot", "images", teamMember.PhotoPath));
			}

			teamMember.PhotoPath = Guid.NewGuid() + Path.GetExtension(request.Image.FileName);
			var path = Path.Combine("wwwroot", "images", teamMember.PhotoPath);

			using (var fileStream = new FileStream(path, FileMode.Create))
			{
				request.Image.CopyTo(fileStream);
			}
			Context.TeamMembers.Update(teamMember);
			Context.SaveChanges();
		}
	}
}
