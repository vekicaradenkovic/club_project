using Application.DTOs;
using Application.Interfaces;
using Application.SearchObjects;

namespace Application.Commands
{
	public interface IGetTeamMembersCommand : IQuery<TeamMemberSearchObject, PagedResponse<TeamMemberDto>>
	{
	}
}
