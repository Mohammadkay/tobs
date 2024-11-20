using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.DTO_s
{
    public class BaseDTO
    {
        public long Id { get; set; }
        public DateTime? CreationDate { get; set; } = DateTime.Now;
        public string? CreatedBy { get; set; }
        public DateTime? ModificationDate { get; set; }
        public string? ModifiedBy { get; set; }
    }
}
