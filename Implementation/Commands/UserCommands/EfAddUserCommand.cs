using Application;
using Application.Commands;
using Application.DTOs;
using Application.Email;
using Application.ViewModels;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;

namespace EfCommands
{
	public class EfAddUserCommand : BaseCommand, IAddUserCommand
	{
		private readonly RegisterUserValidator _validator;
		private readonly IEmailSender _sender;
		public EfAddUserCommand(ClubDbContext context, RegisterUserValidator validator, IEmailSender sender) : base(context)
		{
			_validator = validator;
			_sender = sender;
		}

		public int Id => 3;

		public string Name => "Register User";

		public void Execute(CreateUserDto request)
		{
            if (request != null)
            {
				try
				{
					_validator.ValidateAndThrow(request);
				}
				catch (ValidationException ex)
				{
					throw new ValidationException(ex.Message);
				}

				var user = AutoMapperConfiguration.Mapper.Map<User>(request);
				Context.Users.Add(user);
                Context.SaveChanges();

				_sender.Send(new SendEmailDto
				{
					Content = "<h1>Successfull registration!</h1>",
					SendTo = request.Email,
					Subject = "Registration"
				});

				var insertedUser = Context.Users.Find(user.Id);
				insertedUser.IsActive = true;
				Context.Users.Update(insertedUser);
				Context.SaveChanges();
			}
        }
	}
}
