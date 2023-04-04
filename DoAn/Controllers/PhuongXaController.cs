using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class PhuongXaController : BaseControllerMVC
    {
        // GET: PhuongXa
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult RenderPartial()
        {
            QLBienDongDangKyDatDaiEntities dbc = new QLBienDongDangKyDatDaiEntities();
            List<PhuongXa> lstPhuong = dbc.PhuongXas.ToList();
            return PartialView(lstPhuong);
        }

        [HttpGet]
        [Route("PhuongXa/DanhSachPhuongXa")]
        public ActionResult DanhSachPhuongXa(string NgayBaoCao)
        {
            try
            {
                QLBienDongDangKyDatDaiEntities dbc = new QLBienDongDangKyDatDaiEntities();
                List<PhuongXa> lst;// = dbc.PhuongXas.ToList();

                using (var db = new QLBienDongDangKyDatDaiEntities())
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    try
                    {
                        lst = db.PhuongXas.ToList();
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

        // GET: PhuongXa/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: PhuongXa/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PhuongXa/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: PhuongXa/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: PhuongXa/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: PhuongXa/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: PhuongXa/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
