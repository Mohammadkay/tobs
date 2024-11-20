using Core.DTO_s;
using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IUserRepository : IRepository<User>
    {
        Task<User?> GetUserInfoByUserName(string UserName);
        Task<User?> GetUserInfoByMobileNo(string UserName);
        Task<bool> CheckUserName(string UserName);
        Task<bool> CheckMobileNo(string MobileNo, string? UserName);
        Task<PlayerStatistics> AddPlayerStatistics(PlayerStatistics playerStatistics);
        Task<PlayerStatistics> UpdatePlayerStatistics(PlayerStatistics playerStatistics);
        Task<PlayerStatistics> LoadPlayerStatistics(long ID);
    }
}
