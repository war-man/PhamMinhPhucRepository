using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;

namespace ShopCaPhe.Areas.Admin.Controllers
{
    public class LoginAdminController : Controller
    {
        CàPheEntities db = new CàPheEntities();
        // GET: Admin/LoginAdmin
        public ActionResult LoginAdmin()
        {
            Session["MaAdmin"] = null;
            Session["TenDNAdmin"] = null;
            Session["Avartar"] = null;
            Session["Email"] = null;

            return View();
        }


        [HttpPost]
        public ActionResult LoginAdmin(ADMIN model)
        {
            using (db)
            {

                //Lấy username và password ở bản ghi đầu tiên
                var user = db.ADMINs.Where(x => x.TenDNAdmin == model.TenDNAdmin && x.MatKhauAdmin == model.MatKhauAdmin).FirstOrDefault();
                if (user == null)
                {

                    ViewBag.error = "Email or Password is fail";
                    return View("LoginAdmin",model);
                }
                else
                {
                    //ViewBag.avatar = user.Avatar;
                    //ViewBag.Online = user.IsActive;
                    //Session["Online"] = user.IsActive;
                    //Session["Avatar"] = user.Avatar;
                    Session["MaAdmin"] = user.MaAdmin;
                    Session["TenDNAdmin"] = user.TenDNAdmin;
                    Session["Avartar"] = user.HinhAnh;
                    Session["Email"] = user.EmailAdmin;

                    //return View(user)

                    return RedirectToAction("IndexAdmin", "AdminCRUD");
                }

            }
        }

    }
}