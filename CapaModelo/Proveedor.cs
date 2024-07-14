using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public  class Proveedor
    {
       public int id_Proveedor {  get; set; }

       public string nombre { get; set; }

       public string direccion { get; set; }

       public string telefono { get; set; } 

       public string email { get; set; }

       public bool estado { get; set; }     
    }
}
