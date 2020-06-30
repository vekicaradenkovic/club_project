using Application.Interfaces;
using Application.SearchObjects;
using System.Linq;

namespace Application.Helpers
{
	public class PagedResponseHelper<T, TQueryable> : IPagedResponseHelper<T, TQueryable> where T : class 
	{
		public PagedResponse<T> GetResponse(IQueryable<TQueryable> query, BaseSearchQuery request)
		{
			var skipCount = request.PerPage * (request.Page - 1);

			return new PagedResponse<T>()
			{
				CurrentPage = request.Page,
				ItemsPerPage = request.PerPage,
				TotalCount = query.Count(),
				Items = query?.Skip(skipCount).Take(request.PerPage).Select(x => AutoMapperConfiguration.Mapper.Map<T>(x))
			};
		}
	}
}
