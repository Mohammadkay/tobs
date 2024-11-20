using Core.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class PlayerStatistics : BaseEntity
    {
        public int YellowCard { get; set; }
        public int RedCard { get; set; }
        public int Goals { get; set; }
        public int Assist { get; set; }
        public long UserId { get; set; }
        [JsonIgnore]
        public User? User { get; set; }
    }
}
