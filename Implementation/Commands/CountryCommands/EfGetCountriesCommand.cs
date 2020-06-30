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
	public class EfGetCountriesCommand : BaseCommand, IGetCountriesCommand
	{
		private readonly IPagedResponseHelper<CountryDto, Country> _helper;
		public EfGetCountriesCommand(ClubDbContext context) : base(context)
		{
			_helper = new PagedResponseHelper<CountryDto, Country>();
		}

		public int Id => 26;

		public string Name => "Get Countries";

		public PagedResponse<CountryDto> Execute(CountrySearchObject request)
		{
			var countries = Context.Countries.Where(x => x.DeletedAt == null).AsQueryable();

			if (!countries.Any() || countries == null)
			{
				return new PagedResponse<CountryDto>()
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
					countries = countries.Where(x => x.CountryName.ToLower().Contains(request.Keywords.ToLower()));
				}
			}

			return _helper.GetResponse(countries, request);
		}
	}
}
