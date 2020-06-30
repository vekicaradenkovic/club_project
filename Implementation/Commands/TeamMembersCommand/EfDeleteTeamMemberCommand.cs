using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;

namespace Implementation.Commands
{
	public class EfDeleteTeamMemberCommand : BaseCommand, IDeleteTeamMemberCommand
	{
		public EfDeleteTeamMemberCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 25;

		public string Name => "Delete selected team member";

		public void Execute(int request)
		{
			var teamMember = Context.TeamMembers.Find(request);

			if (teamMember == null)
			{
				throw new EntityNotFoundException(request, typeof(TeamMember));
			}

			Context.TeamMembers.Remove(teamMember);
			Context.SaveChanges();
		}
	}
}
