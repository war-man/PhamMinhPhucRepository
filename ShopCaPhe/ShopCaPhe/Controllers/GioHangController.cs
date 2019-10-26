using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;

namespace ShopCaPhe.Controllers
{
    public class GioHangController : Controller
    {
        CàPheEntities db = new CàPheEntities();
      
        public List<SanPhamGH> LayGioHang()
        {
            List<SanPhamGH> lstSP = Session["GioHang"] as List<SanPhamGH>;
            if (lstSP == null)
            {
                lstSP = new List<SanPhamGH>();
                Session["GioHang"] = lstSP;
            }
            return lstSP;
        }
        public ActionResult GioHang()
        {
            List<SanPhamGH> listSP = LayGioHang();
            int TongSL = 0;
            double TongTien = 0;
            foreach (var item in listSP)
            {
                TongSL += item.SoLuongMua;
                TongTien += item.TongTien;
            }
            Session["TongSL"] = TongSL.ToString();
            Session["TongTien"] = TongTien.ToString();
            return View(listSP);
        }
        [HttpPost]
        public ActionResult ThemGioHang(int iMaSP, int? SL)
        {
            List<SanPhamGH> lstSP = LayGioHang();
            SanPhamGH SP = lstSP.Find(n => n.MaSP == iMaSP);
            if (SP == null)
            {
                SP = new SanPhamGH();
                SANPHAM sp = db.SANPHAMs.Single(n => n.MaSP == iMaSP);
                SP.MaSP = iMaSP;
                SP.TenSP = sp.TenSP;
                SP.HinhMinhHoa = sp.HinhMinhHoa;
                SP.DonGia = double.Parse(sp.DonGia.ToString());
                if (SL == null)
                {
                    SP.SoLuongMua = 1;
                }
                else
                {
                    SP.SoLuongMua = int.Parse(SL.ToString());
                }
                lstSP.Add(SP);

                Session["GioHang"] = lstSP;
                return Json(lstSP,JsonRequestBehavior.AllowGet);
            }
            else
            {
                if (SL == null)
                {
                    SP.SoLuongMua++;
                }
                else
                {
                    SP.SoLuongMua = int.Parse(SL.ToString());
                }
                Session["GioHang"] = lstSP;
                return Json(lstSP,JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult XoaSP(int iMaSP)
        {
            List<SanPhamGH> lstSP = LayGioHang();
            SanPhamGH SP = lstSP.Find(n => n.MaSP == iMaSP);
            lstSP.Remove(SP);
            Session["GioHang"] = lstSP;
            return Json(lstSP, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult GioHang(FormCollection frm, DONDATHANG donhang)
        {
            if (Session["MaKH"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                List<SanPhamGH> listSP = LayGioHang();
                foreach (var item in listSP)
                {
                    bool a = false;
                    donhang.MaKH = int.Parse(Session["MaKH"].ToString());
                    donhang.NgayDH = DateTime.Parse(DateTime.Now.ToString());
                    //donhang.NgayGiaoHang = DateTime.Parse(frm["ngaynhanhang"].ToString());
                    donhang.TriGia = int.Parse(Session["TongTien"].ToString());
                    donhang.TrangThai = a;
                    donhang.TenNguoiNhan = frm["tennguoinhan"];
                    donhang.DienThoaiNhan = frm["dienthoainhanhang"];
                    donhang.DiaChiNhan = frm["diachinhanhang"];
                    db.DONDATHANGs.Add(donhang);
                    db.SaveChanges();
                }

                return RedirectToAction("ThanhToanThanhCong", "GioHang");
            }
        }
        public ActionResult ThanhToanThanhCong()
        {
            return View();
        }
    }
}