using EMS_DAL.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS_DAL
{
    public static class DAL
    {
        static string connString = 
            ConfigurationManager.ConnectionStrings["SqlConnString"].ToString();

        public static DataSet GetEmployeesList()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command = new SqlCommand("select e.Number, e.FullName as 'Employee Name', e.Email, e.Gender, e.DateOfBirth, e.DateOfJoining, " +
                                    "e.Phone, e.Salary, e.Commission, d.FullName as 'Department', ISNULL(m.FullName, 'No Manager') as Manager " +
                                    "from Employees as e" +
                                    "	left join Employees as m on e.ReportingTo = m.Number " +
                                    "	join Departments as d on e.DepartmentNo = d.DepartmentId",
                                    connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static bool Login(string username, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"select Username from Users where Username = '{username}' and Password = '{password}'";
                    SqlCommand command = new SqlCommand(query, connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);

                    if(ds.Tables[0].Rows.Count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }

            }
            catch (Exception e)
            {
                // log
                return false;
            }

        }

        public static bool RegisterUser(string username, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"INSERT INTO Users(Username, Password) VALUES ('{username}', '{password}')";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    if (result == 1) // success insert
                    {
                        return true;
                    }
                    else // insert failed
                    {
                        return false;
                    }
                }

            }
            catch (Exception e)
            {
                // log
                return false;
            }

        }

        public static DataSet GetEmployeesByDept(int deptId)
        {
            // here
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command = new SqlCommand("select e.Number, e.FullName as 'Employee Name', e.Email, e.Gender, e.DateOfBirth, e.DateOfJoining, " +
                                    "e.Phone, e.Salary, e.Commission, d.FullName as 'Department', ISNULL(m.FullName, 'No Manager') as Manager " +
                                    "from Employees as e" +
                                    "	left join Employees as m on e.ReportingTo = m.Number " +
                                    "	join Departments as d on e.DepartmentNo = d.DepartmentId " +
                                    $"where e.DepartmentNo = {deptId}",
                                    connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static bool DeleteEmployee(int empId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command =
                        new SqlCommand($"DELETE Employees WHERE Number = {empId}", connection);
                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    if (result == 1) // success insert
                    {
                        return true;
                    }
                    else // insert failed
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static DataSet GetEmployeeId(int empId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command =
                        new SqlCommand($"select * from Employees where Number = {empId}", connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static bool AddEmployee(Employee employee)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"INSERT INTO Employees (FullName, Salary, Commission, DateOfJoining, DateOfBirth, DepartmentNo, JobTitle, ReportingTo, Email, Phone, Gender) " +
                                $"VALUES('{ employee.FullName }', { employee.Salary }, { employee.Commission }, '{ employee.DateOfJoining.ToString("yyyy-MM-dd") }'," +
                                $"'{ employee.DateOfBirth.ToString("yyyy-MM-dd") }', { employee.DepartmentNo }, '{ employee.JobTitle }', { employee.ReportingTo }," +
                                $"'{ employee.Email }', { employee.Phone }, '{ employee.Gender }')";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    if(result == 1) // success insert
                    {
                        return true;
                    }
                    else // insert failed
                    {
                        return false;
                    }
                }

            }
            catch(Exception e)
            {
                // log
                return false;
            }
        }

        public static bool UpdateEmployee(Employee employee)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"UPDATE Employees SET " +
                                $"FullName = '{ employee.FullName }', Salary = { employee.Salary }, Commission = { employee.Commission }, DateOfJoining = '{ employee.DateOfJoining.ToString("yyyy-MM-dd") }', " +
                                $"DateOfBirth = '{ employee.DateOfBirth.ToString("yyyy-MM-dd") }', DepartmentNo = { employee.DepartmentNo }, JobTitle = '{ employee.JobTitle }', ReportingTo = { employee.ReportingTo }, " +
                                $"Email = '{ employee.Email }', Phone = { employee.Phone }, Gender = '{ employee.Gender }' " +
                                $"WHERE Number = {employee.Number}";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    if (result == 1) // success insert
                    {
                        return true;
                    }
                    else // insert failed
                    {
                        return false;
                    }
                }

            }
            catch (Exception e)
            {
                // log
                return false;
            }
        }

        public static DataSet GetDepartments()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command =
                        new SqlCommand("select DepartmentId, FullName from Departments", connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static DataSet GetEmployeeIdAndName()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command =
                        new SqlCommand("select Number, FullName from Employees", connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
