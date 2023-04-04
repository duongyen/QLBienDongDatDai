using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class LuuKhoController : Controller
    {
        // GET: LuuKho
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        [Route("LuuKho/DanhSachHoSo")]
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
                        lst = db.vHoSoes.Where(u => u.IDTrangThai < 5).ToList();
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
        [Route("LuuKho/LuuKhoHoSo")]
        public ActionResult LuuKhoHoSo(int IDHoSo)
        {
            try
            {
                bool result = false;
                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    HoSo hs = db.HoSoes.FirstOrDefault(u => u.IDHoSo == IDHoSo);
                    if (hs != null)
                    {
                        hs.NgayLuuKho = DateTime.Now;
                        hs.IDTrangThai = 5;
                        db.SaveChanges();
                        result = true;
                    }
                }

                if (result)
                {
                    var obj = Json(new ObjectView<dynamic>()
                    {
                        State = DefaultView.DataState.Success,
                        Message ="",
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
                        Message = "Không thể lưu kho ",
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