using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
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

            //int month = int.Parse(frmTao["thang"]);
            //int year = int.Parse(frmTao["nam"]);
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
            List<DONDATHANG> ddh = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == imonth && n.NgayDH.Value.Year ==iyear ).ToList();
            var x = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == imonth && n.NgayDH.Value.Year == iyear).Sum(n => n.TriGia);
            Session["TongDG"] = x;
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
    }
}