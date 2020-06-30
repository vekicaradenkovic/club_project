using Application;
using Application.Commands;
using Application.DTOs;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System.Linq;

namespace Implementation.Commands
{
	public class EfGetTeamCommand : BaseCommand, IGetTeamCommand
	{
		public EfGetTeamCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 12;

		public string Name => "Get selected team";

		public TeamDto Execute(int request)
		{
			var foundedTeam = Context.Teams.Where(x => x.DeletedAt == null).FirstOrDefault(x => x.Id == request);
			if (foundedTeam == null)
			{
				throw new EntityNotFoundException(request, typeof(Team));
			}

			return AutoMapperConfiguration.Mapper.Map<TeamDto>(foundedTeam);
		}
	}
}
