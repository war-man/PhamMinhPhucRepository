using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopCaPhe.Models
{
    public class SanPhamGH
    {
        CàPheEntities db = new CàPheEntities();
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public string Donvitinh { get; set; }
        public string Mota { get; set; }
        public double DonGia { get; set; }
        public DateTime Ngay { get; set; }
        public string HinhMinhHoa { get; set; }
        public int SoLuong { get; set; }
        public int SoLuongMua { get; set;}
        public int MaLoai { get; set; }
        public double TongTien => SoLuongMua * DonGia;
        public string TenLoai { get; set; }
    }
}