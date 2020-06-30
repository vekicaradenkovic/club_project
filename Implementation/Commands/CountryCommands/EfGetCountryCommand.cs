using Application;
using Application.Commands;
using Application.DTOs;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
	public class EfGetCountryCommand : BaseCommand, IGetCountryCommand
	{
		public EfGetCountryCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 27;

		public string Name => "Get selected country";

		public CountryDto Execute(int request)
		{
			var foundedCountry = Context.Countries.Where(x => x.DeletedAt == null).FirstOrDefault(x => x.Id == request);
			if (foundedCountry == null)
			{
				throw new EntityNotFoundException(request, typeof(Country));
			}

			return AutoMapperConfiguration.Mapper.Map<CountryDto>(foundedCountry);
		}
	}
}
