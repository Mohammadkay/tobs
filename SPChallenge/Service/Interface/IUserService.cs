using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Interface
{
    public interface IUserService : IService<User>
    {
        Task<ResponseResult<User>> GetUserInfoByUserName(string UserName);
        Task<ResponseResult<bool?>> CheckUserName(string UserName);
        Task<ResponseResult<UserDTO>> AddPlayer(UserDTO oPlayer);
        Task<ResponseResult<UserDTO>> UpdatePlayer(UserDTO oPlayer);
        Task<ResponseResult<UserDTO>> GetPlayerInfoByUserName(string UserName);
        Task<IResponseResult<IEnumerable<Core.Entities.User>>> SearchUser(SearchUserCritriaDTO oSearchCritria);
        Task<IResponseResult<string>> ChangeUserStatus(string UserName, int Status);
        Task<IResponseResult<User>> Add(UserDTO entity);
        Task<IResponseResult<User>> Update(UserDTO entity);
        Task<IResponseResult<string>> UpdateUserNote(string UserName, string Note);
        Task<ResponseResult<PlayerStatistics>> AddPlayerStatistics(PlayerStatistics playerStatistics);
        Task<ResponseResult<PlayerStatistics>> UpdatePlayerStatistics(PlayerStatistics playerStatistics);
        Task<ResponseResult<PlayerStatistics>> UpdatePlayerStatistics(PlayerStatisticsDTO playerStatistics);
        Task<ResponseResult<PlayerStatistics>> LoadPlayerStatistics(long ID);
    }
}
