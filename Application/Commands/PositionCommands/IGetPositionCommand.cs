using Application.DTOs;
using Application.Interfaces;

namespace Application.Commands
{
	public interface IGetPositionCommand : IQuery<int, PositionDto>
	{
	}
}
