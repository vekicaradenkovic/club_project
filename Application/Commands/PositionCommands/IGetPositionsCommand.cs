using Application.DTOs;
using Application.Interfaces;
using Application.SearchObjects;

namespace Application.Commands
{
	public interface IGetPositionsCommand : IQuery<PositionSearchObject, PagedResponse<PositionDto>>
	{
	}
}
