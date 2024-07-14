using Microsoft.AspNetCore.Mvc;

namespace Abarrotes.Controllers
{
    public class ComprasController : Controller
    {
        public IActionResult Crear()
        {
            return View();
        }
    }
}
