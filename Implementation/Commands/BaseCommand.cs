using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commnds
{
	public class BaseCommand
	{
		protected ClubDbContext Context { get; set; }
		public BaseCommand(ClubDbContext context) => Context = context;
	}
}
