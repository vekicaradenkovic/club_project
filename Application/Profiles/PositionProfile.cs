using Application.DTOs;
using Application.ViewModels;
using AutoMapper;
using Domain;

namespace Application.Profiles
{
    public class PositionProfile : Profile
    {
        public override string ProfileName
        {
            get
            {
                return "PositionProfile";
            }
        }

        public PositionProfile()
        {
            ConfigureMappings();
        }


        /// <summary>
        /// Creates a mapping between source (Domain) and destination (ViewModel)
        /// </summary>
        private void ConfigureMappings()
        {
            CreateMap<Position, PositionDto>()
                .ForMember(u => u.Id, usr => usr.MapFrom(x => x.Id))
                .ForMember(u => u.PositionName, usr => usr.MapFrom(x => x.PositionName))
                .ForMember(u => u.DateCreated, usr => usr.MapFrom(x => x.DateCreated))
                .ForMember(u => u.DateModified, usr => usr.MapFrom(x => x.DateModified))
                .ForMember(u => u.DeletedAt, usr => usr.MapFrom(x => x.DeletedAt))
                .ReverseMap();

            CreateMap<CreatePositionDto, Position>()
                .ForMember(u => u.PositionName, usr => usr.MapFrom(x => x.PositionName))
                .ReverseMap();
        }
    }
}
