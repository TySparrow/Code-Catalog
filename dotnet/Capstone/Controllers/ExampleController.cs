using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Capstone.Security;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ExampleController : ControllerBase
    {
        IExampleDao dao;
        string connectionString = "Server=.\\SQLEXPRESS;Database=final_capstone;Trusted_Connection=True;";
        public ExampleController()
        {
            dao = new ExampleSqlDao(connectionString);
        }

        [HttpGet]
        public IList<Example> GetExamples()
        {
            return dao.GetExamples();
        }
    }
}
