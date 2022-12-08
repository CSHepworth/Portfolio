using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using LawnWizardApp.Models;

namespace LawnWizardApp.Controllers;

public class HomeController : Controller
{
    private MyContext db;

    public HomeController(MyContext context)
    {
        db = context;
    }

    [HttpGet("dashboard")]
    public IActionResult Dashboard()
    {
        Employee? loggedEmployee = db.Employees.FirstOrDefault(e => e.EmployeeId == HttpContext.Session.GetInt32("employeeId"));

        if (loggedEmployee != null)
        {
            ViewBag.Employee = loggedEmployee;
            return View("Dashboard");
        }

        return RedirectToAction("Login", "Employee");
        
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
