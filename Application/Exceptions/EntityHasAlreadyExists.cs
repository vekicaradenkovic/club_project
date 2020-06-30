using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
	public class EntityHasAlreadyExists : Exception
	{
		public EntityHasAlreadyExists(string message):base(message)
		{

		}
	}
}
