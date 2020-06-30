using Application.Interfaces;
using EfDataAccess;
using Implementation.Commnds;
using Newtonsoft.Json;
using System;

namespace Implementation.Logging
{
	public class DatabaseUseCaseLogger : BaseCommand, IUseCaseLogger
	{
		public DatabaseUseCaseLogger(ClubDbContext context) : base(context)
		{
		}

		public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
		{
			Context.UseCaseLogs.Add(new Domain.UseCaseLog
			{
				UserId = actor.Id,
				Data = JsonConvert.SerializeObject(useCaseData),
				Date = DateTime.UtcNow,
				UseCaseName = useCase.Name
			});

			Context.SaveChanges();
		}
	}
}
