using Application.Commands;
using Application.DTOs;
using Application.Helpers;
using Application.Interfaces;
using Application.SearchObjects;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using Implementation.Validators;
using System.Linq;

namespace Implementation.Commands
{
	public class EfGetTeamsCommand : BaseCommand, IGetTeamsCommand
	{
		private readonly IPagedResponseHelper<TeamDto, Team> _helper;
		public EfGetTeamsCommand(ClubDbContext context) : base(context)
		{
			_helper = new PagedResponseHelper<TeamDto, Team>();
		}

		public int Id => 11;

		public string Name => "Get Teams";

		public PagedResponse<TeamDto> Execute(TeamSearchObject request)
		{
			var teams = Context.Teams.Where(x => x.DeletedAt == null).AsQueryable();

			if (!teams.Any() || teams == null)
			{
				return new PagedResponse<TeamDto>()
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
					teams = teams.Where(x => x.TeamName.ToLower().Contains(request.Keywords.ToLower()) || x.Description.ToLower().Contains(request.Keywords.ToLower()));
				}
			}

			return _helper.GetResponse(teams, request);
		}
	}
}
