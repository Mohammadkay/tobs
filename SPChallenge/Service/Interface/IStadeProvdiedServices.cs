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
    public interface IStadeProvdiedServices : IService<StadeProvidedServices>
    {
        Task<IResponseResult<bool>> RemoveById(long StadeProvidedServicesId);
        Task<IResponseResult<StadeProvidedServices>> Add(StadeProvidedServicesDTO entity);
    }
}
