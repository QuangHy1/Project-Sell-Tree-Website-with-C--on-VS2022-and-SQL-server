//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Project_63133174.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class GIOHANG
    {
        public string SoHD { get; set; }
        public string MaKH { get; set; }
        public string MaSP { get; set; }
        public Nullable<System.DateTime> NgayDat { get; set; }
        public Nullable<System.DateTime> NgayGiao { get; set; }
        public Nullable<int> TongTien { get; set; }
        public string DonGia { get; set; }
    
        public virtual KHACHHANG KHACHHANG { get; set; }
        public virtual SANPHAM SANPHAM { get; set; }
    }
}
