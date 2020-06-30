using Application.ViewModels;
using FluentValidation;

namespace Implementation.Validators
{
	public class CreateTeamRoleValidator : AbstractValidator<CreateTeamRoleDto>
	{
		public CreateTeamRoleValidator()
		{
			RuleFor(x => x.RoleName).MinimumLength(3).MaximumLength(50);
		}
	}
}
