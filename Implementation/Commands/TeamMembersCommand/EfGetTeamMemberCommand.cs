using Application;
using Application.Commands;
using Application.DTOs;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Security.Cryptography.X509Certificates;

namespace Implementation.Commands
{
	public class EfGetTeamMemberCommand : BaseCommand, IGetTeamMemberCommand
	{
		public EfGetTeamMemberCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 22;

		public string Name => "Get selected team member";

		public TeamMemberDto Execute(int request)
		{
			var foundedTeamMember = Context.TeamMembers.Include(x => x.Team)
													   .Include(x => x.TeamRole)
													   .Include(x => x.Country)
													   .Include(x => x.Position)
													   .FirstOrDefault(x => x.Id == request);
			if (foundedTeamMember == null)
			{
				throw new EntityNotFoundException(request, typeof(TeamMember));
			}

			return AutoMapperConfiguration.Mapper.Map<TeamMemberDto>(foundedTeamMember);
		}
	}
}
