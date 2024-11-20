using Core.Entities;
using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data.Repository
{
    public class ReviewRepository : Repository<Review>, IReviewRepository
    {
        private readonly DBChallange _DB;
        public ReviewRepository(DBChallange DB) : base(DB)
        {
            _DB = DB;
        }
    }
}
