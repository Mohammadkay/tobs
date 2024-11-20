using Core.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using static Core.Enums;

namespace Infrastructure.Data
{
    public class SeedData
    {
        public static async Task Seed(DBChallange context)
        {
            #region Seed User
            if (!await context.Users.AnyAsync())
            {
                var UserData = await File.ReadAllTextAsync("../Infrastructure/Data/SeedData/UserData.json");

                var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };

                var users = JsonSerializer.Deserialize<List<User>>(UserData);

                if (users != null)
                {
                    foreach (var user in users)
                    {
                        using var hmac = new HMACSHA512();

                        user.UserName = user.UserName.ToLower();
                        user.PasswordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes("$PCH@!!@NG"));
                        user.PasswordSalt = hmac.Key;

                        user.CreationDate = DateTime.Now;
                        user.CreatedBy = "SYSTEM_TEST";
                        user.Notes = "This is test account created by the system";

                        await context.Users.AddAsync(user);
                    }

                    await context.SaveChangesAsync();
                }
            }
            #endregion

            #region Seed Player Statistics
            if (!await context.PlayerStatistics.AnyAsync())
            {
                List<User> Players = await context.Users.Where(U => U.UserType == UserType.Player).ToListAsync();

                foreach (User Player in Players)
                {
                    PlayerStatistics OPlayerStatistics = new PlayerStatistics()
                    {
                        Assist = 0,
                        Goals = 0,
                        YellowCard = 0,
                        RedCard = 0,
                        UserId = Player.Id,
                        CreatedBy = "SYSTEM_TEST",
                        CreationDate = DateTime.Now,
                    };

                    await context.PlayerStatistics.AddAsync(OPlayerStatistics);
                }

                await context.SaveChangesAsync();
            }
            #endregion

            #region  Seed Stade
            if (!await context.Stades.AnyAsync())
            {
                var StadeData = await File.ReadAllTextAsync("../Infrastructure/Data/SeedData/StadeDate.json");

                var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };

                var stades = JsonSerializer.Deserialize<List<Stade>>(StadeData);

                if (stades != null)
                {
                    foreach (var stade in stades)
                    {
                        stade.CreationDate = DateTime.Now;
                        stade.CreatedBy = "SYSTEM_TEST";
                        stade.StatusDes = "This is test account created by the system";

                        await context.Stades.AddAsync(stade);
                    }

                    await context.SaveChangesAsync();
                }
            }
            #endregion

            #region  Seed Stade Services
            if (!await context.StadeServices.AnyAsync())
            {
                var StadeServicesData = await File.ReadAllTextAsync("../Infrastructure/Data/SeedData/StadeServices.json");

                var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };

                var StadeServices = JsonSerializer.Deserialize<List<StadeService>>(StadeServicesData);

                if (StadeServices != null)
                {
                    foreach (var stadeService in StadeServices)
                    {
                        stadeService.CreationDate = DateTime.Now;
                        stadeService.CreatedBy = "SYSTEM_TEST";

                        await context.StadeServices.AddAsync(stadeService);
                    }

                    await context.SaveChangesAsync();
                }
            }
            #endregion

            #region Stade Provided Services
            if (!await context.StadeProvidedServices.AnyAsync())
            {
                List<Stade> Stades = await context.Stades.Where(s => s.CreatedBy.Equals("SYSTEM_TEST")).ToListAsync();
                List<StadeService> StadeService = await context.StadeServices.Where(s => s.CreatedBy.Equals("SYSTEM_TEST")).ToListAsync();

                foreach (var stade in Stades)
                {
                    foreach (var stadeService in StadeService)
                    {
                        StadeProvidedServices oStadeProvidedServices = new StadeProvidedServices();
                        oStadeProvidedServices.CreationDate = DateTime.Now;
                        oStadeProvidedServices.CreatedBy = "SYSTEM_TEST";
                        oStadeProvidedServices.StadeServiceId = stadeService.Id;
                        oStadeProvidedServices.StadeId = stade.Id;

                        await context.StadeProvidedServices.AddAsync(oStadeProvidedServices);
                    }
                }

                await context.SaveChangesAsync();
            }
            #endregion

            #region Seed Matches
            if (!await context.Matchs.AnyAsync())
            {
                List<Stade> TestStades = await context.Stades.Where(s => s.CreatedBy.Equals("SYSTEM_TEST")).ToListAsync();

                var MatchData = await File.ReadAllTextAsync("../Infrastructure/Data/SeedData/MathcesData.json");

                var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };

                var Matchs = JsonSerializer.Deserialize<List<Core.Entities.Match>>(MatchData);

                if (Matchs != null)
                {
                    foreach (var Match in Matchs)
                    {
                        foreach (var teststade in TestStades)
                        {
                            Match.StartDate = DateTime.Now.AddDays(3);
                            Match.EndDate = DateTime.Now.AddDays(3);
                            Match.StadeId = teststade.Id;
                            Match.CreatedBy = "SYSTEM_TEST";
                            Match.CreationDate = DateTime.Now;

                            await context.Matchs.AddAsync(Match);
                        }
                    }

                    await context.SaveChangesAsync();
                }
            }
            #endregion

            #region Seed Matche Player
            if (!await context.MatchPlayers.AnyAsync())
            {
                List<Core.Entities.Match> Matchs = await context.Matchs.Where(M => M.CreatedBy.Equals("SYSTEM_TEST")).ToListAsync();
                List<User> Players = await context.Users.Where(U => U.CreatedBy.Equals("SYSTEM_TEST") && U.UserType == UserType.Player).ToListAsync();

                foreach (var Match in Matchs)
                {
                    foreach (var Player in Players)
                    {
                        MatchPlayers oMatchPlayers = new MatchPlayers();
                        oMatchPlayers.CreatedBy = "SYSTEM_TEST";
                        oMatchPlayers.CreationDate = DateTime.Now;
                        oMatchPlayers.MatchId = Match.Id;
                        oMatchPlayers.UserId = Player.Id;

                        await context.MatchPlayers.AddAsync(oMatchPlayers);
                    }
                }

                await context.SaveChangesAsync();
            }
            #endregion
        }
    }
}
