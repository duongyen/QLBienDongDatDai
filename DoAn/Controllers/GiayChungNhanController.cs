using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class GiayChungNhanController : Controller
    {
        // GET: GiayChungNhan
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        [Route("GiayChungNhan/DanhSachGiayChungNhan")]
        public ActionResult DanhSachGiayChungNhan(int IDHoSo)
        {
            try
            {
                List<vGiayChungNhan> lst;

                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    try
                    {
                        lst = db.vGiayChungNhans.Where(u => u.IDHoSo == IDHoSo).ToList();
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

    }
}