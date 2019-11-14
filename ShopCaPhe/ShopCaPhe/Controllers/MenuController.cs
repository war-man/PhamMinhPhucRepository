using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;


namespace ShopCaPhe.Controllers
{
    public class MenuController : Controller
    {
        CàPheEntities db = new CàPheEntities();
        // GET: Menu
        public ActionResult Menu()
        {
            return View(db.MENUs.OrderBy(n =>n.ID).Where(n=>n.ParentID==null).ToList());
        }
        public PartialViewResult ChildMenu(int? Id)
        {
            List<MENU> lstmenu = new List<MENU>();
            lstmenu = db.MENUs.Where(n => n.ParentID == Id).ToList();
            ViewBag.count = lstmenu.Count();
            return PartialView("ChildMenu", lstmenu);
        }
    }
}