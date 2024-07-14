using Microsoft.AspNetCore.Mvc;

namespace Abarrotes.Controllers
{
    public class VentasController : Controller
    {
        public IActionResult Crear()
        {
            return View();
        }
    }
}
