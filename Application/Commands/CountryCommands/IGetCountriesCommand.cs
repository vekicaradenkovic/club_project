﻿using Application.DTOs;
using Application.Interfaces;
using Application.SearchObjects;

namespace Application.Commands
{
	public interface IGetCountriesCommand : IQuery<CountrySearchObject,PagedResponse<CountryDto>>
	{
	}
}
