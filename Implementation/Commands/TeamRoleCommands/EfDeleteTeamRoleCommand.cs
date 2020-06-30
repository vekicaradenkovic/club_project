using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
	public class EfDeleteTeamRoleCommand : BaseCommand, IDeleteTeamRoleCommand
	{
		public EfDeleteTeamRoleCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 10;

		public string Name => "Delete Team Role";

		public void Execute(int request)
		{
			var teamRole = Context.TeamRoles.Find(request);

			if (teamRole == null)
			{
				throw new EntityNotFoundException(request, typeof(TeamRole));
			}

			teamRole.DeletedAt = DateTime.Now;
			Context.TeamRoles.Update(teamRole);
			Context.SaveChanges();
		}
	}
}
