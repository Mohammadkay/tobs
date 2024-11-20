using Core.Entities;
using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Infrastructure.Data.Repository
{
    public class StadeProvdiedServicesRepository : Repository<StadeProvidedServices>, IStadeProvdiedServicesRepository
    {
        private readonly DBChallange _DB;
        public StadeProvdiedServicesRepository(DBChallange context) : base(context)
        {
            _DB = context;
        }
    }
}
