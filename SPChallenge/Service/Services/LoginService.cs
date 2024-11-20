using AutoMapper;
using Core.DTO_s;
using Core.Entities;
using Core.Interfaces;
using Core.Shared;
using Microsoft.IdentityModel.Tokens;
using Service.Interface;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using static Core.Enums;

namespace Service.Services
{
    public class LoginService : ILoginService
    {  // To generate token

        private readonly IUnitOfWorkRepository _UnitOfWork;
        private readonly SymmetricSecurityKey _key;
        private readonly IMapper _Mapper;
        public LoginService(IUnitOfWorkRepository UnitOfWork, IMapper Mapper)
        {
            _UnitOfWork = UnitOfWork;
            string skey = AppConfig.Jwt.Key;

            if (skey.Length < 64)
            {
                throw new Exception("Jwt Key must be at least 64 character");
            }

            _key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(skey));
            _Mapper = Mapper;
        }

        #region GenerateToken
        public string GenerateToken(User user)
        {
            var credentials = new SigningCredentials(_key, SecurityAlgorithms.HmacSha512Signature);

            var claims = new[]
            {
                new Claim(ClaimTypes.Name,user.UserName),
                new Claim(ClaimTypes.Role,((Core.Enums.UserType)user.UserType).ToString())
            };

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.Now.AddHours(12),
                SigningCredentials = credentials,
                Issuer = AppConfig.Jwt.Issuer,
                Audience = AppConfig.Jwt.Audience
            };

            var tokenhandler = new JwtSecurityTokenHandler();

            var token = tokenhandler.CreateToken(tokenDescriptor);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
        #endregion

        #region Login
        public async Task<IResponseResult<UserTokenDTO>> Login(UserLoginDTO userLogin)
        {
            string Error = string.Empty;
            UserTokenDTO oUserToken = new UserTokenDTO();
            var user = await _UnitOfWork.User.Value.GetUserInfoByUserName(userLogin.UserName);

            if (user == null)
            {
                user = await _UnitOfWork.User.Value.GetUserInfoByMobileNo(userLogin.UserName);
            }

            if (user != null && user.Id > 0)
            {
                if (user.PasswordTries < 3)
                {
                    bool HasAccess = Helper.Encryption.Check(userLogin.Password, user.PasswordSalt, user.PasswordHash);

                    if (HasAccess)
                    {
                        var token = GenerateToken(user);

                        if (string.IsNullOrEmpty(token))
                        {
                            return new ResponseResult<UserTokenDTO>()
                            {
                                Errors = new List<string>() { "Error In Generate Token" },
                                Status = ResultStatus.Fail,
                                Data = null,
                                TotalRecords = 0
                            };
                        }
                        else
                        {
                            oUserToken.Token = token;
                            oUserToken.User = _Mapper.Map<UserDTO>(user);

                            return new ResponseResult<UserTokenDTO>()
                            {
                                Errors = new List<string>(),
                                Status = ResultStatus.Success,
                                Data = oUserToken,
                                TotalRecords = 0
                            };
                        }
                    }
                    else
                    {
                        user.PasswordTries++;
                        await _UnitOfWork.User.Value.Update(user);

                        return new ResponseResult<UserTokenDTO>()
                        {
                            Errors = new List<string>() { "Invalid Password" },
                            Status = ResultStatus.Fail,
                            Data = null,
                            TotalRecords = 0
                        };
                    }
                }
                else
                {
                    return new ResponseResult<UserTokenDTO>()
                    {
                        Errors = new List<string>() { "User Is Blocked" },
                        Status = ResultStatus.Fail,
                        Data = null,
                        TotalRecords = 0
                    };
                }
            }
            else
            {
                return new ResponseResult<UserTokenDTO>()
                {
                    Errors = new List<string>() { "User not found" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
        }
        #endregion
    }
}
