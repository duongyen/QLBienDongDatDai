using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class TiepNhanHoSoController : Controller
    {
        // GET: TiepNhanHoSo
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Route("TiepNhanHoSo/DanhSachTiepNhanHoSo")]
        public ActionResult DanhSachTiepNhanHoSo()
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

        public ActionResult TiepNhan()
        {
            return View();
        }

        // POST: TienNhanHoSo/Create
        [HttpPost]
        public ActionResult TiepNhan(FormCollection collection)
        {
            try
            {
                // validate


                // luu
                QLBienDongDangKyDatDaiEntities dbc = new QLBienDongDangKyDatDaiEntities();
                HoSo hs = dbc.HoSoes.Create();
                hs.MaHoSo = Convert.ToInt32(collection["MaHoSo"]);
                hs.IDLoaiHoSo = Convert.ToInt32(collection["IDLoaiHoSo"]);
                hs.IDPhuongXa = Convert.ToInt32(collection["IDPhuongXa"]);
                hs.SDTNguoiNopHoSo = collection["SDTNguoiNopHoSo"].ToString();
                hs.NguoiChuyenQSDD = collection["NguoiChuyenQSDD"];
                hs.NguoiChuyenDongSoHuu = collection["NguoiChuyenDongSoHuu"].ToString().ToLower().Contains("true");
                hs.NguoiNhanQSDD = collection["NguoiNhanQSDD"];
                hs.NguoiNhanDongSoHuu = collection["NguoiNhanDongSoHuu"].ToString().ToLower().Contains("true");
                hs.NgayNhanHoSo = Convert.ToDateTime(collection["NgayNhanHoSo"]);
                hs.NgayTraHoSo = Convert.ToDateTime(collection["NgayTraHoSo"]);
                hs.PhuongThucTiepNhanHS = collection["PhuongThucTiepNhanHS"].ToString() == "Trực tuyến";
                hs.IDTrangThai = 1;
                hs.IDCanBoTiepNhan = Common.uUser.IDCanBo;
                dbc.HoSoes.Add(hs);
                dbc.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}