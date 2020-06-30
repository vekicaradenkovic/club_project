using Application;
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
	public class EfAddTeamCommand : BaseCommand, IAddTeamCommand
	{
		private readonly CreateTeamValidator _validator;
		public EfAddTeamCommand(ClubDbContext context, CreateTeamValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 13;

		public string Name => "Create new team";

		public void Execute(CreateTeamDto request)
		{
			if (request == null)
			{
				throw new BadRequestException("Team is not passed.");
			}
			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch (ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}

			var team = AutoMapperConfiguration.Mapper.Map<Team>(request);
			var path = Path.Combine("wwwroot", "images", team.PhotoPath);

			using (var fileStream = new FileStream(path, FileMode.Create))
			{
				request.Image.CopyTo(fileStream);
			}
			Context.Teams.Add(team);
			Context.SaveChanges();
		}
	}
}
