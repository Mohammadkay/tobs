using Core.Shared;
using System.Text;
using static Core.Enums;
using System.Security.Cryptography;
using System.Text.Json.Serialization;
using Core.Interfaces;

namespace Core.Entities
{
    public class User : BaseEntity, IImageEntity
    {
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Gender Gender { get; set; }
        public string MobileNo { get; set; }
        public string Email { get; set; }
        public DateTime BirthDate { get; set; }
        [JsonIgnore]
        public byte[] PasswordHash { get; set; }
        [JsonIgnore]
        public byte[] PasswordSalt { get; set; }
        public string Address { get; set; }
        public UserStatus Status { get; set; }
        public int PasswordTries { get; set; }
        public string? Notes { get; set; }
        public DateTime LastLoginDate { get; set; }
        public UserType UserType { get; set; }
        public string? Image { get; set; }
        public string? ImageName { get; set; }
        public long Points { get; set; }
        public PlayerStatistics? PlayerStatistics { get; set; }
        [JsonIgnore]
        public ICollection<MatchPlayers>? MatchPlayers { get; set; }
        public ICollection<Match>? Matchs { get; set; }

        public string Password
        {
            set
            {
                using (var hmac = new HMACSHA512())
                {
                    this.PasswordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(value));
                    this.PasswordSalt = hmac.Key;
                }
            }
        }

    }
}
