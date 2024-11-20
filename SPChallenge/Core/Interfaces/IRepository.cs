using Core.Shared;
using Microsoft.EntityFrameworkCore.Query;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IRepository<IEntity> where IEntity : BaseEntity
    {
        Task<IEntity> Get(long id);
        IQueryable<IEntity> GetAll();
        IQueryable<IEntity> Find(Expression<Func<IEntity, bool>> where, params Expression<Func<IEntity, object>>[] navigationProperties);
        Task<IEntity> SingleOrDefault(Expression<Func<IEntity, bool>> predicate);
        Task<IEntity> Add(IEntity entity);
        Task<IEnumerable<IEntity>> AddRange(IEnumerable<IEntity> entities);
        Task<IEntity> Remove(IEntity entity);
        Task<IEnumerable<IEntity>> RemoveRange(IEnumerable<IEntity> entities);
        Task<IEntity> Update(IEntity entity, bool disableAttach = false);
        Task<IEnumerable<IEntity>> UpdateRange(IEnumerable<IEntity> Entities);
        Task<IEnumerable<IEntity>> AddRange(IEnumerable<IEntity> entities, Expression<Action<IEnumerable<IEntity>>> action);
        void SaveChanges();
        Task SaveChangesAsync();
        Task<IDbContextTransaction> BeginTransactionAsync();
        Task CommitTransactionAsync();
        Task RollbackTransactionAsync();
        Task UseTransactionAsync(DbTransaction transaction);
        IQueryable<TResult> FindManyWithPaginations<TResult>(Expression<Func<IEntity, TResult>> selector,
        Expression<Func<IEntity, bool>> predicate,
        Func<IQueryable<IEntity>, IIncludableQueryable<IEntity, object>> include,
        Func<IQueryable<IEntity>, IOrderedQueryable<IEntity>> orderBy
        , int pageNumber, int pageSize, ref long totalRecords);
        IQueryable<IEntity> Filter(Expression<Func<IEntity, bool>> where, Func<IQueryable<IEntity>, IIncludableQueryable<IEntity, object>> include = null);
        IQueryable<IEntity> FilterWithPaginations(Expression<Func<IEntity, bool>> where, int pageNumber, int pageSize, ref long totalRecords, Func<IQueryable<IEntity>, IIncludableQueryable<IEntity, object>> include = null, Func<IQueryable<IEntity>, IOrderedQueryable<IEntity>> orderBy = null);
        IQueryable<IEntity> GetByCriteria(
        List<Expression<Func<IEntity, bool>>> filterExpressions,
        int pageSize,
        out long totalRecords,
        int pageNumber = 1,
        bool orderByDescending = true,
        Expression<Func<IEntity, IComparable>>[] orderExpressions = null,
        Expression<Func<IEntity, IEntity>> selectEpressions = null,
        params Expression<Func<IEntity, object>>[] includExpressions);
    }
}
