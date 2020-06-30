using Application;
using Application.Commands;
using Application.DTOs;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace EfCommands
{
	public class EfGetUserCommand : BaseCommand, IGetUserCommand
	{
		private readonly IGetUsersAsQueriable _usersCommand;
		public EfGetUserCommand(ClubDbContext context, IGetUsersAsQueriable usersCommand) : base(context)
		{
			_usersCommand = usersCommand;
		}

		public int Id => 2;

		public string Name => "Get Selected User";

		public ReadUserDto Execute(int userId)
		{
			var foundedUser = _usersCommand.GetNotDeletedUsersWithUseCases().FirstOrDefault(x => x.Id == userId);
			if (foundedUser == null)
			{
				throw new EntityNotFoundException(userId,typeof(User));
			}

			return AutoMapperConfiguration.Mapper.Map<ReadUserDto>(foundedUser);
		}
	}
}
