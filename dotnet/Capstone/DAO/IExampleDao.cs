using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IExampleDao
    {
        IList<Example> GetExamples();
        Example GetExampleById(int exampleId);
        Example AddExample(Example newExample);
        Example GetExampleByTitle(string exampleTitle);
        IList<Example> GetLanguages();
      

    }
}
