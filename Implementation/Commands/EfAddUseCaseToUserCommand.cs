using Application.Commands;
using Application.Exceptions;
using Application.ViewModels;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implementation.Commands
{
	public class EfAddUseCaseToUserCommand : BaseCommand, IAddUseCaseToUserCommand
	{
		private readonly CreateUseCaseToUserValidator _validator;
		public EfAddUseCaseToUserCommand(ClubDbContext context, CreateUseCaseToUserValidator validator) : base(context)
		{
			_validator = validator;
		}

		public int Id => 33;

		public string Name => "Add use case to user";

		public void Execute(CreateUserUseCaseDto request)
		{
			if (request == null)
			{
				throw new BadRequestException("User use case is not passed.");
			}
			try
			{
				_validator.ValidateAndThrow(request);
			}
			catch (ValidationException ex)
			{
				throw new ValidationException(ex.Message);
			}

			var skipUseCases = Context.UserUseCases.Where(x => x.UserId == request.UserId && request.UseCaseId.Contains(x.UseCaseId))
													.Select(x => x.UseCaseId);

			var useCasesToInsert = request.UseCaseId.Where(x => !skipUseCases.Contains(x))
													.Select(x => new UserUseCase() { UseCaseId = x, UserId = request.UserId  })
													.ToList();

			Context.UserUseCases.AddRange(useCasesToInsert);
			Context.SaveChanges();
		}
	}
}
