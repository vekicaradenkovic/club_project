using Application;
using Application.Commands;
using Application.Exceptions;
using Application.ViewModels;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;
using System.IO;

namespace Implementation.Commands
{
	public class EfAddTeamMemberCommand : BaseCommand, IAddTeamMemberCommand
	{
		private readonly CreateTeamMemberValidator _validator;
		public EfAddTeamMemberCommand(ClubDbContext context, CreateTeamMemberValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 23;

		public string Name => "Add new team member";

		public void Execute(CreateTeamMemberDto request)
		{
			if (request == null)
			{
				throw new BadRequestException("Team member is not passed.");
			}
			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch (ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}

			var teamMember = AutoMapperConfiguration.Mapper.Map<TeamMember>(request);
			var path = Path.Combine("wwwroot", "images", teamMember.PhotoPath);

			using (var fileStream = new FileStream(path, FileMode.Create))
			{
				request.Image.CopyTo(fileStream);
			}

			Context.TeamMembers.Add(teamMember);
			Context.SaveChanges();
		}
	}
}
