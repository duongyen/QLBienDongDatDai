using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class LoaiHoSoController : Controller
    {
        // GET: LoaiHoSo
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult RenderPartial()
        {
            QLBienDongDangKyDatDaiEntities dbc = new QLBienDongDangKyDatDaiEntities();
            List<LoaiHoSo> lstLoaiHoSo = dbc.LoaiHoSoes.ToList();
            return PartialView(lstLoaiHoSo);
        }
    }
}