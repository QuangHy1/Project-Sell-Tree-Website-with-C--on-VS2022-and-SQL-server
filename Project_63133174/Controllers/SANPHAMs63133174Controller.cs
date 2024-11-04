using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Project_63133174.Models;

namespace Project_63133174.Controllers
{
    public class SANPHAMs63133174Controller : Controller
    {
        private Project_63133174Entities db = new Project_63133174Entities();

        // GET: SANPHAMs63133174
        public ActionResult Index(string tenSP = "",string maSP = "", string maLSP = "")
        {
            ViewBag.TenSP = tenSP;
            ViewBag.MaSP = maSP;
            ViewBag.MaLSP = maLSP;
            ViewBag.MaLSP = new SelectList(db.LOAISANPHAMs, "MaLSP", "TenLSP");
            var sanphams = db.SANPHAMs.SqlQuery("exec SanPham_TimKiem1'" + tenSP + "','" + maSP + "','" + maLSP + "'");
            if (sanphams.Count() == 0)
                ViewBag.TB = "Không có thông tin tìm kiếm.";
            return View(sanphams.ToList());
        }

        // GET: SANPHAMs63133174/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // GET: SANPHAMs63133174/Create
        public ActionResult Create()
        {
            ViewBag.MaLSP = new SelectList(db.LOAISANPHAMs, "MaLSP", "TenLSP");
            return View();
        }

        // POST: SANPHAMs63133174/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSP,MaLSP,TenSP,XuatSu,Nam,Gia,DonGia,HinhAnh")] SANPHAM sANPHAM)
        {
            if (ModelState.IsValid)
            {
                db.SANPHAMs.Add(sANPHAM);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLSP = new SelectList(db.LOAISANPHAMs, "MaLSP", "TenLSP", sANPHAM.MaLSP);
            return View(sANPHAM);
        }

        // GET: SANPHAMs63133174/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLSP = new SelectList(db.LOAISANPHAMs, "MaLSP", "TenLSP", sANPHAM.MaLSP);
            return View(sANPHAM);
        }

        // POST: SANPHAMs63133174/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SANPHAM sANPHAM, HttpPostedFileBase fileInput)
        {
            if (ModelState.IsValid)
            {
                // Xử lý lưu hình ảnh mới vào thư mục của bạn và cập nhật thông tin sản phẩm
                if (fileInput != null && fileInput.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(fileInput.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images/"), fileName);
                    fileInput.SaveAs(path);

                    // Cập nhật đường dẫn hoặc tên tệp hình ảnh mới vào thuộc tính HinhAnh của sản phẩm
                    sANPHAM.HinhAnh = fileName;
                }

                db.Entry(sANPHAM).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLSP = new SelectList(db.LOAISANPHAMs, "MaLSP", "TenLSP", sANPHAM.MaLSP);
            return View(sANPHAM);
        }

        // GET: SANPHAMs63133174/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // POST: SANPHAMs63133174/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            db.SANPHAMs.Remove(sANPHAM);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
