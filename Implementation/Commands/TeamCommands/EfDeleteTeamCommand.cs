using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System;

namespace Implementation.Commands
{
	public class EfDeleteTeamCommand : BaseCommand, IDeleteTeamCommand
	{
		public EfDeleteTeamCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 15;

		public string Name => "Delete team";

		public void Execute(int request)
		{
			var team = Context.Teams.Find(request);

			if (team == null)
			{
				throw new EntityNotFoundException(request, typeof(Team));
			}

			team.DeletedAt = DateTime.Now;
			Context.Teams.Update(team);
			Context.SaveChanges();
		}
	}
}
