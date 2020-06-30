using Application;
using Application.Commands;
using Application.DTOs;
using Application.Helpers;
using Application.SearchObjects;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Commnds;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Cache;
using System.Text;

namespace Implementation.Commands
{
	public class EfGetTeamRolesCommand : BaseCommand, IGetTeamRolesCommand
	{
		private readonly PagedResponseHelper<TeamRoleDto, TeamRole> _helper;
		public EfGetTeamRolesCommand(ClubDbContext context) : base(context)
		{
			_helper = new PagedResponseHelper<TeamRoleDto, TeamRole>();
		}

		public int Id => 6;

		public string Name => "Get Team Roles";

		public PagedResponse<TeamRoleDto> Execute(TeamRoleSearchObject request)
		{
			var query = Context.TeamRoles.Where(x => x.DeletedAt == null).AsQueryable();
			if(request != null)
			{
				if (!string.IsNullOrEmpty(request.Keywords) || !string.IsNullOrWhiteSpace(request.Keywords))
				{
					query = query.Where(x => x.RoleName.Contains(request.Keywords));
				}
			}

			return _helper.GetResponse(query, request);
		}
	}
}
