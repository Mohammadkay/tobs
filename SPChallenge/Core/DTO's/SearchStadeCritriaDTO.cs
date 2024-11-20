using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.DTO_s
{
    public class SearchStadeCritriaDTO
    {
        public long? Id { get; set; }
        public string? Name { get; set; }
        public string? Address { get; set; }
        public int? Capacity { get; set; }
        public bool? IncludeServices { get; set; }
        public int pageSize { get; set; }
        public int pageNo { get; set; }
    }
}
