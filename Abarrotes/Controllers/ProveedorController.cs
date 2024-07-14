using CapaDatos;
using CapaModelo;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Abarrotes.Controllers
{
    public class ProveedorController : Controller
    {
        public IActionResult Crear()
        {
            return View();
        }

        [HttpGet]
        public JsonResult Obtener()
        {
            List<Proveedor> listaProveedores = CD_Proveedor.Instancia.ObtenerProveedores();
            return Json(new { data = listaProveedores });
        }

        [HttpPost]
        public JsonResult Guardar(Proveedor proveedor)
        {
            bool respuesta = false;
            if (proveedor.id_Proveedor == 0)
            {
                respuesta = CD_Proveedor.Instancia.RegistrarProveedor(proveedor);
            }
            else
            {
                respuesta = CD_Proveedor.Instancia.ModificarProveedor(proveedor);
            }
            return Json(new { resultado = respuesta });
        }

        [HttpDelete]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Proveedor.Instancia.EliminarProveedor(id);
            return Json(new { resultado = respuesta });
        }
    }
}
