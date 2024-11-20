using Core.Interfaces;
using Infrastructure.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data.UnitOfWork
{
    public class UnitOfWorkRepository : IUnitOfWorkRepository
    {
        private readonly DBChallange _DB;
        public Lazy<IMatchRepository> Match { get; set; }
        public Lazy<IReviewRepository> Review { get; set; }
        public Lazy<IStadeRepository> Stade { get; set; }
        public Lazy<IStadeServicesRepository> StadeServices { get; set; }
        public Lazy<IUserRepository> User { get; set; }
        public Lazy<IMatchPlayersRepository> MatchPlayers { get; set; }
        public Lazy<IStadeProvdiedServicesRepository> StadeProvdiedServices { get; set; }

        public UnitOfWorkRepository(DBChallange DB)
        {
            _DB = DB;
            Match = new Lazy<IMatchRepository>(() => new MatchRepository(DB));
            Review = new Lazy<IReviewRepository>(() => new ReviewRepository(DB));
            Stade = new Lazy<IStadeRepository>(() => new StadeRepository(DB));
            StadeServices = new Lazy<IStadeServicesRepository>(() => new StadeServicesRepository(DB));
            User = new Lazy<IUserRepository>(() => new UserRepository(DB));
            MatchPlayers = new Lazy<IMatchPlayersRepository>(() => new MatchPlayersRepository(DB));
            StadeProvdiedServices = new Lazy<IStadeProvdiedServicesRepository>(() => new StadeProvdiedServicesRepository(DB));
        }

        public void Dispose()
        {
            _DB.Dispose();
        }
    }
}
