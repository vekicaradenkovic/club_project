using Application.Profiles;
using AutoMapper;
using System;

namespace Application
{
    public class AutoMapperConfiguration
    {
        public static readonly Lazy<IMapper> Lazy = new Lazy<IMapper>(() =>
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<UserProfile>();
                cfg.AddProfile<TeamRoleProfile>();
                cfg.AddProfile<TeamMemberProfile>();
                cfg.AddProfile<TeamProfile>();
                cfg.AddProfile<PositionProfile>();
                cfg.AddProfile<CountryProfile>();
                cfg.AddProfile<UseCaseProfile>();
            });

            var mapper = config.CreateMapper();
            return mapper;
        });

        public static IMapper Mapper => Lazy.Value;
    }
}
