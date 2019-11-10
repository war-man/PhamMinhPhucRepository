using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;

namespace ShopCaPhe.Controllers
{
    public class ViewSPController : Controller
    {
        CàPheEntities db = new CàPheEntities();
        // GET: ViewSP
        public ActionResult LoaiSP(int? MaLoai)
        {
            ViewBag.name = db.LOAISPs.SingleOrDefault(n => n.MaLoai == MaLoai).TenLoai;

            List<SANPHAM> sp = db.SANPHAMs.Where(n => n.MaLoai == MaLoai).ToList();

            return View(sp);

        }
        public ActionResult ChiTietSanPham(int? MaSP)
        {
            if (Session["Email"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                if (MaSP == null)
                {
                    MaSP = int.Parse(TempData["MaSP"].ToString());
                    List<DANHGIASANPHAM> DG = db.DANHGIASANPHAMs.Where(n => n.MaSP == MaSP).OrderByDescending(n => n.MaDG).ToList();
                    ViewData["listDG"] = DG;
                    List<DANHGIASANPHAM> LDG = db.DANHGIASANPHAMs.Where(n => n.MaSP == MaSP).ToList();
                    double DGTB = 0;
                    int DiemDG = 0;
                    for (int i = 0; i < LDG.Count(); i++)
                    {
                        DiemDG += int.Parse(LDG[i].DiemDG.ToString());
                    }
                    DGTB = DiemDG / LDG.Count();

                    return View(db.SANPHAMs.SingleOrDefault(n => n.MaSP == MaSP));
                }
                else
                {
                    var countdg = db.DANHGIASANPHAMs.Where(x => x.MaSP == MaSP).Count();
                    List<DANHGIASANPHAM> DG = db.DANHGIASANPHAMs.Where(n => n.MaSP == MaSP).OrderByDescending(n => n.MaDG).ToList();
                    ViewData["listDG"] = DG;
                    Session["CountDG"] = countdg;
                    return View(db.SANPHAMs.SingleOrDefault(n => n.MaSP == MaSP));
                }
            }

        }

        [HttpPost]
        public ActionResult ChiTietSanPham(int iMaSach, string iName, string iComment, string Ngay, int iRating, DANHGIASANPHAM DG)
        {

            
            DG.MaSP = iMaSach;
            DG.HoTenKH = iName;
            DG.BinhLuan = iComment;
            DG.DiemDG = iRating;
            DG.ThoiGian = DateTime.Parse(Ngay);
            TempData["MaSach"] = iMaSach;
            db.DANHGIASANPHAMs.Add(DG);
            db.SaveChanges();
            List<DANHGIASANPHAM> LDG = db.DANHGIASANPHAMs.Where(n => n.MaSP == iMaSach).ToList();
            double DGTB = 0;
            int DiemDG = 0;
            for (int i = 0; i < LDG.Count(); i++)
            {
                DiemDG += int.Parse(DG.DiemDG.ToString());
            }
            DGTB = DiemDG / LDG.Count();

            return RedirectToAction("Login", "Home");


        }
    }
}