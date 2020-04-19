using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;
namespace ShopCaPhe.Areas.Admin.Controllers
{
    public class ThongKeController : Controller
    {

        CàPheEntities db = new CàPheEntities();
        public ActionResult ThongKe(int? iyear, int? imonth)
        {
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;

            //int month = int.Parse(frmTao["thang"]);
            //int year = int.Parse(frmTao["nam"]);


            List<DONDATHANG> ddh = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == imonth && n.NgayDH.Value.Year == iyear && n.TrangThai=="Đã giao").ToList();
            var x = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == imonth && n.NgayDH.Value.Year == iyear && n.TrangThai=="Đã giao").Sum(n => n.TriGia);
            Session["TongDG"] = x;
            Session["month"] = imonth;
            Session["year"] = iyear;
            Session["data"] = ddh;

            return View(ddh);
        }
        //[HttpPost]
        //public ActionResult ThongKe(FormCollection frmTao)
        //{
        //    int month =int.Parse(frmTao["thang"]);
        //    int year =int.Parse(frmTao["nam"]);
        //    ViewBag.month = month;
        //    ViewBag.year = year;
        //    List<DONDATHANG> ddh = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year).ToList();
        //    var x = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year).Sum(n => n.TriGia);
        //    Session["TongDG"] = x;
        //    return RedirectToAction("ThongKe","ThongKe");
        //}
        public PartialViewResult DSThongKePartial(int IdMonth = 10, int IdYear = 2019)
        {
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;

            // SELECT* FROM KHACHHANG WHERE MONTH(NGAYSINH) = 2 AND YEAR(NGAYSINH)= 2000
            var DSThongKeThang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == IdMonth && n.NgayDH.Value.Year == IdYear).ToList();

            ViewBag.DS = DSThongKeThang;
            return PartialView(ViewBag.DS);

        }
        public ActionResult HoaDon(int? year, int? month, int? day)
        {
            List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday;
            List<DONDATHANG> donhang1 = db.DONDATHANGs.ToList();
            List<DONDATHANG> donhang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year && n.NgayDH.Value.Day == day).ToList();

            Session["data"] = donhang;
            Session["year"] = year;
            Session["month"] = month;

            return View(donhang1);
        }

        public ActionResult Hoadonngay(int? day, int? year, int? month)
        {
            List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday;
            Session["year"] = year;
            Session["month"] = month;
            Session["day"] = day;
            List<DONDATHANG> donhang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Day == day && n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year).ToList();
            return View(donhang);
        }

        public ActionResult Hoadonthang(int? year, int? month)
        {
            List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday;
            Session["year"] = year;
            Session["month"] = month;
            List<DONDATHANG> donhang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year).ToList();
            return View(donhang);
        }

        public ActionResult Hoadonnam(int? year)
        {
            List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday;
            Session["year"] = year;
            List<DONDATHANG> donhang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Year == year).ToList();
            return View(donhang);
        }
        public ActionResult EditHoaDon(int? sohd)
        {

            //CTDONHANG dh = db.CTDONHANGs.Find(sohd);
            List<CTDONHANG> donhang = db.CTDONHANGs.Where(n => n.SoDH == sohd).ToList();
            //ViewData["datadh"] = db.SANPHAMs.Where(n => n.MaSP == dh.MaSP );
            ViewBag.trigia = db.DONDATHANGs.SingleOrDefault(n => n.SoDH == sohd).TriGia;

            return View(donhang);
        }


        public ActionResult Edit(int? id)
        {
            //Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            //Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);

            // List<Category> lis = db.Categories.ToList();
            List<CTDONHANG> donhang = db.CTDONHANGs.Where(n => n.SoDH == id).ToList();
            ViewData["listdh"] = donhang;
            DONDATHANG dh = db.DONDATHANGs.Find(id);
            return View(dh);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SoDH,MaKH,NgayDH,Ngaygiaohang,TriGia,TrangThai,TenNguoiNhan,DiaChiNhan,DienThoaiNhan,MaHTTT,MaHTGH")] DONDATHANG dh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("HoaDon","ThongKe");
            }
            return View(dh);
        }

        public ActionResult xulytrangthai(int? id)
        {
            var trangthaithuc = "";
            DONDATHANG dh = db.DONDATHANGs.Find(id);
            if (dh.TrangThai == "Đã giao")
            {
                trangthaithuc = "Đang giao";
            }
            else
            {
                trangthaithuc = "Đã giao";
            }
            dh.TrangThai = trangthaithuc;
            db.Entry(dh).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("HoaDon");
        }

    }
}

