using System;
using System.Collections.Generic;

namespace Application.Interfaces
{
    public interface IApplicationActor
    {
        int Id { get; set; }
        string Username { get; set; }
        IEnumerable<int> AllowedUseCases { get; set; } //1
    }
}
