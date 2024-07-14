using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class Compras
    {
        public int id_Compra { get; set; }
        public int id_Empleado { get; set; }
        public int id_Producto { get; set; }
        public int id_Proveedor { get; set; }
        public string Nombre { get; set; }
        public int NFactura { get; set; }
        public decimal Precio_Venta { get; set; }
        public decimal Precio_Producto { get; set; }
        public DateTime Fecha_Compra { get; set; }
        public decimal IVA { get; set; }
        public decimal Descuento { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Total { get; set; }
        public int Cantidad { get; set; }
        public bool Estado { get; set; }

        public Producto objProducto { get; set; }
        public Proveedor objProveedor { get; set; }

        public Empleado objempleado { get; set; }
    }

}
