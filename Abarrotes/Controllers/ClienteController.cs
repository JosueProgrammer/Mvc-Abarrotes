using CapaDatos;
using CapaModelo;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Abarrotes.Controllers
{
    public class ClienteController : Controller
    {
        public IActionResult Crear()
        {
            return View();
        }

        [HttpGet]
        public JsonResult Obtener()
        {
            List<Cliente> listaClientes = CD_Cliente.Instancia.ObtenerClientes();
            return Json(new { data = listaClientes });
        }

        [HttpPost]
        public JsonResult Guardar(Cliente cliente)
        {
            bool respuesta = false;
            if (cliente.id_Cliente == 0)
            {
                respuesta = CD_Cliente.Instancia.RegistrarCliente(cliente);
            }
            else
            {
                respuesta = CD_Cliente.Instancia.ModificarCliente(cliente);
            }
            return Json(new { resultado = respuesta });
        }

        [HttpDelete]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Cliente.Instancia.EliminarCliente(id);
            return Json(new { resultado = respuesta });
        }
    }
}
