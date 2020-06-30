using Application.Interfaces;
using Application.ViewModels;

namespace Application.Commands
{
	public interface IAddCountryCommand : ICommand<CreateCountryDto>
	{
	}
}
