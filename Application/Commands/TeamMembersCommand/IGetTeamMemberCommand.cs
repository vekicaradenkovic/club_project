using Application.DTOs;
using Application.Interfaces;

namespace Application.Commands
{
	public interface IGetTeamMemberCommand : IQuery<int, TeamMemberDto>
	{
	}
}
