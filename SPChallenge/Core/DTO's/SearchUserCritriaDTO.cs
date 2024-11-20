using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Core.Enums;

namespace Core.DTO_s
{
    public class SearchUserCritriaDTO
    {
        public long? Id { get; set; }
        public string? UserName { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public int? Gender { get; set; }
        public string? MobileNo { get; set; }
        public string? Email { get; set; }
        public int? UserType { get; set; }
        public bool? IncludePlayerStatistics { get; set; }
        public int pageSize { get; set; }
        public int pageNo { get; set; }
    }
}
