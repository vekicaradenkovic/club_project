using Application.DTOs;
using Application.Interfaces;

namespace Application.Commands
{
	public interface IGetTeamCommand : IQuery<int,TeamDto>
	{
	}
}
