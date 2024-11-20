using Core.Interfaces;
using Core.Shared;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data.Repository
{
    public class Repository<IEntity> : IRepository<IEntity> where IEntity : BaseEntity
    {
        private readonly DBChallange _DB;
        public Repository(DBChallange DB)
        {
            _DB = DB;
        }

        public async Task<IEntity> Add(IEntity entity)
        {
            entity.CreationDate = DateTime.Now;
            await _DB.Set<IEntity>().AddAsync(entity);
            await SaveChangesAsync();
            _DB.Entry(entity).GetDatabaseValues();

            return entity;
        }

        public async Task<IEnumerable<IEntity>> AddRange(IEnumerable<IEntity> entities)
        {
            entities = entities.Select(e => { e.CreationDate = DateTime.Now; return e; });
            _DB.ChangeTracker.Entries<IEntity>();
            await _DB.Set<IEntity>().AddRangeAsync(entities);
            await SaveChangesAsync();

            return entities;
        }

        public async Task<IEnumerable<IEntity>> AddRange(IEnumerable<IEntity> entities, Expression<Action<IEnumerable<IEntity>>> action)
        {
            action.Compile().Invoke(entities);
            entities = entities.Select(e => { e.CreationDate = DateTime.Now; return e; });
            await _DB.Set<IEntity>().AddRangeAsync(entities);
            await SaveChangesAsync();

            return entities;
        }

        public async Task<IDbContextTransaction> BeginTransactionAsync()
        {
            return await _DB.Database.BeginTransactionAsync();
        }

        public async Task CommitTransactionAsync()
        {
            await _DB.Database.CommitTransactionAsync();
        }

        public IQueryable<IEntity> Filter(Expression<Func<IEntity, bool>> where, Func<IQueryable<IEntity>, IIncludableQueryable<IEntity, object>> include = null)
        {
            return include != null ? include(_DB.Set<IEntity>().AsNoTracking().AsQueryable()).Where(where).AsQueryable().AsNoTracking() : _DB.Set<IEntity>().AsNoTracking().AsQueryable().Where(where).AsQueryable().AsNoTracking();
        }

        public IQueryable<IEntity> FilterWithPaginations(Expression<Func<IEntity, bool>> where, int pageNumber, int pageSize, ref long totalRecords, Func<IQueryable<IEntity>, IIncludableQueryable<IEntity, object>> include = null, Func<IQueryable<IEntity>, IOrderedQueryable<IEntity>> orderBy = null)
        {
            IQueryable<IEntity> query = include != null ? include(_DB.Set<IEntity>().AsNoTracking().AsQueryable()).Where(where).AsQueryable().AsNoTracking() : _DB.Set<IEntity>().AsNoTracking().AsQueryable().Where(where).AsQueryable().AsNoTracking();
            totalRecords = query.Count();
            pageNumber = totalRecords == 1 ? 1 : pageNumber;
            return orderBy != null ? orderBy(query).Skip(((pageNumber - 1) * pageSize)).Take(pageSize).AsQueryable() : query.Skip(((pageNumber - 1) * pageSize)).Take(pageSize).AsQueryable();
        }

        public IQueryable<IEntity> Find(Expression<Func<IEntity, bool>> predicate, params Expression<Func<IEntity, object>>[] navigationProperties)
        {            
            IQueryable<IEntity> dbQuery = _DB.Set<IEntity>().AsNoTracking().AsQueryable();
            dbQuery = navigationProperties.Aggregate(dbQuery, (current, navigationProperty) => current.Include(navigationProperty));
            return dbQuery.Where(predicate).AsNoTracking();

            /*
            IQueryable<IEntity> dbQuery = _DB.Set<IEntity>().Include("u = > u.PlayerStatistics").AsNoTracking().AsQueryable();
            navigationProperties.Select(n => { dbQuery = dbQuery.Include(n).AsNoTracking(); return n; });
            return dbQuery.Where(predicate).AsNoTracking();
            */
        }

        public IQueryable<TResult> FindManyWithPaginations<TResult>(Expression<Func<IEntity, TResult>> selector, Expression<Func<IEntity, bool>> predicate, Func<IQueryable<IEntity>, IIncludableQueryable<IEntity, object>> include, Func<IQueryable<IEntity>, IOrderedQueryable<IEntity>> orderBy, int pageNumber, int pageSize, ref long totalRecords)
        {
            IQueryable<IEntity> query = include(_DB.Set<IEntity>().AsNoTracking()).Where(predicate).AsQueryable().AsNoTracking();
            totalRecords = query.Count();
            pageNumber = totalRecords == 1 ? 1 : pageNumber;
            return orderBy != null ? orderBy(query).Skip(((pageNumber - 1) * pageSize)).Take(pageSize).AsQueryable().Select(selector) : query.Skip(((pageNumber - 1) * pageSize)).Take(pageSize).AsQueryable().Select(selector);
        }

        public async Task<IEntity> Get(long Id)
        {
            IEntity result = await _DB.Set<IEntity>().AsNoTracking().Where(entity => entity.Id == Id).FirstOrDefaultAsync();
            return result;
        }

        public IQueryable<IEntity> GetAll()
        {
            try
            {
                IQueryable<IEntity> dbQuery = _DB.Set<IEntity>();
                return dbQuery.AsNoTracking(); ;
            }
            catch (Exception ex)
            {
                string mass = ex.Message;
                return null;
            }
        }

        public IQueryable<IEntity> GetByCriteria(List<Expression<Func<IEntity, bool>>> filterExpressions, int pageSize, out long totalRecords, int pageNumber = 1, bool orderByDescending = true, Expression<Func<IEntity, IComparable>>[] orderExpressions = null, Expression<Func<IEntity, IEntity>> selectEpressions = null, params Expression<Func<IEntity, object>>[] includExpressions)
        {
            totalRecords = 0;
            IQueryable<IEntity> dbQuery = _DB.Set<IEntity>();
            IQueryable<IEntity> results = null;

            if (includExpressions != null)
            {
                foreach (Expression<Func<IEntity, object>> navigationProperty in includExpressions)
                {
                    dbQuery = dbQuery.Include(navigationProperty);
                }
            }

            if (filterExpressions != null)
            {
                foreach (Expression<Func<IEntity, bool>> expression in filterExpressions)
                {
                    dbQuery = dbQuery.Where(expression).AsNoTracking();
                }
            }

            if (!(orderExpressions is null))
            {
                IOrderedQueryable<IEntity> orderByResult = null;
                foreach (Expression<Func<IEntity, IComparable>> orderExpression in orderExpressions)
                {
                    if (orderByResult == null)
                    {
                        if (orderByDescending)
                            orderByResult = dbQuery.OrderByDescending(orderExpression);
                        else
                            orderByResult = dbQuery.OrderBy(orderExpression);
                    }
                    else
                    {
                        if (orderByDescending)
                            dbQuery = orderByResult.ThenByDescending(orderExpression);
                        else
                            dbQuery = orderByResult.ThenBy(orderExpression);
                    }
                }
                dbQuery = orderByResult;
            }

            totalRecords = dbQuery.Count();

            if (!(selectEpressions is null))
                dbQuery = dbQuery.Select(selectEpressions);

            results = dbQuery.Skip((pageNumber - 1) * pageSize).Take(pageSize);
            return results;
        }

        public async Task<IEntity> Remove(IEntity entity)
        {
            _DB.Set<IEntity>().Remove(entity);
            SaveChangesAsync();
            return entity;
        }

        public async Task<IEnumerable<IEntity>> RemoveRange(IEnumerable<IEntity> entities)
        {
            _DB.Set<IEntity>().RemoveRange(entities);
            await SaveChangesAsync();
            return entities;
        }

        public async Task RollbackTransactionAsync()
        {
            await _DB.Database.RollbackTransactionAsync();
        }

        public void SaveChanges()
        {
            _DB.SaveChanges();
        }

        public async Task SaveChangesAsync()
        {
            await _DB.SaveChangesAsync();
        }

        public async Task<IEntity> SingleOrDefault(Expression<Func<IEntity, bool>> predicate)
        {
            IQueryable<IEntity> dbQuery = _DB.Set<IEntity>();
            return await dbQuery.AsNoTracking().SingleOrDefaultAsync(predicate);
        }

        public async Task<IEntity> Update(IEntity entity, bool disableAttach = false)
        {
            entity.ModificationDate = DateTime.Now;
            if (!disableAttach)
            {
                _DB.Set<IEntity>().Attach(entity);
            }

            _DB.Entry(entity).State = EntityState.Modified;
            await SaveChangesAsync();
            return entity;
        }

        public async Task<IEnumerable<IEntity>> UpdateRange(IEnumerable<IEntity> entities)
        {
            foreach (IEntity entity in entities)
            {
                entity.ModificationDate = DateTime.Now;
            }
            _DB.Set<IEntity>().UpdateRange(entities);
            await SaveChangesAsync();
            return entities;
        }

        public async Task UseTransactionAsync(DbTransaction transaction)
        {
            await _DB.Database.UseTransactionAsync(transaction);
        }
    }
}
