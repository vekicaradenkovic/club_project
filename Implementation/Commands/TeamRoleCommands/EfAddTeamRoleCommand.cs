using Application;
using Application.Commands;
using Application.ViewModels;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;

namespace Implementation.Commands
{
	public class EfAddTeamRoleCommand : BaseCommand, IAddTeamRoleCommand
	{
		private readonly CreateTeamRoleValidator _validator;
		public EfAddTeamRoleCommand(ClubDbContext context, CreateTeamRoleValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 8;

		public string Name => "Create new Team Role";

		public void Execute(CreateTeamRoleDto request)
		{
			if(request == null)
			{
				throw new BadRequestException("Team Role is not passed.");
			}
			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch(ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}
			
			var teamRole = AutoMapperConfiguration.Mapper.Map<TeamRole>(request);
			Context.TeamRoles.Add(teamRole);
			Context.SaveChanges();
		}
	}
}
