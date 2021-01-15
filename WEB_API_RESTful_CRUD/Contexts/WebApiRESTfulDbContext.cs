using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using WEB_API_RESTful_CRUD.Entities;

namespace WEB_API_RESTful_CRUD.Contexts
{
    public class WebApiRESTfulDbContext:DbContext
    {
        public WebApiRESTfulDbContext(DbContextOptions<WebApiRESTfulDbContext> options):base(options)
        {

        }
        public DbSet<Product1> Product1 { get; set; }
    }
}
