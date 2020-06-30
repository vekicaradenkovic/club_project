using Application;
using Application.Commands;
using Application.Exceptions;
using Application.ViewModels;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands
{
	public class EfAddPositionCommand : BaseCommand, IAddPositionCommand
	{
		private readonly CreatePositionValidator _validator;
		public EfAddPositionCommand(ClubDbContext context, CreatePositionValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 18;

		public string Name => "Create new position";

		public void Execute(CreatePositionDto request)
		{
			if (request == null)
			{
				throw new BadRequestException("Position is not passed.");
			}
			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch (ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}

			var position = AutoMapperConfiguration.Mapper.Map<Position>(request);
			Context.Positions.Add(position);
			Context.SaveChanges();
		}
	}
}
