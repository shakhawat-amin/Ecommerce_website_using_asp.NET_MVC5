using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ecommerce_version2.Models
{
    public class AdminForm
    {
        [Required(ErrorMessage = "Ooops!!! Wrong username Or password")]
        public string adminName {get; set;}
        public string password {get; set;}
    }
}