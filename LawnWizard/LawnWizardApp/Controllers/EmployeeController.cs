using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using LawnWizardApp.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Microsoft.AspNetCore.Identity;

namespace LawnWizardApp.Controllers;

public class EmployeeController : Controller
{
    private MyContext db;

    public EmployeeController(MyContext context)
    {
        db = context;
    }

    [HttpGet("")]
    public IActionResult Login()
    {
        return View();
    }

    [HttpPost("employee/login")]
    public IActionResult LoginEmployee(LoginEmployee employee)
    {
        if (ModelState.IsValid)
        {
            Employee? loginEmployee = db.Employees?.FirstOrDefault(e => e.Email == employee.LoginEmail);

            if(loginEmployee == null)
            {
                ModelState.AddModelError("LoginEmail", "Invalid Email/Password.");
                return View("Login");
            }

            PasswordHasher<LoginEmployee> Hasher = new PasswordHasher<LoginEmployee>();
            var result = Hasher.VerifyHashedPassword(employee, loginEmployee.Password, employee.LoginPassword);

            if(result == PasswordVerificationResult.Failed)
            {
                ModelState.AddModelError("LoginPassword", "Invalid Password.");
                return View("Login");
            }

            HttpContext.Session.SetInt32("employeeId", loginEmployee.EmployeeId);
            HttpContext.Session.SetInt32("adminStatus", loginEmployee.AdminStatus);
            return RedirectToAction("Dashboard", "Home");
        }
        return View("Login");
    }

    [HttpGet("register")]
    public IActionResult Register()
    {
        return View("Register");
    }

    [HttpPost("employee/register")]
    public IActionResult RegisterEmployee(Employee newemployee)
    {
        if (ModelState.IsValid)
        {
            if (db.Employees.Any(e => e.Email == newemployee.Email))
            {
                ModelState.AddModelError("Email", "Email is already taken.");
                return View("Register");
            }

            PasswordHasher<Employee> Hasher = new PasswordHasher<Employee>();
            newemployee.Password = Hasher.HashPassword(newemployee, newemployee.Password);

            db.Employees.Add(newemployee);
            db.SaveChanges();

            HttpContext.Session.SetInt32("employeeId", newemployee.EmployeeId);
            HttpContext.Session.SetInt32("adminStatus", newemployee.AdminStatus);
            return RedirectToAction("Dashboard", "Home");
        }
        return View("Register");
    }
    
}