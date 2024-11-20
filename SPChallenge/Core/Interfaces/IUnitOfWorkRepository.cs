using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IUnitOfWorkRepository :IDisposable
    {
        Lazy<IMatchRepository> Match { get; set; }
        Lazy<IReviewRepository> Review { get; set; }
        Lazy<IStadeRepository> Stade { get; set; }
        Lazy<IStadeServicesRepository> StadeServices { get; set; }
        Lazy<IUserRepository> User { get; set; }
        Lazy<IMatchPlayersRepository> MatchPlayers { get; set; }
        Lazy<IStadeProvdiedServicesRepository> StadeProvdiedServices { get; set; }
    }
}
