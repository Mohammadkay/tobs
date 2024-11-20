using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Interface
{
    public interface IStadeServicesService : IService<Core.Entities.StadeService>
    {
        Task<IResponseResult<IEnumerable<Core.Entities.StadeService>>> SearchStadeService(StadeServiceSearchCritriaDTO oSearchCritria);
        Task<IResponseResult<Core.Entities.StadeService>> Update(StadeServiceDTO entity);
        Task<IResponseResult<Core.Entities.StadeService>> Add(StadeServiceDTO entity);
    }
}
