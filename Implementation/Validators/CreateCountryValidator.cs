using Application.ViewModels;
using FluentValidation;
using System.Data;

namespace Implementation.Validators
{
	public class CreateCountryValidator : AbstractValidator<CreateCountryDto>
	{
		public CreateCountryValidator()
		{
			RuleFor(x => x.CountryName).NotEmpty();
		}
	}
}
