using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IExampleDao
    {
        IList<Example> GetExamples();
        Example GetExample(int exampleId);
        Example AddExample(Example newExample);
        IList<Example> GetLanguages();
      

    }
}
