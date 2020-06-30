using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application.Commands
{
	public interface IGetUsersAsQueriable
	{
		IQueryable<User> GetNotDeletedUsersWithUseCases();
	}
}
