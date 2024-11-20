using Core.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class StadeProvidedServices : BaseEntity
    {
        public long StadeId { get; set; }
        public Stade? Stade { get; set; }
        public long StadeServiceId { get; set; }
        public StadeService? StadeService { get; set; }
    }
}
