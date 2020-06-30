using Application.DTOs;
using Application.Interfaces;
using Application.SearchObjects;

namespace Application.Commands
{
	public interface IGetTeamsCommand : IQuery<TeamSearchObject, PagedResponse<TeamDto>>
	{
	}
}
