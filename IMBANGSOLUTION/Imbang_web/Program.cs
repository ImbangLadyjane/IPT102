using Imbang_web.Data;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;

using System;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddSingleton<WeatherForecastService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();



namespace RegistrationFormApp
{
    public class User
    {
        // Properties for User Details
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }

        // Display User Details
        public void DisplayUserInfo()
        {
            Console.WriteLine("\n--- Registered User Information ---");
            Console.WriteLine($"First Name: {FirstName}");
            Console.WriteLine($"Last Name: {LastName}");
            Console.WriteLine($"Email: {Email}");
        }
    }

    public class RegistrationForm
    {
        public User RegisterUser()
        {
            User user = new User();

            Console.WriteLine("Welcome to the User Registration Form");

            // Collect First Name
            Console.Write("Enter First Name: ");
            user.FirstName = Console.ReadLine();

            // Collect Last Name
            Console.Write("Enter Last Name: ");
            user.LastName = Console.ReadLine();

            // Collect and validate email
            do
            {
                Console.Write("Enter Email: ");
                user.Email = Console.ReadLine();

                if (!IsValidEmail(user.Email))
                {
                    Console.WriteLine("Invalid Email. Please try again.");
                }
            } while (!IsValidEmail(user.Email));

            // Collect and validate password
            do
            {
                Console.Write("Enter Password: ");
                user.Password = Console.ReadLine();

                Console.Write("Confirm Password: ");
                user.ConfirmPassword = Console.ReadLine();

                if (user.Password != user.ConfirmPassword)
                {
                    Console.WriteLine("Passwords do not match. Please try again.");
                }
            } while (user.Password != user.ConfirmPassword);

            return user;
        }

        // Basic email validation
        private bool IsValidEmail(string email)
        {
            return email.Contains("@") && email.Contains(".");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            RegistrationForm form = new RegistrationForm();

            // Register user
            User registeredUser = form.RegisterUser();

            // Display registered user information
            registeredUser.DisplayUserInfo();

            Console.WriteLine("\nRegistration completed successfully!");
        }
    }
}

