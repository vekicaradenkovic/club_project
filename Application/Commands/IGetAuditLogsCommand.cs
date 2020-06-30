using Application.DTOs;
using Application.Interfaces;
using Application.SearchObjects;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
	public interface IGetAuditLogsCommand : IQuery<AuditLogSearchObject,PagedResponse<AuditLogDto>>
	{
	}
}
