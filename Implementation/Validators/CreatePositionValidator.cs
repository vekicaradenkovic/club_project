using Application.ViewModels;
using FluentValidation;

namespace Implementation.Validators
{
	public class CreatePositionValidator : AbstractValidator<CreatePositionDto>
	{
		public CreatePositionValidator()
		{
			RuleFor(x => x.PositionName).MaximumLength(50).NotEmpty();
		}
	}
}
