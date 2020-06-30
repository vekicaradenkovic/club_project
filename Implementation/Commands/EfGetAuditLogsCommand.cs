using Application.Commands;
using Application.DTOs;
using Application.Helpers;
using Application.Interfaces;
using Application.SearchObjects;
using Domain;
using EfDataAccess;
using Implementation.Commnds;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace Implementation.Commands
{
	public class EfGetAuditLogsCommand : BaseCommand, IGetAuditLogsCommand
	{
		public EfGetAuditLogsCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 31;

		public string Name => "Get users activity";

		public PagedResponse<AuditLogDto> Execute(AuditLogSearchObject request)
		{
			var auditLogs = Context.UseCaseLogs.Join(Context.Users, x => x.UserId, u => u.Id, (x,u) => new { UseCaseLog = x, User = u }).AsQueryable();

			if (!auditLogs.Any() || auditLogs == null)
			{
				return new PagedResponse<AuditLogDto>()
				{
					CurrentPage = request.Page,
					ItemsPerPage = request.PerPage,
					TotalCount = 0,
					Items = null
				};
			}

			if (request != null)
			{
				if (!string.IsNullOrEmpty(request.Keywords) || !string.IsNullOrWhiteSpace(request.Keywords))
				{
					auditLogs = auditLogs.Where(x => x.User.Username.ToLower().Contains(request.Keywords.ToLower()) || x.User.FirstName.ToLower().Contains(request.Keywords.ToLower()) || x.User.LastName.ToLower().Contains(request.Keywords.ToLower()));
				}
				if(request.StartDate != null)
				{
					auditLogs = auditLogs.Where(x => x.UseCaseLog.Date >= request.StartDate);
				}
				if (request.EndDate != null)
				{
					auditLogs = auditLogs.Where(x => x.UseCaseLog.Date >= request.EndDate);
				}
				if(request.UserId > 0)
				{
					auditLogs = auditLogs.Where(x => x.User.Id == request.UserId);
				}
			}

			var skipCount = request.PerPage * (request.Page - 1);

			return new PagedResponse<AuditLogDto>()
			{
				CurrentPage = request.Page,
				ItemsPerPage = request.PerPage,
				TotalCount = auditLogs.Count(),
				Items = auditLogs?.Skip(skipCount).Take(request.PerPage).Select(x => new AuditLogDto
				{
					Data = x.UseCaseLog.Data,
					Date = x.UseCaseLog.Date,
					UseCaseName = x.UseCaseLog.UseCaseName,
					Username = x.User.Username,
					Id = x.UseCaseLog.Id
				})
			};
		}
	}
}
