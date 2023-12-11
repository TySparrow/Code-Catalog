using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IExampleDao
    {
        IList<Example> GetExamples();
        Example GetExampleById(int exampleId);
        Example AddExample(Example newExample,int userID);
        Example GetExampleByTitle(string exampleTitle);
        IList<Example> GetLanguages();
        IList<Example> GetExamplesByStatus(string status);
        IList<Example> GetExamplesByUserId(int userId);
        Example UpdateExample(Example updatedExample);



    }
}
