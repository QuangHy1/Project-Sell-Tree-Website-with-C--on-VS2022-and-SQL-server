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
    
    public partial class SANPHAM
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SANPHAM()
        {
            this.GIOHANGs = new HashSet<GIOHANG>();
        }
    
        public string MaSP { get; set; }
        public string MaLSP { get; set; }
        public string TenSP { get; set; }
        public string XuatSu { get; set; }
        public string Nam { get; set; }
        public Nullable<int> Gia { get; set; }
        public string DonGia { get; set; }
        public string HinhAnh { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GIOHANG> GIOHANGs { get; set; }
        public virtual LOAISANPHAM LOAISANPHAM { get; set; }
    }
}
