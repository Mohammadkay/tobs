using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Interface
{
    public interface ILoginService
    {
        string GenerateToken(User user);
        Task<IResponseResult<UserTokenDTO>> Login(UserLoginDTO userLogin);
    }
}
