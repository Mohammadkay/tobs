using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using static Core.Enums;

namespace Core.DTO_s
{
    public class UserDTO : BaseDTO
    {
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Gender Gender { get; set; }
        public string MobileNo { get; set; }
        public string Email { get; set; }
        public DateTime BirthDate { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public UserStatus Status { get; set; }
        public UserType UserType { get; set; }
        public string? Image { get; set; }
        public string? ImageName { get; set; }
        public long Points { get; set; }
    }
}
