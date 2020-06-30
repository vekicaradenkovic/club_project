using Application.DTOs;
using Application.ViewModels;
using AutoMapper;
using Domain;

namespace Application.Profiles
{
	public class TeamRoleProfile : Profile
	{
        public override string ProfileName
        {
            get
            {
                return "TeamRoleProfile";
            }
        }

        public TeamRoleProfile()
        {
            ConfigureMappings();
        }


        /// <summary>
        /// Creates a mapping between source (Domain) and destination (ViewModel)
        /// </summary>
        private void ConfigureMappings()
        {
            // Citanje iz baze
            CreateMap<TeamRole, TeamRoleDto>()
                .ForMember(u => u.Id, usr => usr.MapFrom(x => x.Id))
                .ForMember(u => u.Name, usr => usr.MapFrom(x => x.RoleName))
                .ForMember(u => u.DateCreated, usr => usr.MapFrom(x => x.DateCreated))
                .ForMember(u => u.DateModified, usr => usr.MapFrom(x => x.DateModified))
                .ForMember(u => u.DeletedAt, usr => usr.MapFrom(x => x.DeletedAt))
                .ReverseMap();

            CreateMap<CreateTeamRoleDto, TeamRole>()
                .ForMember(u => u.RoleName, usr => usr.MapFrom(x => x.RoleName));
        }
    }
}
