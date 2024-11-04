using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Project_63133174.Models
{
    public class Register_63133174
    {
        private Project_63133174Entities db = new Project_63133174Entities();

        [Display(Name = "Họ và tên")]
        [Required(ErrorMessage = "Họ và tên không được để trống.")]
        public string HoTen { get; set; }

        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Địa chỉ không được để trống.")]
        public string DiaChi { get; set; }

        [Key]
        [Display(Name = "Số điện thoại")]
        [Required(ErrorMessage = "Số điện thoại không được để trống.")]
        [RegularExpression(@"^[0-9]{10}$", ErrorMessage = "Số điện thoại phải có 10 chữ số.")]
        [UniqueSDT(ErrorMessage = "Số điện thoại đã được sử dụng.")]
        public string SDT { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Email không được để trống.")]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ.")]
        [UniqueEmail(ErrorMessage = "Email đã được sử dụng.")]
        public string Email { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được để trống.")]
        public string MatKhau { get; set; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Required(ErrorMessage = "Xác nhận mật khẩu không được để trống.")]
        [Compare("MatKhau", ErrorMessage = "Mật khẩu và xác nhận mật khẩu không khớp.")]
        public string ConfirmMatKhau { get; set; }
    }
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
    public class UniqueSDTAttribute : ValidationAttribute
    {
        private readonly Project_63133174Entities _context;

        public UniqueSDTAttribute()
        {
            _context = new Project_63133174Entities(); // Thay YourDbContext bằng tên thực tế của DbContext của bạn
        }

        public override bool IsValid(object value)
        {
            var sdt = value as string;

            if (string.IsNullOrEmpty(sdt))
            {
                // Nếu số điện thoại rỗng thì không cần kiểm tra
                return true;
            }

            // Kiểm tra xem số điện thoại đã tồn tại trong CSDL hay chưa
            return !_context.KHACHHANGs.Any(kh => kh.SDT == sdt);
        }
    }
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
    public class UniqueEmailAttribute : ValidationAttribute
    {
        private readonly Project_63133174Entities _context;

        public UniqueEmailAttribute()
        {
            _context = new Project_63133174Entities(); // Thay YourDbContext bằng tên thực tế của DbContext của bạn
        }

        public override bool IsValid(object value)
        {
            var email = value as string;

            if (string.IsNullOrEmpty(email))
            {
                // Nếu email rỗng thì không cần kiểm tra
                return true;
            }

            // Kiểm tra xem email đã tồn tại trong CSDL hay chưa
            return !_context.KHACHHANGs.Any(kh => kh.Email == email);
        }
    }
}