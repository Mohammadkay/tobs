using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Core.Shared;
using static Core.Enums;

namespace Core.Entities
{
    public class Match : BaseEntity
    {
        public string Name { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int Capacity { get; set; }
        public Gender Gender { get; set; }
        public int AgeFrom { get; set; }
        public int AgeTo { get; set; }
        public decimal Price { get; set; }
        public long StadeId { get; set; }
        public Stade? Stade { get; set; }
        public long? ManOfTheGameId { get; set; }
        public User? ManOfTheGame { get; set; }
        [JsonIgnore]
        public ICollection<MatchPlayers>? MatchPlayers { get; set; }
    }
}
