using Application;
using Application.Commands;
using Application.DTOs;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implementation.Commands
{
	public class EfGetTeamRoleCommand : BaseCommand, IGetTeamRoleCommand
	{
		public EfGetTeamRoleCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 7;

		public string Name => "Get Selected Team Role";

		public TeamRoleDto Execute(int request)
		{
			var foundedTeamRole = Context.TeamRoles.Where(x => x.DeletedAt == null).FirstOrDefault(x => x.Id == request);
			if (foundedTeamRole == null)
			{
				throw new EntityNotFoundException(request, typeof(TeamRole));
			}

			return AutoMapperConfiguration.Mapper.Map<TeamRoleDto>(foundedTeamRole);
		}
	}
}
