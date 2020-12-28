using Microsoft.AspNetCore.Mvc;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using WEB_API_RESTful_CRUD.Context;
using WEB_API_RESTful_CRUD.Controllers.Entities;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WEB_API_RESTful_CRUD.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        #region context injection dependence Manel 12/2020
        private readonly AppDbContext context;

        public ProductController(AppDbContext context)
        {
            this.context = context;
        }


        #endregion


        #region Read – GET methods Manel 12/2020 
        // GET: api/<ProductController>
        [HttpGet]
        public IEnumerable<Product> Get() 
        {
            return context.Product.ToList();
        }

        // GET api/<ProductController>/5
        [HttpGet("{id}")]
        public Product Get(int id)
        {
            var product_var = context.Product.FirstOrDefault(r => (r.Product_ID == id));
            return product_var;
        }
        #endregion


        #region Create – POST methods Manel 12/2020
        // POST api/<ProductController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }
        #endregion


        #region Update – PUT methods
        // PUT api/<ProductController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
            
        }
        #endregion

        #region Delete – DELETE methods Manel 12/2020
        // DELETE api/<ProductController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
        #endregion
    }
}
