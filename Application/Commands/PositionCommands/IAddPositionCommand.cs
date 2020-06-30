using Application.Interfaces;
using Application.ViewModels;

namespace Application.Commands
{
	public interface IAddPositionCommand : ICommand<CreatePositionDto>
	{
	}
}
