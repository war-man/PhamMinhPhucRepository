using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;

namespace ShopCaPhe.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        CàPheEntities db = new CàPheEntities();
        public ActionResult TrangChu()
        {
            return View();
        }
        public ActionResult Index()
        {
            return View(db.SANPHAMs.ToList());
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(KHACHHANG model)
        {
            using (db)
            {

                //Lấy username và password ở bản ghi đầu tiên
                var user = db.KHACHHANGs.Where(x => x.TenDN == model.TenDN && x.MatKhau == model.MatKhau).FirstOrDefault();
                if (user == null)
                {

                    ViewBag.error = "Email or Password is fail";
                    return View("Login", model);
                }
                else
                {
                    //ViewBag.avatar = user.Avatar;
                    //ViewBag.Online = user.IsActive;
                    //Session["Online"] = user.IsActive;
                    //Session["Avatar"] = user.Avatar;
                    Session["MaKH"] = user.MaKH;
                    Session["Email"] = user.TenDN;
                    Session["Password"] = user.MatKhau;
                    //return View(user)

                    return RedirectToAction("Index", "Home");
                }

            }
        }
    }
}
 
