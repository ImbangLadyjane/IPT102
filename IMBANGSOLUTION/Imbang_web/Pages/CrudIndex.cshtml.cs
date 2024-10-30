using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data;
using System.Data.SqlClient;

namespace Imbang_web.Pages
{
    public class CrudIndexModel : PageModel
    {
        private readonly ILogger<CrudIndexModel> _logger;
        private readonly IConfiguration _config;

        public CrudIndexModel(ILogger<CrudIndexModel> logger, IConfiguration config)
        {
            _logger = logger;
            _config = config;

            using var conn = new SqlConnection(_config.GetConnectionString("JD"));
            DepartmentList = conn.Query<DEPARTMENTModel>("[dbo].[READ]", new { }, commandType: CommandType.StoredProcedure);
        }

        public IActionResult OnPostCreate()
        {
            using var conn = new SqlConnection(_config.GetConnectionString("JD"));
            conn.Query("[dbo].[CREATE]", new
            {
                Dnumber = DnumberInput,
                Dname = DnameInput,
                Mgr_ssn = Mgr_ssnInput,
                Mgr_start_date = Mgr_start_dateInput
            }, commandType: CommandType.StoredProcedure);

            return RedirectToPage();
        }

        public IActionResult OnPostUpdate()
        {
            using var conn = new SqlConnection(_config.GetConnectionString("JD"));
            conn.Query("[dbo].[UPDATE]", new
            {
                Dnumber = DnumberInput,
                Dname = DnameInput,
                Mgr_ssn = Mgr_ssnInput,
                Mgr_start_date = Mgr_start_dateInput
            }, commandType: CommandType.StoredProcedure);

            return RedirectToPage();
        }

        public IActionResult OnPostDelete()
        {
            using var conn = new SqlConnection(_config.GetConnectionString("COMPANY"));
            conn.Query("[dbo].[DELETE]", new
            {
                Dnumber = DnumberInput
            }, commandType: CommandType.StoredProcedure);

            return RedirectToPage();
        }

        public IActionResult OnPostSearch()
        {
            using var conn = new SqlConnection(_config.GetConnectionString("COMPANY"));
            DepartmentList = conn.Query<DEPARTMENTModel>("[dbo].[SEARCH]", new { Search = Search_Input }, commandType: CommandType.StoredProcedure);

            return Page();
        }

        public IActionResult OnPostSearchAll()
        {
            using var conn = new SqlConnection(_config.GetConnectionString("COMPANY"));
            DepartmentList = conn.Query<DEPARTMENTModel>("[dbo].[READ]", new { }, commandType: CommandType.StoredProcedure);

            return Page();
        }

        public IActionResult OnPostEdit()
        {
            DnumberInput = DnumberInput2;
            DnameInput = DnameInput2;
            Mgr_ssnInput = Mgr_ssnInput2;
            Mgr_start_dateInput = Mgr_start_dateInput2;

            return Page();
        }

        public IEnumerable<DEPARTMENTModel> DepartmentList { get; set; }

        public class DEPARTMENTModel
        {
            public int Dnumber { get; set; }
            public string Dname { get; set; }
            public string Mgr_ssn { get; set; }
            public DateTime Mgr_start_date { get; set; }
        }

        [BindProperty] public int DnumberInput { get; set; }
        [BindProperty] public string DnameInput { get; set; }
        [BindProperty] public string Mgr_ssnInput { get; set; }
        [BindProperty] public DateTime Mgr_start_dateInput { get; set; }
        [BindProperty] public string Search_Input { get; set; }

        [BindProperty] public int DnumberInput2 { get; set; }
        [BindProperty] public string DnameInput2 { get; set; }
        [BindProperty] public string Mgr_ssnInput2 { get; set; }
        [BindProperty] public DateTime Mgr_start_dateInput2 { get; set; }
    }
}
