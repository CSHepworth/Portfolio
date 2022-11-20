#pragma warning disable CS8618
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LawnWizardApp.Models;

public class Employee
{
    [Key]
    public int EmployeeId { get; set; }

    [Display(Name = "First Name")]
    [Required(ErrorMessage = "is required")]
    [MinLength(2, ErrorMessage = "Must be at least 2 characters.")]
    public string FirstName { get; set; }

    [Display(Name = "Last Name")]
    [Required(ErrorMessage = "is required")]
    [MinLength(2, ErrorMessage = "Must be at least 2 characters.")]
    public string LastName { get; set; }

    [EmailAddress]
    [Display(Name = "Email")]
    [Required(ErrorMessage = "is required")]
    public string Email { get; set; }

    [Display(Name = "Password")]
    [DataType(DataType.Password)]
    [Required(ErrorMessage = "is required")]
    [MinLength(8, ErrorMessage = "Must be at least 8 characters.")]
    public string Password { get; set; }

    [NotMapped]
    [Display(Name = "Confirm Password")]
    [Compare("Password")]
    [Required(ErrorMessage = "is required")]
    public string Confirm { get; set; }

    public int AdminStatus { get; set; } = 0;

    public DateTime CreatedAt { get; set; } = DateTime.Now;

    public DateTime UpdatedAt { get; set; } = DateTime.Now;
}