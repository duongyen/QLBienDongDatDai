//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAn.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ThongTinThuaDat
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThongTinThuaDat()
        {
            this.ChiTietThuaDats = new HashSet<ChiTietThuaDat>();
        }
    
        public int IDThuaDat { get; set; }
        public Nullable<int> IDHoSo { get; set; }
        public Nullable<int> IDGCN { get; set; }
        public string ToBanDoSo { get; set; }
        public string ThuaDatSo { get; set; }
        public Nullable<double> TongDienTich { get; set; }
        public string QuaTrinhSuDung { get; set; }
        public string DiaChi { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietThuaDat> ChiTietThuaDats { get; set; }
        public virtual GiayChungNhan GiayChungNhan { get; set; }
    }
}