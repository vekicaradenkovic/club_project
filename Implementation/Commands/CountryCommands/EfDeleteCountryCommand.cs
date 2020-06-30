using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using Implementation.Commnds;

namespace Implementation.Commands
{
	public class EfDeleteCountryCommand : BaseCommand, IDeleteCountryCommand
	{
		public EfDeleteCountryCommand(ClubDbContext context) : base(context)
		{
		}

		public int Id => 30;

		public string Name => "Delete selected country";

		public void Execute(int request)
		{
			var country = Context.Countries.Find(request);

			if (country == null)
			{
				throw new EntityNotFoundException(request, typeof(Country));
			}

			Context.Countries.Remove(country);
			Context.SaveChanges();
		}
	}
}
