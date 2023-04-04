using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class LoaiDatController : Controller
    {
        // GET: LoaiDat
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Route("LoaiDat/DanhSachLoaiDat")]
        public ActionResult DanhSachLoaiDat()
        {
            List<LoaiDat> lst;
            using (var db = new QLBienDongDangKyDatDaiEntities())
            {
                db.Configuration.LazyLoadingEnabled = false;
                try
                {
                    lst = db.LoaiDats.ToList();
                }
                catch (Exception)
                {
                    lst = new List<LoaiDat>();
                }
                finally
                {
                    db.Dispose();
                }
            }
            return Json(lst, JsonRequestBehavior.AllowGet);

        }

    }
}