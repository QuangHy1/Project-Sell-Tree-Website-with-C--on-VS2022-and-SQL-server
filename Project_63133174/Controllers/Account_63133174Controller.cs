using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Project_63133174.Models;

namespace Project_63133174.Controllers
{
    public class Account_63133174Controller : Controller
    {
        private Project_63133174Entities db = new Project_63133174Entities();

        // GET: Account_63133174
        public ActionResult Index()
        {
            return View(db.KHACHHANGs.ToList());
        }

        
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(Register_63133174 model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    // Random MaKH
                    Random random = new Random();
                    int randomNumber = random.Next(1000, 9999); // số có 4 chữ số
                    string maKH = "KH" + randomNumber.ToString();

                    // Lưu thông tin đăng ký vào CSDL
                    var khachHang = new KHACHHANG
                    {
                        MaKH = maKH,
                        HoTen = model.HoTen,
                        DiaChi = model.DiaChi,
                        SDT = model.SDT,
                        Email = model.Email,
                        MatKhau = model.MatKhau
                    };

                    db.KHACHHANGs.Add(khachHang);
                    db.SaveChanges();

                    ViewBag.SuccessMessage = "Đăng ký thành công!";
                    return RedirectToAction("Login", "Account_63133174");
                }
                catch (Exception ex)
                {
                    // Xử lý lỗi nếu có
                    ViewBag.ErrorMessage = "Đã xảy ra lỗi khi đăng ký: " + ex.Message;
                }
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Login_63133174 model)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra xem có khách hàng nào có email và mật khẩu khớp không
                var khachHang = db.KHACHHANGs.FirstOrDefault(kh => kh.Email == model.Email && kh.MatKhau == model.MatKhau);

                if (khachHang != null)
                {
                    // Đăng nhập thành công, chuyển hướng đến trang User
                    return RedirectToAction("Index", "User_63133174");
                }

                // Kiểm tra xem có nhân viên nào có email và mật khẩu khớp không
                var nhanVien = db.NHANVIENs.FirstOrDefault(nv => nv.Email == model.Email && nv.MatKhau == model.MatKhau);

                if (nhanVien != null)
                {
                    // Đăng nhập thành công, chuyển hướng đến trang Admin
                    return RedirectToAction("Index", "NHANVIENs63133174");
                }

                // Nếu không có khớp, hiển thị thông báo lỗi
                ModelState.AddModelError("", "Địa chỉ email hoặc mật khẩu không đúng.");
            }

            // Nếu ModelState không hợp lệ, hiển thị lại trang đăng nhập
            return View(model);
        }
    }
}
