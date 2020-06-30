using Application.DTOs;
using Application.Interfaces;

namespace Application.Commands
{
	public interface IGetTeamRoleCommand : IQuery<int,TeamRoleDto>
	{
	}
}
