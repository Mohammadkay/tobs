using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.DTO_s
{
    public class PlayerStatisticsDTO : BaseDTO
    {
        public int? YellowCard { get; set; }
        public int? RedCard { get; set; }
        public int? Goals { get; set; }
        public int? Assist { get; set; }
        public long UserId { get; set; }
    }
}
