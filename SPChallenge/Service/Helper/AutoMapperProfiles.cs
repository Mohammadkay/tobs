using AutoMapper;
using AutoMapper.Execution;
using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Helper
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            //string Error = string.Empty;
            
            CreateMap<User, UserDTO>()
                /*.ForMember(M => M.Image,
                opt => opt.MapFrom(U => ImageHandler.LoadImage(U.ImageName,Enums.ImagesTypes.User, false, string.Empty,ref Error)))*/
                .ForMember(M => M.Password,
                opt => opt.MapFrom(user => string.Empty));
       
        }
    }
}
