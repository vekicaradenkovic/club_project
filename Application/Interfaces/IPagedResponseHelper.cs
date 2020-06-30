using Application.SearchObjects;
using System.Linq;

namespace Application.Interfaces
{
	public interface IPagedResponseHelper<T, TQueryable>  where T : class  
	{
		PagedResponse<T> GetResponse(IQueryable<TQueryable> query, BaseSearchQuery request);
	}
}
