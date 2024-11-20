using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.DTO_s
{
    public class MatchPlayerDTO : BaseDTO
    {
        public long UserId { get; set; }
        public long MatchId { get; set; }
        public long? ReviewId { get; set; }
    }
}
