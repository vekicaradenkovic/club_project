using Application.DTOs;
using Application.Interfaces;

namespace Application.Commands
{
	public interface IGetCountryCommand : IQuery<int, CountryDto>
	{
	}
}
