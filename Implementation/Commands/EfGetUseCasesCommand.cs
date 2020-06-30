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
	public class EfGetUseCasesCommand : BaseCommand, IGetUseCasesCommand
	{
		private readonly IPagedResponseHelper<UseCaseDto, UseCase> _helper;
		public EfGetUseCasesCommand(ClubDbContext context) : base(context)
		{
			_helper = new PagedResponseHelper<UseCaseDto, UseCase>();
		}

		public int Id => 32;

		public string Name => "Get use cases";

		public PagedResponse<UseCaseDto> Execute(UseCaseSearchObject request)
		{
			var useCases = Context.UseCases.Where(x => x.DeletedAt == null).AsQueryable();

			if (!useCases.Any() || useCases == null)
			{
				return new PagedResponse<UseCaseDto>()
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
					useCases = useCases.Where(x => x.Name.ToLower().Contains(request.Keywords.ToLower()));
				}
			}

			return _helper.GetResponse(useCases, request);
		}
	}
}
