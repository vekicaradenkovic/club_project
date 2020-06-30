using Application.SearchObjects;
using EfDataAccess;
using FluentValidation;

namespace Implementation.Validators
{
	public class SearchValidator : AbstractValidator<BaseSearchQuery>
	{
		public SearchValidator()
		{
			RuleFor(x => x.Keywords).NotEmpty();
		}
	}
}
