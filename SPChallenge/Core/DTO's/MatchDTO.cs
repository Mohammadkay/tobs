using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Core.Enums;

namespace Core.DTO_s
{
    public class MatchDTO : BaseDTO
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
        public long? ManOfTheGameId { get; set; }
    }
}
