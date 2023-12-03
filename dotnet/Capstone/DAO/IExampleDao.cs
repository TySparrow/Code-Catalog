using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IExampleDao
    {
        IList<Example> GetExamples();
        //Example CreateExample(string title, string tag, string language, string codeSnippet);

    }
}
