using Application;
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
	public class EfUpdateUserCommand : BaseCommand, IUpdateUserCommand
	{
		private readonly UpdateUserValidator _validator;
		public EfUpdateUserCommand(ClubDbContext context, UpdateUserValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 5;

		public string Name => "Update User";

		public void Execute(UpdateUserDto request, int id)
		{
			if(request == null)
			{
				throw new BadRequestException("User data is not passed.");
			}

			_validator.ValidateAndThrow(request);
			var user = Context.Users.Find(id);
			if(user == null)
			{
				throw new EntityNotFoundException(id,typeof(User));
			}
			user.FirstName = request.FirstName;
			user.LastName = request.LastName;
			user.Email = request.Email;
			Context.Users.Update(user);
			Context.SaveChanges();
		}
	}
}
