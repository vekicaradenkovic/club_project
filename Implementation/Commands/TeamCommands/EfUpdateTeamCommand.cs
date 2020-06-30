using Application.Commands;
using Application.Exceptions;
using Application.ViewModels;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;
using System;
using System.IO;

namespace Implementation.Commands
{
	public class EfUpdateTeamCommand : BaseCommand, IUpdateTeamCommand
	{
		private readonly CreateTeamValidator _validator;
		public EfUpdateTeamCommand(ClubDbContext context, CreateTeamValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 14;

		public string Name => "Update selected team";

		public void Execute(CreateTeamDto request, int id)
		{
			if (request == null)
			{
				throw new BadRequestException("Team data is not passed.");
			}

			_validator.ValidateAndThrow(request);
			var team = Context.Teams.Find(id);

			if (team == null)
			{
				throw new EntityNotFoundException(id, typeof(Team));
			}

			team.TeamName = request.Name;
			team.Description = request.Description;

			if (File.Exists(Path.Combine("wwwroot", "images", team.PhotoPath)))
			{
				File.Delete(Path.Combine("wwwroot", "images", team.PhotoPath));
			}

			team.PhotoPath = Guid.NewGuid() + Path.GetExtension(request.Image.FileName);
			var path = Path.Combine("wwwroot", "images", team.PhotoPath);

			using (var fileStream = new FileStream(path, FileMode.Create))
			{
				request.Image.CopyTo(fileStream);
			}
			Context.Teams.Update(team);
			Context.SaveChanges();
		}
	}
}
