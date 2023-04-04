using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class ThuLyHoSoController : Controller
    {
        // GET: ThuLyHoSo
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        [Route("ThuLyHoSo/DanhSachChoThuLy")]
        public ActionResult DanhSachChoThuLy()
        {
            try
            {
                List<vDanhSachHoSo_TiepNhan> lst;

                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    try
                    {
                        lst = db.vDanhSachHoSo_TiepNhan.ToList();
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

        [HttpGet]
        [Route("ThuLyHoSo/ThuLy")]
        public ActionResult ThuLy(int IDHoSo)
        {
            vHoSo hoso;
            using (var db = new QLBienDongDangKyDatDaiEntities())
            {
                db.Configuration.LazyLoadingEnabled = false;
                try
                {
                    hoso = db.vHoSoes.FirstOrDefault(u=>u.IDHoSo == IDHoSo);
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

            return View(hoso);
        }

        [HttpPost]
        public ActionResult ThuLy(FormCollection collection)
        {
            try
            {
                // validate


                // luu
                QLBienDongDangKyDatDaiEntities dbc = new QLBienDongDangKyDatDaiEntities();
                int iIDHoSo = Convert.ToInt32(collection["IDHoSo"]);
                HoSo hs = dbc.HoSoes.FirstOrDefault(u=>u.IDHoSo == iIDHoSo);
                if (hs!= null)
                {
                    hs.SoPhieuChuyen = Convert.ToInt32( collection["SoPhieuChuyen"]);
                    hs.NgayGiao = Convert.ToDateTime(collection["NgayGiao"]);
                    hs.SoToTrinh = Convert.ToInt32(collection["SoToTrinh"]);
                    hs.NgayToTrinh =Convert.ToDateTime( collection["NgayToTrinh"]);
                    // ghi chus
                    hs.IDTrangThai = 2;
                    hs.IDCanBoThuLyHoSo = Common.uUser.IDCanBo;
                    dbc.SaveChanges();
                }

                return RedirectToAction("Index", "ThuLyHoSo");
            }
            catch (Exception ex)
            {
                return View();
            }
        }
    }
}