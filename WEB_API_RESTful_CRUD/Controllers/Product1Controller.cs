using Microsoft.AspNetCore.Mvc;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using WEB_API_RESTful_CRUD.Contexts;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WEB_API_RESTful_CRUD.Entities
{
    [Route("api/[controller]")]
    [ApiController]
    public class Product1Controller : ControllerBase
    {
        private readonly WebApiRESTfulDbContext context;

        public Product1Controller(WebApiRESTfulDbContext context)
        {
            this.context = context;
        }
        //// GET: api/<Product1Controller>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        /// <summary>
        /// Manel 01/2021 
        /// This method is GET for read all data from Project1 table on DBProducts database 
        /// return list format for convert easy to JSON.
        /// </summary>
        /// <returns></returns>
        // GET: api/<Product1Controller>
        [HttpGet]
        public IEnumerable<Product1> Get()
        {
            IEnumerable<Product1> Product1List = context.Product1.ToList();
            return Product1List;
        }


        //// GET api/<Product1Controller>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    string verbname = "Get value" + id.ToString();
        //    return verbname;
        //}


        /// <summary>
        /// Manel01/2021
        /// This method is GET and id parameter read and return this register
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        // GET api/<Product1Controller>/5
        [HttpGet("{id}")]
        public Product1 Get(int id)
        {
            Product1 Product1_var = context.Product1.FirstOrDefault(x => x.Product_ID == id);
            return Product1_var;

        }

        // POST api/<Product1Controller>
        [HttpPost]
        public string Post([FromBody] string value)
        {
            string verbname = "Post value = " + value;
            return verbname;
        }

        // PUT api/<Product1Controller>/5
        [HttpPut("{id}")]
        public string Put(int id, [FromBody] string value)
        {
            string verbname = "Put value id = " + id.ToString() + " ; value = " + value;
            return verbname;
        }

        // DELETE api/<Product1Controller>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            string verbname = "Delete value id = " + id.ToString();
            return verbname;
        }
    }
}
