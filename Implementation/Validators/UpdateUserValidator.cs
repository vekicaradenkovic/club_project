using Application.ViewModels;
using EfDataAccess;
using FluentValidation;

namespace Implementation.Validators
{
	public class UpdateUserValidator : AbstractValidator<UpdateUserDto>
	{
		public UpdateUserValidator(ClubDbContext context)
		{
            RuleFor(x => x.FirstName).NotEmpty();
            RuleFor(x => x.LastName).NotEmpty();
            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress();
        }
	}
}
