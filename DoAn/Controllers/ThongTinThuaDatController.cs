using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class ThongTinThuaDatController : Controller
    {
        // GET: ThongTinThuaDat
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Route("ThongTinThuaDat/DanhSachThuaDat")]
        public ActionResult DanhSachThuaDat(int IDHoSo)
        {
            try
            {
                List<vThongTinThuaDat> lst;

                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    try
                    {
                        lst = db.vThongTinThuaDats.Where(u => u.IDHoSo == IDHoSo).ToList();
                    }
                    catch (Exception ex)
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
        [Route("ThongTinThuaDat/SuaThongTinThuaDat")]
        public ActionResult SuaThongTinThuaDat(int IDThuaDat, int IDHoSo, String ToBanDoSo, string ThuaDatSo, double TongDienTich, string QuaTrinhSuDung)
        {
            try
            {
                bool result = false;
                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    bool bInsert = false;
                    ThongTinThuaDat o = db.ThongTinThuaDats.FirstOrDefault(u => u.IDThuaDat == IDThuaDat);
                    if (o == null)
                    {
                        bInsert = true;
                        o = new ThongTinThuaDat();
                    }
                    o.IDHoSo = IDHoSo;
                    o.ToBanDoSo = ToBanDoSo;
                    o.ThuaDatSo = ThuaDatSo;
                    o.TongDienTich = TongDienTich;
                    o.QuaTrinhSuDung = QuaTrinhSuDung;
                    if (bInsert)
                    {
                        db.ThongTinThuaDats.Add(o);
                    }
                    db.SaveChanges();
                    result = true;
                }

                if (result)
                {
                    var obj = Json(new ObjectView<dynamic>()
                    {
                        State = DefaultView.DataState.Success,
                        Message = "",
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
                        Message = "Không thể thêm thửa đất",
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
        [Route("ThongTinThuaDat/XoaThuaDat")]
        public ActionResult XoaThuaDat(int IDThuaDat)
        {
            try
            {
                bool result = false;
                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    ThongTinThuaDat ct = db.ThongTinThuaDats.FirstOrDefault(u => u.IDThuaDat == IDThuaDat);
                    if (ct != null)
                    {
                        db.ThongTinThuaDats.Remove(ct);
                        var ctTd = db.ChiTietThuaDats.Where(u => u.IDThuaDat == IDThuaDat).ToList();
                        db.ChiTietThuaDats.RemoveRange(ctTd);
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
                        Message = "Không thể xóa thửa đất",
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