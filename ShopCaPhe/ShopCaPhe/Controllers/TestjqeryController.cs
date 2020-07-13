using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;
using System.Net.Mail;
using System.Net;

namespace ShopCaPhe.Controllers
{
    public class TestjqeryController : Controller
    {
        // GET: Testjqery
        CàPheEntities db = new CàPheEntities();
        MailModel mail = new MailModel();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Index2()
        {
            return View();
        }
        public ActionResult Mail()
        {
            return View();
        }
            
    }
}