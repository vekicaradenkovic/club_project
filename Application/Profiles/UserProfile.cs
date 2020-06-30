using Application.DTOs;
using Application.ViewModels;
using AutoMapper;
using Domain;
using System.Linq;

namespace Application.Profiles
{
	public class UserProfile : Profile
	{
        public override string ProfileName
        {
            get
            {
                return "UserProfile";
            }
        }

        public UserProfile()
        {
            ConfigureMappings();
        }


        /// <summary>
        /// Creates a mapping between source (Domain) and destination (ViewModel)
        /// </summary>
        private void ConfigureMappings()
        {
            // Citanje iz baze
            CreateMap<User, ReadUserDto>()
                .ForMember(u => u.Id, usr => usr.MapFrom(x => x.Id))
                .ForMember(u => u.FirstName, usr => usr.MapFrom(x => x.FirstName))
                .ForMember(u => u.LastName, usr => usr.MapFrom(x => x.LastName))
                .ForMember(u => u.Username, usr => usr.MapFrom(x => x.Username))
                .ForMember(u => u.Password, usr => usr.MapFrom(x => x.Password))
                .ForMember(u => u.IsActive, usr => usr.MapFrom(x => x.IsActive))
                .ForMember(u => u.Email, usr => usr.MapFrom(x => x.Email))
                .ForMember(u => u.DateCreated, usr => usr.MapFrom(x => x.DateCreated))
                .ForMember(u => u.DateModified, usr => usr.MapFrom(x => x.DateModified))
                .ForMember(u => u.DeletedAt, usr => usr.MapFrom(x => x.DeletedAt))
                .ForMember(u => u.AllowedUseCases, usr => usr.MapFrom(x => x.UserUserCases.Select(x => x.UseCaseId)))
                .ReverseMap()
                .ForAllOtherMembers(x => x.Ignore());


            // Upis u bazu
            CreateMap<CreateUserDto, User>()
                .ForMember(u => u.FirstName, usr => usr.MapFrom(x => x.FirstName))
                .ForMember(u => u.LastName, usr => usr.MapFrom(x => x.LastName))
                .ForMember(u => u.Username, usr => usr.MapFrom(x => x.Username))
                .ForMember(u => u.Password, usr => usr.MapFrom(x => x.Password))
                .ForMember(u => u.Email, usr => usr.MapFrom(x => x.Email))
                .ForAllOtherMembers(x => x.Ignore());
        }
    }
}
