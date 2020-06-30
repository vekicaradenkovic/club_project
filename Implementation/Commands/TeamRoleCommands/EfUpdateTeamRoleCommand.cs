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
	public class EfUpdateTeamRoleCommand : BaseCommand, IUpdateTeamRoleCommand
	{
		private readonly CreateTeamRoleValidator _validator;
		public EfUpdateTeamRoleCommand(ClubDbContext context, CreateTeamRoleValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 9;

		public string Name => "Update Team Role";

		public void Execute(CreateTeamRoleDto request, int id)
		{
			if (request == null)
			{
				throw new BadRequestException("Team Role data is not passed.");
			}

			_validator.ValidateAndThrow(request);
			var teamRole = Context.TeamRoles.Find(id);
			if (teamRole == null)
			{
				throw new EntityNotFoundException(id, typeof(TeamRole));
			}
			teamRole.RoleName = request.RoleName;
			Context.TeamRoles.Update(teamRole);
			Context.SaveChanges();
		}
	}
}
