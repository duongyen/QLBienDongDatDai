using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class ChiTietThuaDatController : Controller
    {
        // GET: ChiTietThuaDat
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Route("ChiTietThuaDat/DanhSachChiTietThuaDat")]
        public ActionResult DanhSachChiTietThuaDat(int IDThuaDat)
        {
            try
            {
                List<vChiTietThuaDat> lst;

                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    try
                    {
                        lst = db.vChiTietThuaDats.Where(u => u.IDThuaDat == IDThuaDat).ToList();
                    }
                    catch (Exception)
                    {

                        throw;
                    }
                    finally
                    {
                        db.Dispose();
                    }
                }

                var obj = Json(new ObjectView<dynamic>()
                {
                    State = DefaultView.DataState.Success,
                    Message = "",
                    Data = lst,
                    redirectTo = ""
                }, JsonRequestBehavior.AllowGet);
                return obj;
            }
            catch (Exception e)
            {
                return Json(new DefaultView()
                {
                    State = DefaultView.DataState.Error,
                    Message = e.Message,
                    Exception = e
                });
            }

        }

        [HttpPost]
        [Route("ChiTietThuaDat/SuaChiTietThuaDat")]
        public ActionResult SuaChiTietThuaDat(int IDHoSo, int IDThuaDat, int IDLoaiDat, double DienTich, string MucDichSD_ChiTiet, string NgayHinhThanh, string SuDungDenNgay, string GhiChu)
        {
            try
            {
                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    ThongTinThuaDat o = db.ThongTinThuaDats.FirstOrDefault(u => u.IDThuaDat == IDThuaDat);
                    if (o == null)
                    {
                        o = db.ThongTinThuaDats.Create();
                        db.ThongTinThuaDats.Add(o);
                        db.SaveChanges();
                        IDThuaDat = o.IDThuaDat;
                    }
                }
                bool result = false;
                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    ChiTietThuaDat ct = db.ChiTietThuaDats.FirstOrDefault(u => u.IDThuaDat == IDThuaDat && u.IDLoaiDat == IDLoaiDat);
                    if (ct == null)
                    {
                        var td = new ChiTietThuaDat();
                        td.IDLoaiDat = IDLoaiDat;
                        td.IDThuaDat = IDThuaDat;
                        td.DienTich = DienTich;
                        td.GhiChu = GhiChu;
                        td.MucDichSD_ChiTiet = MucDichSD_ChiTiet;
                        if (NgayHinhThanh.Trim() != "")
                        {
                            td.NgayHinhThanh = DateTime.ParseExact(NgayHinhThanh, "dd/mm/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        }
                        else
                        {
                            td.NgayHinhThanh = null;
                        }
                        if (NgayHinhThanh.Trim() != "")
                        {
                            td.SuDungDenNgay = DateTime.ParseExact(SuDungDenNgay, "dd/mm/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        }
                        else
                        {
                            td.SuDungDenNgay = null;
                        }
                        db.ChiTietThuaDats.Add(td);
                        db.SaveChanges();
                    }
                    else
                    {
                        ct.DienTich = DienTich;
                        ct.GhiChu = GhiChu;
                        ct.MucDichSD_ChiTiet = MucDichSD_ChiTiet;
                        if (NgayHinhThanh.Trim() != "")
                        {
                            ct.NgayHinhThanh = DateTime.ParseExact(NgayHinhThanh, "dd/mm/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        }
                        else
                        {
                            ct.NgayHinhThanh = null;
                        }
                        if (NgayHinhThanh.Trim() != "")
                        {
                            ct.SuDungDenNgay = DateTime.ParseExact(SuDungDenNgay, "dd/mm/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        }
                        else
                        {
                            ct.SuDungDenNgay = null;
                        }
                        db.SaveChanges();
                    }
                    result = true;
                }

                if (result)
                {
                    var obj = Json(new ObjectView<dynamic>()
                    {
                        State = DefaultView.DataState.Success,
                        Message = IDThuaDat.ToString(),
                        Data = result,
                        redirectTo = ""
                    }, JsonRequestBehavior.AllowGet);
                    return obj;
                }
                else
                {
                    return Json(new DefaultView()
                    {
                        State = DefaultView.DataState.Error,
                        Message = "Không thể thêm mục đích sử dụng",
                    }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception e)
            {
                return Json(new DefaultView()
                {
                    State = DefaultView.DataState.Error,
                    Message = e.Message,
                    Exception = e
                });
            }
        }

        [HttpPost]
        [Route("ChiTietThuaDat/XoaChiTietThuaDat")]
        public ActionResult XoaChiTietThuaDat(int IDThuaDat, int IDLoaiDat)
        {
            try
            {
                bool result = false;
                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    ChiTietThuaDat ct = db.ChiTietThuaDats.FirstOrDefault(u => u.IDThuaDat == IDThuaDat && u.IDLoaiDat == IDLoaiDat);
                    if (ct != null)
                    {
                        db.ChiTietThuaDats.Remove(ct);
                        db.SaveChanges();
                        result = true;
                    }
                }

                if (result)
                {
                    var obj = Json(new ObjectView<dynamic>()
                    {
                        State = DefaultView.DataState.Success,
                        Message = IDThuaDat.ToString(),
                        Data = result,
                        redirectTo = ""
                    }, JsonRequestBehavior.AllowGet);
                    return obj;
                }
                else
                {
                    return Json(new DefaultView()
                    {
                        State = DefaultView.DataState.Error,
                        Message = "Không thể xóa mục đích xử dụng",
                    }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception e)
            {
                return Json(new DefaultView()
                {
                    State = DefaultView.DataState.Error,
                    Message = e.Message,
                    Exception = e
                });
            }
        }
    }
}