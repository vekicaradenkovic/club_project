﻿using Application.DTOs;
using Application.Exceptions;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application
{
	public class UseCaseExecutor
	{
        private readonly IApplicationActor _actor;
        private readonly IUseCaseLogger _logger;
        public UseCaseExecutor(IApplicationActor actor, IUseCaseLogger logger)
        {
            this._actor = actor;
            this._logger = logger;
        }

        public TResult ExecuteQuery<TSearch, TResult>(IQuery<TSearch, TResult> query, TSearch search)
        {
            _logger.Log(query, _actor, search);

            if (!_actor.AllowedUseCases.Contains(query.Id))
            {
                throw new UnauthorizedUseCaseException(query, _actor);
            }

            return query.Execute(search);
        }

        public void ExecuteCommand<TRequest>(
            ICommand<TRequest> command,
            TRequest request)
        {
            _logger.Log(command, _actor, request);

            if (!_actor.AllowedUseCases.Contains(command.Id))
            {
                throw new UnauthorizedUseCaseException(command, _actor);
            }

            command.Execute(request);

        }

        public void ExecuteDeleteMultipleCommand<TRequest>(
            IDeleteMultipleCommand<TRequest> command,
            TRequest request, int id)
        {
            _logger.Log(command, _actor, request);

            if (!_actor.AllowedUseCases.Contains(command.Id))
            {
                throw new UnauthorizedUseCaseException(command, _actor);
            }

            command.Execute(request, id);

        }

        public void ExecuteUpdateCommand<TRequest>(
            IUpdateCommand<TRequest> command,
            TRequest request, int id)
        {
            _logger.Log(command, _actor, request);

            if (!_actor.AllowedUseCases.Contains(command.Id))
            {
                throw new UnauthorizedUseCaseException(command, _actor);
            }

            command.Execute(request,id);

        }
    }
}
