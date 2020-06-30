using Application.Commands;
using Application.Exceptions;
using Application.ViewModels;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;

namespace Implementation.Commands
{
	public class EfUpdatePositionCommand : BaseCommand, IUpdatePositionCommand
	{
		private readonly CreatePositionValidator _validator;
		public EfUpdatePositionCommand(ClubDbContext context, CreatePositionValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 19;

		public string Name => "Update selected position";

		public void Execute(CreatePositionDto request, int id)
		{
			if (request == null)
			{
				throw new BadRequestException("Position data is not passed.");
			}

			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch (ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}
			var position = Context.Positions.Find(id);
			if (position == null)
			{
				throw new EntityNotFoundException(id, typeof(Position));
			}
			position.PositionName = request.PositionName;
			Context.Positions.Update(position);
			Context.SaveChanges();
		}
	}
}
