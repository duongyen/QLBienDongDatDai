﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class QLBienDongDangKyDatDaiEntities : DbContext
{
    public QLBienDongDangKyDatDaiEntities()
        : base("name=QLBienDongDangKyDatDaiEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<CanBo> CanBoes { get; set; }
    public virtual DbSet<ChiTietThuaDat> ChiTietThuaDats { get; set; }
    public virtual DbSet<ChucNang> ChucNangs { get; set; }
    public virtual DbSet<ChuSuDung> ChuSuDungs { get; set; }
    public virtual DbSet<GiayChungNhan> GiayChungNhans { get; set; }
    public virtual DbSet<HoSo> HoSoes { get; set; }
    public virtual DbSet<LoaiDat> LoaiDats { get; set; }
    public virtual DbSet<LoaiHoSo> LoaiHoSoes { get; set; }
    public virtual DbSet<PhanQuyenNguoiDung> PhanQuyenNguoiDungs { get; set; }
    public virtual DbSet<PhuongXa> PhuongXas { get; set; }
    public virtual DbSet<ThongTinThuaDat> ThongTinThuaDats { get; set; }
    public virtual DbSet<To> Toes { get; set; }
    public virtual DbSet<TrangThaiHoSo> TrangThaiHoSoes { get; set; }
    public virtual DbSet<vChiTietThuaDat> vChiTietThuaDats { get; set; }
    public virtual DbSet<vDanhSachHoSo_TiepNhan> vDanhSachHoSo_TiepNhan { get; set; }
    public virtual DbSet<vGiayChungNhan> vGiayChungNhans { get; set; }
    public virtual DbSet<vHoSo> vHoSoes { get; set; }
    public virtual DbSet<vThongTinThuaDat> vThongTinThuaDats { get; set; }
}
