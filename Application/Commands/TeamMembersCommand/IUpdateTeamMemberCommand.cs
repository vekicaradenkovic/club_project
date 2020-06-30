using Application.Interfaces;
using Application.ViewModels;

namespace Application.Commands
{
	public interface IUpdateTeamMemberCommand : IUpdateCommand<CreateTeamMemberDto>
	{
	}
}
