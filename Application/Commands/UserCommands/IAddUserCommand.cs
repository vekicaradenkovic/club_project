using Application.ViewModels;
using Application.Interfaces;

namespace Application.Commands
{
	public interface IAddUserCommand : ICommand<CreateUserDto>
	{
	}
}
