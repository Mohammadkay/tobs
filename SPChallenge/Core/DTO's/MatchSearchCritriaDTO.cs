using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Core.Enums;

namespace Core.DTO_s
{
    public class MatchSearchCritriaDTO
    {
        public int? Id { get; set; }
        public DateTime? StartDateFrom { get; set; }
        public DateTime? EndDateTo { get; set; }
        public int? Gender { get; set; }
        public int? AgeFrom { get; set; }
        public int? AgeTo { get; set; }
        public decimal? Price { get; set; }
        public long? StadeId { get; set; }
        public int pageSize { get; set; }
        public int pageNo { get; set; }
    }
}
