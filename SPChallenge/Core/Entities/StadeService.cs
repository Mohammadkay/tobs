using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.Interfaces;
using Core.Shared;

namespace Core.Entities
{
    public class StadeService : BaseEntity, IImageEntity
    {
        public string Name { get; set; }
        public string Image { get; set; }
        public string? ImageName { get; set; }
        public ICollection<StadeProvidedServices>? StadeProvdiedServices { get; set; }
    }
}
