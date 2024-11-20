using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.Shared;

namespace Core.Entities
{
    public class Review : BaseEntity
    {
        public double StadeRview { get; set; }
        public double GameRview { get; set; }
        public double RefreeRview { get; set; }
        public string Comments { get; set; }
        public ICollection<MatchPlayers>? MatchPlayers { get; set; }
    }
}
