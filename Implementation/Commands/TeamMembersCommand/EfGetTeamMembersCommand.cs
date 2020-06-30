using Application.Commands;
using Application.DTOs;
using Application.Helpers;
using Application.Interfaces;
using Application.SearchObjects;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Implementation.Commands
{
	public class EfGetTeamMembersCommand : BaseCommand, IGetTeamMembersCommand
	{
		private readonly IPagedResponseHelper<TeamMemberDto, TeamMember> _helper;
		public EfGetTeamMembersCommand(ClubDbContext context) : base(context)
		{
			_helper = new PagedResponseHelper<TeamMemberDto, TeamMember>();
		}

		public int Id => 21;

		public string Name => "Get all team members";

		public PagedResponse<TeamMemberDto> Execute(TeamMemberSearchObject request)
		{
			var teamMembers = Context.TeamMembers.Include(x => x.Team)
												 .Include(x => x.TeamRole)
												 .Include(x => x.Country)
												 .Include(x => x.Position)
												 .Where(x => x.DeletedAt == null).AsQueryable();

			if (!teamMembers.Any() || teamMembers == null)
			{
				return new PagedResponse<TeamMemberDto>()
				{
					CurrentPage = request.Page,
					ItemsPerPage = request.PerPage,
					TotalCount = 0,
					Items = null
				};
			}

			if (request != null)
			{
				if (!string.IsNullOrEmpty(request.Keywords) || !string.IsNullOrWhiteSpace(request.Keywords))
				{
					teamMembers = teamMembers.Where(x => (x.FirstName + " " + x.LastName).ToLower().Contains(request.Keywords.ToLower()));
				}
				if(!string.IsNullOrEmpty(request.TeamName) || !string.IsNullOrWhiteSpace(request.TeamName))
				{
					teamMembers = teamMembers.Where(x => x.Team.TeamName.ToLower().Contains(request.TeamName.ToLower()));
				}
			}

			return _helper.GetResponse(teamMembers, request);
		}
	}
}
