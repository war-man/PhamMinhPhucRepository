//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShopCaPhe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DONDATHANG
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DONDATHANG()
        {
            this.CTDONHANGs = new HashSet<CTDONHANG>();
        }
    
        public int SoDH { get; set; }
        public int MaKH { get; set; }
        public Nullable<System.DateTime> NgayDH { get; set; }
        public string Ngaygiaohang { get; set; }
        public Nullable<decimal> TriGia { get; set; }
        public string TrangThai { get; set; }
        public string TenNguoiNhan { get; set; }
        public string DiaChiNhan { get; set; }
        public string DienThoaiNhan { get; set; }
        public Nullable<int> MaHTTT { get; set; }
        public Nullable<int> MaHTGH { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDONHANG> CTDONHANGs { get; set; }
        public virtual HINHTHUCGIAOHANG HINHTHUCGIAOHANG { get; set; }
        public virtual HINHTHUCTHANHTOAN HINHTHUCTHANHTOAN { get; set; }
    }
}
