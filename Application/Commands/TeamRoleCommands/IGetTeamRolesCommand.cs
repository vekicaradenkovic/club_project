using Application.DTOs;
using Application.Interfaces;
using Application.SearchObjects;

namespace Application.Commands
{
	public interface IGetTeamRolesCommand : IQuery<TeamRoleSearchObject,PagedResponse<TeamRoleDto>>
	{
	}
}
