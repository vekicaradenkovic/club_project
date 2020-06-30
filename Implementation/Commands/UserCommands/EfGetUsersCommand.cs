using Application.Commands;
using Application.DTOs;
using Application.Helpers;
using Application.Interfaces;
using Application.SearchObjects;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System.Linq;

namespace EfCommands
{
	public class EfGetUsersCommand : BaseCommand, IGetUsersCommand
	{
		private readonly IGetUsersAsQueriable _usersCommand;
		private readonly IPagedResponseHelper<ReadUserDto, User> _helper;
		public EfGetUsersCommand(ClubDbContext context, IGetUsersAsQueriable usersCommand) : base(context)
		{
			_usersCommand = usersCommand;
			_helper = new PagedResponseHelper<ReadUserDto, User>();
		}

		public int Id => 1;
		public string Name => "Get All Users";

		public PagedResponse<ReadUserDto> Execute(UserSearchObject request)
		{
			var users = _usersCommand.GetNotDeletedUsersWithUseCases();

			if (!users.Any() || users == null)
			{
				return new PagedResponse<ReadUserDto>()
				{
					CurrentPage = request.Page,
					ItemsPerPage = request.PerPage,
					TotalCount = 0,
					Items = null
				};
			}

			if(request != null)
			{
				if (!string.IsNullOrEmpty(request.Username) || !string.IsNullOrWhiteSpace(request.Username))
				{
					users = users.Where(x => x.Username.ToLower().Contains(request.Username.ToLower()));
				}
			}

			return _helper.GetResponse(users, request);
		}
	}
}
