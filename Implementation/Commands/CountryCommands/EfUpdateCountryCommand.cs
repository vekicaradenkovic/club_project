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
	public class EfUpdateCountryCommand : BaseCommand, IUpdateCountryCommand
	{
		private readonly CreateCountryValidator _validator;
		public EfUpdateCountryCommand(ClubDbContext context, CreateCountryValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 29;

		public string Name => "Update selected country";

		public void Execute(CreateCountryDto request, int id)
		{
			if (request == null)
			{
				throw new BadRequestException("Country data is not passed.");
			}

			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch (ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}
			var country = Context.Countries.Find(id);
			if (country == null)
			{
				throw new EntityNotFoundException(id, typeof(Country));
			}
			country.CountryName = request.CountryName;
			Context.Countries.Update(country);
			Context.SaveChanges();
		}
	}
}
