using Application.Interfaces;
using Application.ViewModels;

namespace Application.Commands
{
	public interface IAddTeamCommand : ICommand<CreateTeamDto>
	{
	}
}
