using Application.ViewModels;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;

namespace Implementation.Validators
{
	public class CreateUseCaseToUserValidator : AbstractValidator<CreateUserUseCaseDto>
	{
		public CreateUseCaseToUserValidator(ClubDbContext context)
		{
			RuleFor(x => x.UserId)
								.NotEmpty()
								.Must(x => context.Users.Any(user => user.Id == x))
								.WithMessage("Selected user does not exist.");

			RuleFor(x => x.UseCaseId)
								.NotEmpty()
								.Must(z => context.UseCases.Select(y => y.Id).ToList().Any(y => z.Contains(y)))
								.WithMessage("Selected use case does not exist.");
		}
	}
}
