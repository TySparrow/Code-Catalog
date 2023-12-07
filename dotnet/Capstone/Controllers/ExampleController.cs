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
        [HttpPost()]
        public ActionResult<string> AddExample(Example example)
        {
            if(dao.GetExampleByTitle(example.Title) != null)
            {
                return "This title has been taken";
            }
            Example newExample =  dao.AddExample(example);
            if (newExample == null || newExample.Id == 0)
            {
                BadRequest();
                return "not ok";
            }
            else
            {
                Ok(newExample);
                 return "ok";
            }
        }
    }
}
