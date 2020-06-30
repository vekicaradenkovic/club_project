using Application.Interfaces;
using Application.ViewModels;

namespace Application.Commands
{
	public interface IUpdateUserCommand : IUpdateCommand<UpdateUserDto>
	{
		void Execute(UpdateUserDto request, int id);
	}
}
