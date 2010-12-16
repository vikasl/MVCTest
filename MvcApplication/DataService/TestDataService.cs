using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication.DataService
{
    public class TestDataService
    {

        public List<Employee> GetEmployees()
        {
            return new List<Employee>
                {
                    new Employee {EmployeeName = "Sam singh", Age = 35, IsManager = false, Salary = 40000},
                    new Employee {EmployeeName = "George Smith", Age = 39, IsManager = true, Salary = 5000}
                };

        }

    }
}