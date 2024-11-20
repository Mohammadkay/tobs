using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Interface
{
    public interface IUnitOfWorkService : IDisposable   
    {
        Lazy<IUserService> User { get; set; }
        Lazy<IMatchService> Match { get; set; }
        Lazy<IStadeService> Stade { get; set; }
        Lazy<IStadeServicesService> StadeServices { get; set; }
        Lazy<IReviewService> Review { get; set; }
        Lazy<ILoginService> Login { get; set; }
        Lazy<IMatchPlayersService> MatchPlayers { get; set; }
        Lazy<IStadeProvdiedServices> StadeProvdiedServices { get; set; }
    }
}
