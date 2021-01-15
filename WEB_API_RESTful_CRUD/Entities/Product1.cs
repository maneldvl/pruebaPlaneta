using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WEB_API_RESTful_CRUD.Entities
{
    public class Product1
    {
        [Key]
        public int Product_ID { get; set; }

        public string Product_Name { get; set; }
        public string Product_REF { get; set; }
        public double Product_Price { get; set; }
        public DateTime Product_Creation_Date { get; set; }
    }
}
