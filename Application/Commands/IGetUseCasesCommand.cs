using Application.DTOs;
using Application.Interfaces;
using Application.SearchObjects;

namespace Application.Commands
{
	public interface IGetUseCasesCommand : IQuery<UseCaseSearchObject, PagedResponse<UseCaseDto>>
	{
	}
}
