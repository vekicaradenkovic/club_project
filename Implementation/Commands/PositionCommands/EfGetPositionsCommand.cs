using Application.Commands;
using Application.DTOs;
using Application.Helpers;
using Application.Interfaces;
using Application.SearchObjects;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System.Linq;

namespace Implementation.Commands
{
	public class EfGetPositionsCommand : BaseCommand, IGetPositionsCommand
	{
		private readonly IPagedResponseHelper<PositionDto, Position> _helper;
		public EfGetPositionsCommand(ClubDbContext context) : base(context)
		{
			_helper = new PagedResponseHelper<PositionDto, Position>();
		}

		public int Id => 16;

		public string Name => "Get Players Positions";

		public PagedResponse<PositionDto> Execute(PositionSearchObject request)
		{
			var positions = Context.Positions.Where(x => x.DeletedAt == null).AsQueryable();

			if (!positions.Any() || positions == null)
			{
				return new PagedResponse<PositionDto>()
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
					positions = positions.Where(x => x.PositionName.ToLower().Contains(request.Keywords.ToLower()));
				}
			}

			return _helper.GetResponse(positions, request);
		}
	}
}
