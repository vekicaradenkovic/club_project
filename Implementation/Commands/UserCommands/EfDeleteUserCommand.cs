using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System;

namespace Implementation.Commands
{
	public class EfDeleteUserCommand : BaseCommand, IDeleteUserComamnd
	{
		public EfDeleteUserCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 4;

		public string Name => "Detele User";

		public void Execute(int request)
		{
			var user = Context.Users.Find(request);

			if (user == null)
			{
				throw new EntityNotFoundException(request, typeof(User));
			}

			user.DeletedAt = DateTime.Now;
			Context.Users.Update(user);
			Context.SaveChanges();
		}
	}
}
