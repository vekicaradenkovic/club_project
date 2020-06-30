using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
	public class EfDeletePositionCommand : BaseCommand, IDeletePositionCommand
	{
		public EfDeletePositionCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 20;

		public string Name => "Delete selected position";

		public void Execute(int request)
		{
			var position = Context.Positions.Find(request);

			if (position == null)
			{
				throw new EntityNotFoundException(request, typeof(Position));
			}

			Context.Positions.Remove(position);
			Context.SaveChanges();
		}
	}
}
