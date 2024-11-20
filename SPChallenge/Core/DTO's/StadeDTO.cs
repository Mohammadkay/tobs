using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Core.Enums;

namespace Core.DTO_s
{
    public class StadeDTO : BaseDTO
    {
        public string Name { get; set; }
        public string MobileNo { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public StadeStatus Status { get; set; }
        public string StatusDes { get; set; }
        public string? Longitude { get; set; }
        public string? Latitude { get; set; }
        public string? Image { get; set; }
        public string? ImageName { get; set; }
        public int Capacity { get; set; }
        public StadeType StadeType { get; set; }
    }
}
