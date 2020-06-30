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

namespace Implementation.Commands
{
	public class EfAddCountryCommand : BaseCommand, IAddCountryCommand
	{
		private readonly CreateCountryValidator _validator;
		public EfAddCountryCommand(ClubDbContext context, CreateCountryValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 28;

		public string Name => "Add new country";

		public void Execute(CreateCountryDto request)
		{
			if (request == null)
			{
				throw new BadRequestException("Country is not passed.");
			}
			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch (ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}

			var country = AutoMapperConfiguration.Mapper.Map<Country>(request);
			Context.Countries.Add(country);
			Context.SaveChanges();
		}
	}
}
