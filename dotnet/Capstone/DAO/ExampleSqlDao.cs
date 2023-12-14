using Capstone.Exceptions;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Principal;

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
        public IList<Example> GetExamplesByUserId(int userId)
        {
            IList<Example> examples = new List<Example>();

            string sql = "SELECT * FROM examples WHERE examples.user_id = @userId AND examples.user_id IS NOT NULL";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);
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
        public IList<Example> GetExamplesByStatus(string status)
        {
            IList<Example> examples = new List<Example>();

            string sql = "SELECT * FROM examples WHERE example_status = @status";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@status", status);
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
        public IList<Example> GetLanguages()
        {
            IList<Example> examples = new List<Example>();

            string sql = "WITH RankedExamples AS (SELECT example_language, example_id, example_title, example_tag, example_code, example_source, example_status, " +
                "ROW_NUMBER() OVER (PARTITION BY example_language ORDER BY example_id) " +
                "AS RowNum FROM examples) SELECT example_language, example_id, example_title, example_tag, example_code, example_source, example_status  " +
                "FROM RankedExamples WHERE RowNum = 1 AND example_status = 'Public' ";

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


        public Example GetExampleById(int exampleId)
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
        public Example GetExampleByTitle(string exampleTitle)
        {
            string sql = "SELECT * FROM examples " +
            "WHERE example_title = @title;";

            Example example = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@title", exampleTitle);

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

        public Example AddExample(Example newExample, int userId)
        {
            newExample.Id = 0; //used as a marker to determine sucess

            string sql = "INSERT INTO examples (examples.user_id, example_title, example_tag, example_language, example_code, example_source, example_status) " +
            "OUTPUT INSERTED.example_id " +
            "VALUES (@userid, @title, @tag, @language, @code, @source, @status); ";

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
                    cmd.Parameters.AddWithValue("@status", newExample.Status);
                    cmd.Parameters.AddWithValue("@userid", userId);
                    newExample.Id = (int)cmd.ExecuteScalar();
                }
            }

            return GetExampleById(newExample.Id);
        }
        public Example UpdateExample(Example updatedExample)
        {
           string sql =  "UPDATE examples SET example_title = @title, example_tag = @tag, example_language = @language, example_code = @code,  " +
                "example_source = @source, example_status = @status " +
                "WHERE example_id = @id ";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@title", updatedExample.Title);
                    cmd.Parameters.AddWithValue("@tag", updatedExample.Tag);
                    cmd.Parameters.AddWithValue("@language", updatedExample.Language);
                    cmd.Parameters.AddWithValue("@code", updatedExample.Code);
                    cmd.Parameters.AddWithValue("@source", updatedExample.Source);
                    cmd.Parameters.AddWithValue("@status", updatedExample.Status);
                    cmd.Parameters.AddWithValue("@id", updatedExample.Id);

                    int count = cmd.ExecuteNonQuery();

                    if (count == 1)
                    {
                        return updatedExample;
                    }
                    else
                    {
                        return null;
                    }
                }
            }
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
            example.Status = Convert.ToString(reader["example_status"]);
            return example;
        }

    }
}

