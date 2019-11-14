using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
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
            return View(db.SANPHAMs.Take(20).Where(x => x.MaLoai==1 || x.MaLoai== 2 || x.MaLoai == 3 || x.MaLoai == 6).ToList());
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
        public ActionResult DangXuat()
        {
            Session["Email"] = null;
            Session["Email"] = null;
            Session["Password"] = null;
            return Redirect("/");

        }
        public ActionResult timkiem(string name)
        { 
            List<SANPHAM> sp = db.SANPHAMs.Where(n => n.TenSP.Contains(name)).ToList();
            Session["nametimkiem"] = name;
            return View(sp);
        }

        public PartialViewResult MayxayPartial ()
        {

            return PartialView(db.SANPHAMs.Where(n => n.MaLoai == 4).ToList());

        }

        public PartialViewResult MayphaPartial ()
        {

            return PartialView(db.SANPHAMs.Where(n => n.MaLoai == 5).ToList());

        }
        [HttpGet]
        public ActionResult Popup(int? iMaSP)
        {
            SANPHAM sp = (from p in db.SANPHAMs where p.MaSP == iMaSP select p).ToArray()[0];
            return Json(new { name = sp.TenSP, price = sp.DonGia, hinhminhhoa = sp.HinhMinhHoa, donvitinh = sp.Donvitinh, mota = sp.MoTa, trangthai = sp.TrangThai, soluong=sp.SoLuong, masp=sp.MaSP }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult GioiThieu()
        {
            return View();
        }



    }
}

