using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;

namespace ShopCaPhe.Areas.Admin.Controllers
{
    public class MenuAdminController : Controller
    {
        CàPheEntities db = new CàPheEntities();
        // GET: Admin/Menu
        public ActionResult CreateMenu()
        {
            List<MENU> mn = db.MENUs.ToList();

            var f = from s in db.LOAISPs select s;
            ViewBag.sklist = db.LOAISPs.ToList();
            return View(mn);

        }
        [HttpPost]
        public ActionResult CreateMenu(FormCollection frmCreate, MENU mn)
        {
            mn.MenuName =frmCreate["MenuName"];
            //mn.ParentID=frmCreate["ParentID"];
            mn.Link =frmCreate["Link"];
            mn.CreateDate = DateTime.Now;
            db.MENUs.Add(mn);
            db.SaveChanges();
            return RedirectToAction("CreateMenu", "MenuAdmin");
        }
        public ActionResult DeleteMenu(int? id)
        {
            MENU mn = db.MENUs.Find(id);
            return View(mn);
        }
        [HttpPost, ActionName("DeleteMenu")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteMenu(int id)
        {

            MENU mn = db.MENUs.Find(id);
            db.MENUs.Remove(mn);
            db.SaveChanges();
            return RedirectToAction("CreateMenu");
        }
        public ActionResult EditMenu(int? id)
        {
            // List<Category> lis = db.Categories.ToList();

            MENU sp = db.MENUs.Find(id);
            return View(sp);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMenu([Bind(Include = "ID,MenuName,ParentID,CreateDate,UpdateDate,Link")] MENU mn)
        {
            if (ModelState.IsValid)
            {
                mn.UpdateDate = DateTime.Now;
                db.Entry(mn).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("CreateMenu");
            }
            return View(mn);
        }

    }
}