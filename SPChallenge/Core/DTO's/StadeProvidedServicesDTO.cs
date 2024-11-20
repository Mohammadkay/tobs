using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.DTO_s
{
    public class StadeProvidedServicesDTO : BaseDTO
    {
        public long StadeId { get; set; }
        public long StadeServiceId { get; set; }
    }
}
