#pragma warning disable CS8618
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LawnWizardApp.Models;

public class LoginEmployee
{
    [EmailAddress]
    [Display(Name = "Email")]
    [Required(ErrorMessage = "is required")]
    public string LoginEmail { get; set; }

    [DataType(DataType.Password)]
    [Display(Name = "Password")]
    [Required(ErrorMessage = "is required")]
    public string LoginPassword { get; set; }
}