using Core.Entities;
using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using System.Security.Principal;
using Core.DTO_s;

namespace Infrastructure.Data.Repository
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        private readonly DBChallange _DB;
        public UserRepository(DBChallange DB) : base(DB)
        {
            _DB = DB;
        }

        public async Task<User?> GetUserInfoByUserName(string UserName)
        {
            User? oUser = await _DB.Users.AsNoTracking().Where(entity => entity.UserName.ToLower().Equals(UserName.ToLower())).FirstOrDefaultAsync();
            return oUser;
        }

        public async Task<User?> GetUserInfoByMobileNo(string UserName)
        {
            User? oUser = await _DB.Users.AsNoTracking().Where(entity => entity.MobileNo.ToLower().Equals(UserName.ToLower())).FirstOrDefaultAsync();
            return oUser;
        }

        public async Task<bool> CheckUserName(string UserName)
        {
            bool Exists = await _DB.Users.AsNoTracking().Where(entity => entity.UserName.ToLower().Equals(UserName.ToLower())).AnyAsync();
            return Exists;
        }

        public async Task<bool> CheckMobileNo(string MobileNo, string? UserName)
        {
            bool Exists = await _DB.Users.AsNoTracking().Where(entity => entity.MobileNo.ToLower().Equals(MobileNo.ToLower()) && (string.IsNullOrEmpty(UserName) || entity.UserName != UserName)).AnyAsync();
            return Exists;
        }

        public async Task<IEnumerable<User>> UpdateRange(IEnumerable<User> entities)
        {
            foreach (User entity in entities)
            {
                User oUser = _DB.Users.Find(entity.Id);

                if (oUser != null)
                {
                    entity.PasswordHash = oUser.PasswordHash;
                    entity.PasswordSalt = oUser.PasswordSalt;
                    entity.UserName = oUser.UserName; 
                }               

                entity.ModificationDate = DateTime.Now;
            }
            _DB.Users.UpdateRange(entities);
            await SaveChangesAsync();

            return entities;
        }

        public async Task<PlayerStatistics> AddPlayerStatistics(PlayerStatistics playerStatistics)
        {
            playerStatistics.Assist = 0;
            playerStatistics.Goals = 0;
            playerStatistics.RedCard = 0;
            playerStatistics.YellowCard = 0;
            playerStatistics.CreationDate = DateTime.Now;

            await _DB.PlayerStatistics.AddAsync(playerStatistics);
            await SaveChangesAsync();

            return playerStatistics;
        }

        public async Task<PlayerStatistics> UpdatePlayerStatistics(PlayerStatistics playerStatistics)
        {
            playerStatistics.ModificationDate = DateTime.Now;
            _DB.PlayerStatistics.Attach(playerStatistics);
            await _DB.SaveChangesAsync();

            return playerStatistics;
        }

        public async Task<PlayerStatistics?> LoadPlayerStatistics(long UserId)
        {
            PlayerStatistics? playerStatistics = await _DB.PlayerStatistics.Where(s=>s.UserId == UserId).FirstOrDefaultAsync();

            return playerStatistics;
        }
    }
}

