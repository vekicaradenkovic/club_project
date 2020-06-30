using Application.ViewModels;
using EfDataAccess;
using FluentValidation;
using System.Linq;

namespace Implementation.Validators
{
	public class RegisterUserValidator : AbstractValidator<CreateUserDto>
	{
		public RegisterUserValidator(ClubDbContext context)
		{
            RuleFor(x => x.FirstName).NotEmpty();
            RuleFor(x => x.LastName).NotEmpty();
            RuleFor(x => x.Password)
                .NotEmpty()
                .MinimumLength(6);

            RuleFor(x => x.Username)
                .NotEmpty()
                .MinimumLength(4)
                .Must(x => !context.Users.Any(user => user.Username == x))
                .WithMessage("Username is already taken.");

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress();
        }
	}
}
