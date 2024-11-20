using Core.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class MatchPlayers : BaseEntity
    {
        public long UserId { get; set; }
        public User? User { get; set; }
        public long MatchId { get; set; }
        public Match? Match { get; set; }
        public long? ReviewId { get; set; }
        public Review? Review { get; set; }
    }
}
