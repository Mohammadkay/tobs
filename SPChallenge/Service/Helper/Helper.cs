using Core.DTO_s;
using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class Helper
    {
        public static class Encryption
        {
            public static void Encrypt(string Password, out byte[] HashPassword, out byte[] SaltPassword)
            {
                using (var hmac = new HMACSHA512())
                {
                    SaltPassword = hmac.Key;
                    HashPassword = hmac.ComputeHash(Encoding.UTF8.GetBytes(Password));
                }
            }

            public static bool Check(string LoginPassword, byte[] SaltPassword, byte[] PasswordHash)
            {
                using (var hmac = new HMACSHA512(SaltPassword))
                {
                    var computedHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(LoginPassword));

                    for (int i = 0; i < computedHash.Length; i++)
                    {
                        if (computedHash[i] != PasswordHash[i])
                        {
                            return false;
                        }
                    }
                }

                return true;
            }
                        
        }
    }
}
