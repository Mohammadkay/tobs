using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.DTO_s
{
    public class StadeServiceSearchCritriaDTO
    {
        public long? StadeId { get; set; }
        public int pageSize { get; set; }
        public int pageNo { get; set; }
    }
}
