using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication.DataService;
using MvcApplication.ViewModel;


namespace MvcApplication.Controllers
{
    public class TestController : Controller
    {
        //
        // GET: /Test/

        public ActionResult Index()
        {

            var dataService = new TestDataService();
            var employees = dataService.GetEmployees();

            return View(new TestViewModel {Employees = employees});
        }


        public JsonResult GetEmployeeList()
        {

            var dataService = new TestDataService();
            var employees = dataService.GetEmployees();

            //var empList = new {Employees = employees};
            return Json(employees);


        }
    }
    
}