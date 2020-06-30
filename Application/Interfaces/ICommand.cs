using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Interfaces
{
	public interface ICommand<TRequest> : IUseCase
	{
		public void Execute(TRequest request);
	}

	public interface IDeleteMultipleCommand<TRequest> : IUseCase
	{
		public void Execute(TRequest request, int id);
	}

	public interface IUpdateCommand<TRequest> : IUseCase
	{
		public void Execute(TRequest request, int id);
	}

	public interface IQuery<TRequest, TResult> : IUseCase
	{
		TResult Execute(TRequest request);
	}
}
