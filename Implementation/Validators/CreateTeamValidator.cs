using Application.ViewModels;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators
{
	public class CreateTeamValidator : AbstractValidator<CreateTeamDto>
	{
		public CreateTeamValidator()
		{
			RuleFor(x => x.Name).MaximumLength(80).NotEmpty();
		}
	}
}
