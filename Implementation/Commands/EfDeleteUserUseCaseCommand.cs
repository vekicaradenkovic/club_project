using Application.Commands;
using EfDataAccess;
using Implementation.Commnds;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
	public class EfDeleteUserUseCaseCommand : BaseCommand, IDeleteUserUseCaseCommand
	{
		public EfDeleteUserUseCaseCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 34;

		public string Name => "Delete user use cases";

		public void Execute(List<int> request, int userId)
		{
			var userUseCasesForDelete = Context.UserUseCases.Where(x => x.UserId == userId && request.Contains(x.UseCaseId));
			Context.UserUseCases.RemoveRange(userUseCasesForDelete);
			Context.SaveChanges();
		}
	}
}
