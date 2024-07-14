using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class Ventas
    {
        public int id_Venta { get; set; }
        public int id_Empleado { get; set; }
        public string Nombre { get; set; }
        public int NFactura { get; set; }
        public string Fecha_Venta { get; set; }
        public string IVA { get; set; }
        public string Descuento { get; set; }
        public string Subtotal_Venta { get; set; }
        public string Total { get; set; }
        public bool Estado { get; set; }
        public Empleado objEmpleado { get; set; }
    }
}
