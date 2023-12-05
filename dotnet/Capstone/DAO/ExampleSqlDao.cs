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

        public Example GetExample(int exampleId)
        {
            string sql = "SELECT * FROM examples " +
            "WHERE example_id = @id;";

        Example example = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", exampleId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            example = MapRowToExample(reader);
                        }
                    }
                }
            }
            return example;
        }

        public Example AddExample(Example newExample)
        {
            newExample.Id = 0; //used as a marker to determine sucess

            string sql = "INSERT INTO examples (example_title, example_tag, example_language, example_code, example_source) " +
            "OUTPUT INSERTED.example_id " +
            "VALUES (@title, @tag, @language, @code, @source);";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@title", newExample.Title);
                    cmd.Parameters.AddWithValue("@tag", newExample.Tag);
                    cmd.Parameters.AddWithValue("@language", newExample.Language);
                    cmd.Parameters.AddWithValue("@code", newExample.Code);
                    cmd.Parameters.AddWithValue("@source", newExample.Source);
                    newExample.Id = (int)cmd.ExecuteScalar();
                }
            }

            return GetExample(newExample.Id);
        }

        private Example MapRowToExample(SqlDataReader reader)
        {
            Example example = new Example();
            example.Id = Convert.ToInt32(reader["example_id"]);
            example.Title = Convert.ToString(reader["example_title"]);
            example.Tag = Convert.ToString(reader["example_tag"]);
            example.Language = Convert.ToString(reader["example_language"]);
            example.Code = Convert.ToString(reader["example_code"]);
            example.Source = Convert.ToString(reader["example_source"]);
            return example;
        }

    }
}
