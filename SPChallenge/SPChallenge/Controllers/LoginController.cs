using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Service;
using Service.Interface;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using static Core.Enums;

namespace SPChallengeAPI.Controllers
{
    public class LoginController : BaseController
    {
        private readonly IUnitOfWorkService _UnitOfWork;

        private readonly IConfiguration _config;
        public LoginController(IConfiguration config, IUnitOfWorkService UnitOfWork)
        {
            _config = config;
            _UnitOfWork = UnitOfWork;
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IResponseResult<UserTokenDTO>> Login([FromBody] UserLoginDTO userLogin)
        {
           return await _UnitOfWork.Login.Value.Login(userLogin);
        }
    }
}
