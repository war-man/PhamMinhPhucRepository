using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
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

            if (Session["username"] == null && Session["Email"] == null)
            {
                return RedirectToAction("LoginSSO", "Account");
            }
            else
            {
                //List<KHACHHANG> lstKH
                List<SanPhamGH> listSP = LayGioHang();
                int TongSL = 0;
                double TongTien = 0;
                foreach (var item in listSP)
                {
                    TongSL += item.SoLuongMua;
                    TongTien += item.TongTien;
                   
                }
                var tongtien = String.Format("{0:N0}", TongTien);
               Session["TongSL"] = TongSL.ToString();
               Session["TongTien"] = tongtien.ToString();
                return View(listSP);
            }

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
                SP.SoLuong = int.Parse(sp.SoLuong.ToString());
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
                if (SL > SP.SoLuong)
                {
                    return Json(1);
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
                    return Json(lstSP, JsonRequestBehavior.AllowGet);
                }
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
            int x = 0;
            string danggiao = "Đang giao";
            string ngaygiao = "2019/12/1";
            if (Session["Email"] == null && Session["username"] == null)
            {
                return RedirectToAction("LoginSSO", "Account");
            }
            else
            {
               
                if(Session["username"]!=null)
                {
                     x = int.Parse(Session["makh"].ToString());
                }
                else
                {
                     x = int.Parse(Session["MaKH"].ToString());
                }
                var user = db.KHACHHANGs.FirstOrDefault(n => n.MaKH == x);

                if (user.DiaChiKH == null || user.DienThoaiKH == null)
                {
                    user = db.KHACHHANGs.Find(x);
                    {
                        user.DienThoaiKH = frm["dienthoainhanhang"];
                        user.DiaChiKH = frm["diachinhanhang"];

                    };
                     if(Session["username"] != null)
                    {
                        db.Entry(user);
                        donhang.MaKH = int.Parse(Session["makh"].ToString());
                        donhang.NgayDH = DateTime.Parse(DateTime.Now.ToString());
                        donhang.Ngaygiaohang = ngaygiao;
                        donhang.TriGia = decimal.Parse(Session["TongTien"].ToString());
                        donhang.TrangThai = danggiao;
                        donhang.TenNguoiNhan = frm["tennguoinhan"];
                        donhang.DienThoaiNhan = frm["dienthoainhanhang"];
                        donhang.DiaChiNhan = frm["diachinhanhang"];
                        db.DONDATHANGs.Add(donhang);
                        db.SaveChanges();
                        List<SanPhamGH> listSP = LayGioHang();
                        foreach (var item in listSP)
                        {
                            CTDONHANG ctdh = new CTDONHANG();
                            ctdh.SoDH = donhang.SoDH;
                            ctdh.MaSP = item.MaSP;
                            ctdh.SoLuong = item.SoLuongMua;
                            ctdh.DonGia = (decimal)item.DonGia;
                            db.CTDONHANGs.Add(ctdh);
                            db.SaveChanges();

                        }
                        Session["GioHang"] = null;
                        return RedirectToAction("ThanhToanThanhCong", "GioHang");
                    }
                     else
                    {
                        db.Entry(user);
                        donhang.MaKH = int.Parse(Session["MaKH"].ToString());
                        donhang.NgayDH = DateTime.Parse(DateTime.Now.ToString());
                        donhang.Ngaygiaohang = ngaygiao;
                        donhang.TriGia = decimal.Parse(Session["TongTien"].ToString());
                        donhang.TrangThai = danggiao;
                        donhang.TenNguoiNhan = frm["tennguoinhan"];
                        donhang.DienThoaiNhan = frm["dienthoainhanhang"];
                        donhang.DiaChiNhan = frm["diachinhanhang"];
                        db.DONDATHANGs.Add(donhang);
                        db.SaveChanges();
                        List<SanPhamGH> listSP = LayGioHang();
                        foreach (var item in listSP)
                        {
                            CTDONHANG ctdh = new CTDONHANG();
                            ctdh.SoDH = donhang.SoDH;
                            ctdh.MaSP = item.MaSP;
                            ctdh.SoLuong = item.SoLuongMua;
                            ctdh.DonGia = (decimal)item.DonGia;
                            db.CTDONHANGs.Add(ctdh);
                            db.SaveChanges();

                        }
                        Session["GioHang"] = null;
                        return RedirectToAction("ThanhToanThanhCong", "GioHang");
                    }
                }                
                else
                {
                    if(Session["username"]!=null)
                    {
                        donhang.MaKH = int.Parse(Session["makh"].ToString());
                        donhang.NgayDH = DateTime.Parse(DateTime.Now.ToString());
                        donhang.Ngaygiaohang = ngaygiao;
                        donhang.TriGia = decimal.Parse(Session["TongTien"].ToString());
                        donhang.TrangThai = danggiao;
                        donhang.TenNguoiNhan = frm["tennguoinhan"];
                        donhang.DienThoaiNhan = frm["dienthoainhanhang"];
                        donhang.DiaChiNhan = frm["diachinhanhang"];
                        db.DONDATHANGs.Add(donhang);
                        db.SaveChanges();
                        List<SanPhamGH> listSP = LayGioHang();
                        foreach (var item in listSP)
                        {
                            CTDONHANG ctdh = new CTDONHANG();
                            ctdh.SoDH = donhang.SoDH;
                            ctdh.MaSP = item.MaSP;
                            ctdh.SoLuong = item.SoLuongMua;
                            ctdh.DonGia = (decimal)item.DonGia;
                            db.CTDONHANGs.Add(ctdh);
                            db.SaveChanges();

                        }
                        Session["Madh"] = donhang.SoDH;
                        return RedirectToAction("ThanhToanThanhCong", "GioHang");
                    }
                    else
                    {
                        donhang.MaKH = int.Parse(Session["MaKH"].ToString());
                        donhang.NgayDH = DateTime.Parse(DateTime.Now.ToString());
                        donhang.Ngaygiaohang = ngaygiao;
                        donhang.TriGia = decimal.Parse(Session["TongTien"].ToString());
                        donhang.TrangThai = danggiao;
                        donhang.TenNguoiNhan = frm["tennguoinhan"];
                        donhang.DienThoaiNhan = frm["dienthoainhanhang"];
                        donhang.DiaChiNhan = frm["diachinhanhang"];
                        db.DONDATHANGs.Add(donhang);
                        db.SaveChanges();
                        List<SanPhamGH> listSP = LayGioHang();
                        foreach (var item in listSP)
                        {
                            CTDONHANG ctdh = new CTDONHANG();
                            ctdh.SoDH = donhang.SoDH;
                            ctdh.MaSP = item.MaSP;
                            ctdh.SoLuong = item.SoLuongMua;
                            ctdh.DonGia = (decimal)item.DonGia;
                            db.CTDONHANGs.Add(ctdh);
                            db.SaveChanges();

                        }
                        Session["Madh"] = donhang.SoDH;
                        return RedirectToAction("ThanhToanThanhCong", "GioHang");
                    }
                  
                }
            }
        }
        public ActionResult ThanhToanThanhCong()
        {
            int x = int.Parse(Session["Madh"].ToString());
            List<SanPhamGH> listSP = LayGioHang();
            List<DONDATHANG> dh = db.DONDATHANGs.Where(n => n.SoDH == x).ToList();
            ViewData["dondathang"] = dh;
            return View(listSP);
        }
        public ActionResult Thanhtoan()
        {
            if(Session["makh"]!=null)
            {
                int x = int.Parse(Session["makh"].ToString());
                List<KHACHHANG> KH = db.KHACHHANGs.Where(n => n.MaKH == x).ToList();
                return View(KH);

            }
            else
            {
                int x = int.Parse(Session["MaKH"].ToString());
                List<KHACHHANG> KH = db.KHACHHANGs.Where(n => n.MaKH == x).ToList();
                return View(KH);
            }
        }
    }
}