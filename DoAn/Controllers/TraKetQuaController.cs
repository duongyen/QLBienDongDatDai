using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class TraKetQuaController : Controller
    {
        // GET: TraKetQua
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        [Route("TraKetQua/DanhSachTraKetQua")]
        public ActionResult DanhSachTraKetQua()
        {
            try
            {
                List<vHoSo> lst;

                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    try
                    {
                        lst = db.vHoSoes.Where(u => u.IDTrangThai < 4 ).ToList();
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
        [Route("TraKetQua/LuuKetQua")]
        public ActionResult LuuKetQua(int IDHoSo, string NgayTraKetQua, decimal LePhi)
        {
            try
            {
                bool result = false;
                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    HoSo hs = db.HoSoes.FirstOrDefault(u => u.IDHoSo == IDHoSo);
                    if (hs != null)
                    {
                        hs.NgayTraKetQua = DateTime.ParseExact(NgayTraKetQua,"dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        hs.LePhi = LePhi;
                        hs.IDTrangThai = 4;
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
                        Message = "Không thể trả kết quả ",
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