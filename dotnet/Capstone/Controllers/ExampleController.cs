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
        IUserDao userdao;

        string connectionString = "Server=.\\SQLEXPRESS;Database=final_capstone;Trusted_Connection=True;";

        public ExampleController()
        {
            dao = new ExampleSqlDao(connectionString);
            userdao = new UserSqlDao(connectionString);
        }

        [HttpGet]
        public IList<Example> GetExamples(string status)
        {
            if(status.Length > 0)
            {
                return dao.GetExamplesByStatus(status);
            }
            else
            {
                return dao.GetExamples();
            }
        }
        [HttpGet("{userId}")]
        public IList<Example> GetExamplesByUserId(int userId)
        {
            return dao.GetExamplesByUserId(userId);
        }
        [HttpPost()]
        public ActionResult<string> AddExample(Example example)
        {
            string userName = User.Identity.Name;
            int userId = userdao.GetUserByUsername(userName).UserId;

            if(dao.GetExampleByTitle(example.Title) != null)
            {
                return "This title has been taken";
            }
            Example newExample =  dao.AddExample(example, userId);
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
        [HttpPut()]
        public ActionResult<string> UpdateExample(Example updatedExample)
        {
           if(dao.UpdateExample(updatedExample) == null)
            {
                return "Request denied";
            }
            else
            {
                return "Request Approved";
            }
        }
    }
}
