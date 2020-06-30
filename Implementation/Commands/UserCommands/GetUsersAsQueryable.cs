using Application.Commands;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Implementation.Commands
{
	public class GetUsersAsQueryable : IGetUsersAsQueriable
	{
		private readonly ClubDbContext _context;
		public GetUsersAsQueryable(ClubDbContext context) 
		{
			_context = context;
		}

		public IQueryable<User> GetNotDeletedUsersWithUseCases()
		{
			return _context.Users.Where(x => x.DeletedAt == null).Include(x => x.UserUserCases);
		}
	}
}
