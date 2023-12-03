using Capstone.Exceptions;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class ExampleSqlDao : IExampleDao
    {
        private readonly string connectionString;

        public ExampleSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        //string sql = "SELECT * FROM examples " +
        //        "JOIN user_examples ON user_examples.example_id = examples.example_id " +
        //        "JOIN users ON users.user_id = user_examples.user_id " +
        //        "WHERE users.username = @userName";
        public IList<Example> GetExamples()
        {
            IList<Example> examples = new List<Example>();

            string sql = "SELECT * FROM examples";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Example example = MapRowToExample(reader);
                                examples.Add(example);
                            }
                        }

                    }

                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return examples;
        }

        //Example CreateExample(string title, string tag, string language, string codeSnippet)
        //{
        //    Example example = new Example();
        //    return example;
        //}

        private Example MapRowToExample(SqlDataReader reader)
        {
            Example example = new Example();
            example.ExampleId = Convert.ToInt32(reader["example_id"]);
            example.ExampleTitle = Convert.ToString(reader["example_title"]);
            example.ExampleTag = Convert.ToString(reader["example_tag"]);
            example.ExampleLanguage = Convert.ToString(reader["example_language"]);
            example.ExampleCode = Convert.ToString(reader["example_code"]);
            return example;
        }

    }
}
