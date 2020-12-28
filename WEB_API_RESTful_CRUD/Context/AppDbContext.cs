using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using WEB_API_RESTful_CRUD.Controllers.Entities;

namespace WEB_API_RESTful_CRUD.Context
{
    public class AppDbContext : DbContext
    {
        protected AppDbContext(DbContextOptions<AppDbContext> options):base(options)
        {

        }

        public DbSet<Product> Product { get; set; }
        

    }
}
