using Application;
using Application.Commands;
using Application.DTOs;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands
{
	public class EfGetPositionCommand : BaseCommand, IGetPositionCommand
	{
		public EfGetPositionCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 17;

		public string Name => "Get selected player position";

		public PositionDto Execute(int request)
		{
			var foundedPosition = Context.Positions.Where(x => x.DeletedAt == null).FirstOrDefault(x => x.Id == request);
			if (foundedPosition == null)
			{
				throw new EntityNotFoundException(request, typeof(Position));
			}

			return AutoMapperConfiguration.Mapper.Map<PositionDto>(foundedPosition);
		}
	}
}
