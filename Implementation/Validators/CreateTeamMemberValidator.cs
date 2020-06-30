using Application.ViewModels;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
	public class CreateTeamMemberValidator : AbstractValidator<CreateTeamMemberDto>
	{
		public CreateTeamMemberValidator(ClubDbContext context)
		{
			RuleFor(x => x.FirstName)
									.MaximumLength(70)
									.NotEmpty();

			RuleFor(x => x.LastName)
									.MaximumLength(70)
									.NotEmpty();

			RuleFor(x => x.Image).NotEmpty();


			RuleFor(x => x.TeamId)
								.NotEmpty()
								.Must(x => context.Teams.Any(team => team.Id == x))
								.WithMessage("Selected team does not exist.");

			RuleFor(x => x.CountryId)
								.NotEmpty()
								.Must(x => context.Countries.Any(team => team.Id == x))
								.WithMessage("Selected country does not exist.");

			RuleFor(x => x.TeamRoleId)
								.NotEmpty()
								.Must(x => context.Teams.Any(team => team.Id == x))
								.WithMessage("Selected team role does not exist.");
		}
	}
}
