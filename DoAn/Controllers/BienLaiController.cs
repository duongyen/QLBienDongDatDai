using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class BienLaiController : Controller
    {
        // GET: BienLai
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Route("BienLai/DanhSachHoSo")]
        public ActionResult DanhSachHoSo()
        {
            try
            {
                List<vHoSo> lst;

                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    try
                    {
                        lst = db.vHoSoes.Where(u => u.IDTrangThai < 4).ToList();
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
        [Route("BienLai/CapNhatBienLai")]
        public ActionResult CapNhatBienLai(int IDHoSo, string NgayBienLai, string NgayHenTraGiayChungNhan)
        {
            try
            {
                bool result = false;
                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    HoSo hs = db.HoSoes.FirstOrDefault(u => u.IDHoSo == IDHoSo);
                    if (hs != null)
                    {
                        hs.NgayBienLai = DateTime.ParseExact(NgayBienLai, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        if (NgayHenTraGiayChungNhan == "")
                        {
                            hs.NgayHenTraGiayChungNhan = hs.NgayBienLai.Value.AddDays(5);
                        }
                        else
                            hs.NgayHenTraGiayChungNhan = DateTime.ParseExact(NgayHenTraGiayChungNhan, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        hs.IDTrangThai = 3;
                        db.SaveChanges();
                        result = true;
                    }
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
                        Message = "Không thể cập nhật thông tin biên lai",
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