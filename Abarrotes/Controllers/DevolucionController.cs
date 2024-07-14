using CapaDatos;
using CapaModelo;
using Microsoft.AspNetCore.Mvc;

namespace Abarrotes.Controllers
{
    public class DevolucionController : Controller
    {
        public IActionResult Crear()
        {
            return View();
        }

        [HttpGet]
        public JsonResult Obtener()
        {
            List<Devolucion> listaDescartado = CD_Devolucion.Instancia.ObtenerDevoluciones();
            return Json(new { data = listaDescartado });
        }

        [HttpPost]
        public JsonResult Guardar(Devolucion Devolucion)
        {
            bool respuesta = false;
            if (Devolucion.id_Devolucion == 0)
            {
                respuesta = CD_Devolucion.Instancia.RegistrarDevolucion(Devolucion);
            }
            else
            {
                respuesta = CD_Devolucion.Instancia.ModificarDevolucion(Devolucion);
            }
            return Json(new { resultado = respuesta });
        }

        [HttpDelete]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Devolucion.Instancia.EliminarDevolucion(id);
            return Json(new { resultado = respuesta });
        }
    }
}
