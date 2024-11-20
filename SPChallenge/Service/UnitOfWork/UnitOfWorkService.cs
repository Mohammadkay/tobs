using AutoMapper;
using Core.Interfaces;
using Infrastructure.Data;
using Infrastructure.Data.UnitOfWork;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Service.Interface;
using Service.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.UnitOfWork
{
    public class UnitOfWorkService : IUnitOfWorkService
    {
        private IUnitOfWorkRepository _UnitOfWork;
        public Lazy<IMatchService> Match { get; set; }
        public Lazy<IStadeService> Stade { get; set; }
        public Lazy<IStadeServicesService> StadeServices { get; set; }
        public Lazy<IReviewService> Review { get; set; }
        public Lazy<IUserService> User { get; set; }
        public Lazy<ILoginService> Login { get; set; }
        public Lazy<IMatchPlayersService> MatchPlayers { get; set; }
        public Lazy<IStadeProvdiedServices> StadeProvdiedServices { get; set; }
        public UnitOfWorkService(DBChallange DB, IMapper mapper) 
        {
            _UnitOfWork = new UnitOfWorkRepository(DB);
            User = new Lazy<IUserService>(() => new UserService(_UnitOfWork, mapper ));
            Stade = new Lazy<IStadeService>(() => new StadeService(_UnitOfWork ));
            StadeServices = new Lazy<IStadeServicesService>(() => new StadeServicesServices(_UnitOfWork));
            Review = new Lazy<IReviewService>(() => new ReviewService(_UnitOfWork));
            Match = new Lazy<IMatchService>(() => new MatchService(_UnitOfWork));
            Login = new Lazy<ILoginService>(() => new LoginService(_UnitOfWork, mapper));
            StadeProvdiedServices = new Lazy<IStadeProvdiedServices>(() => new StadeProvdiedServices(_UnitOfWork));
            MatchPlayers = new Lazy<IMatchPlayersService>(() => new MatchPlayersService(_UnitOfWork));
        }  
        public void Dispose()
        {

        }
    }
}
