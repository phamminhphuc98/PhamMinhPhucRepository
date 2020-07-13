using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;
using System.ComponentModel;
using System.Linq.Dynamic;
using System.Linq.Expressions;
using System.Reflection;
using PagedList;
using System.Data.Entity;
using System.Threading;
using System.Globalization;
using Microsoft.Ajax.Utilities;
using System.Net.Mail;

namespace ShopCaPhe.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        CàPheEntities db = new CàPheEntities();
        public ActionResult TrangChu()
        {



            return View();
        }
        public ActionResult Index()
        {

            var sp = db.SANPHAMs.ToList();
            var sumlike = sp.Select(n => n.YeuThich).Sum();
            ViewBag.sum = sumlike;
            Session["soluongma"] = null;
            Session["MaGiam"] = null;
            Session["suc"] = null;
            Session["null"] = null;

            return View(db.SANPHAMs.Take(20).Where(x => x.MaLoai==1 || x.MaLoai== 2 || x.MaLoai == 3 || x.MaLoai == 6).ToList());
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult dangky()
        {

            return View();
        }
        public ActionResult Loctheogia(int? a)
        {
            var sppp = db.SANPHAMs.ToList();
            var sumlike = sppp.Select(n => n.YeuThich).Sum();
            ViewBag.sum = sumlike;
            if (1 == a)
            {
                ViewBag.locsp = "Sản phẩm dưới 2 trăm nghìn";
                List<SANPHAM> sp = db.SANPHAMs.Where(n => n.DonGia <=200000).OrderBy(n => n.DonGia).ToList();
                return View(sp);

            }
            else if (2 == a)
            {
                ViewBag.locsp = "Sản phẩm từ 2 trăm nghìn - 5 trăm nghìn";

                List<SANPHAM> sp = db.SANPHAMs.Where(n => n.DonGia >= 200000 && n.DonGia <= 500000).OrderBy(n => n.DonGia).ToList();
                return View(sp);
            }
            else if(3 == a)
            {
                ViewBag.locsp = "Sản phẩm từ 5 trăm nghìn - 1 triệu";
                List<SANPHAM> sp = db.SANPHAMs.Where(n => n.DonGia >= 500000 && n.DonGia <= 1000000).OrderBy(n => n.DonGia).ToList();
                return View(sp);
            }
            else if (4 == a)
            {
                ViewBag.locsp = "Sản phẩm trên 1 triệu";
                List<SANPHAM> sp = db.SANPHAMs.Where(n => n.DonGia >=1000000).OrderBy(n=>n.DonGia).ToList();
                return View(sp);

            }
            else if (5 == a)
            {
                ViewBag.locsp = "Sản phẩm mới";
                List<SANPHAM> sp = db.SANPHAMs.Where(n => n.YeuThich == 0 ).OrderBy(n => n.DonGia).ToList();
                return View(sp);

            }
            else if (6 == a)
            {
                var sp1 = db.SANPHAMs.ToList();
                var sumlike1 = sp1.Select(n => n.YeuThich).Sum();
                int x = int.Parse(sumlike1.ToString());
                x = x * 10 / 100;
                ViewBag.locsp = "Sản phẩm bán chạy";
                List<SANPHAM> sp = db.SANPHAMs.Where(n => n.YeuThich >= x).OrderBy(n => n.DonGia).ToList();
                return View(sp);
            }
            else
            {
                var sp1 = db.SANPHAMs.ToList();
                var sumlike1 = sp1.Select(n => n.YeuThich).Sum();
                int x = int.Parse(sumlike1.ToString());
                x = x * 8 / 100;
                ViewBag.locsp = "Sản phẩm HOT";
                List<SANPHAM> sp = db.SANPHAMs.Where(n => n.YeuThich == x).OrderBy(n => n.DonGia).ToList();
                return View(sp);
            }
        }
        public string GetMD5(string MD5)
        {
            string str = "";
            byte[] A = System.Text.Encoding.UTF8.GetBytes(MD5);
            System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            A = md5.ComputeHash(A);
            foreach (Byte b in A)
            {
                str += b.ToString("X2");
            }
            return str;
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection frmTao, KHACHHANG kh)
        {
            using (db)
            {

                var user = db.KHACHHANGs.Where(x => x.TenDN == kh.TenDN).FirstOrDefault();
                var email = db.KHACHHANGs.Where(x => x.Email == kh.Email).FirstOrDefault();



                if (user != null || email != null)
                {
                    ViewBag.loidangky = "Tên đăng nhập hoặc Email đã tồn tại xin vui lòng thay đổi tên đăng nhập hoặc Email";
                    return View("dangky", kh);
                }
                else
                {
                    kh.HoTenKH = frmTao["HoTenKH"];
                    kh.Email = frmTao["Email"];
                    kh.DienThoaiKH = frmTao["DienThoaiKH"];
                    kh.DiaChiKH = frmTao["DiaChiKH"];
                    kh.TenDN = frmTao["TenDN"];
                    kh.MatKhau = GetMD5(frmTao["MatKhau"]);
                    db.KHACHHANGs.Add(kh);
                    db.SaveChanges();
                    ViewBag.dangkythanhcong = "zz";
                    return RedirectToAction("LoginSSO", "Account");

                }
            }

        }


        [HttpPost]
        public ActionResult Login(KHACHHANG model)
        {
            using (db)
            {

                //Lấy username và password ở bản ghi đầu tiên
                var user = db.KHACHHANGs.Where(x => x.TenDN == model.TenDN && x.MatKhau == model.MatKhau).FirstOrDefault();
                if (user == null)
                {

                    ViewBag.error = "Email or Password is fail";
                    return View("Login", model);
                }
                else
                {
                    //ViewBag.avatar = user.Avatar;
                    //ViewBag.Online = user.IsActive;
                    //Session["Online"] = user.IsActive;
                    //Session["Avatar"] = user.Avatar;
                    Session["MaKH"] = user.MaKH;
                    Session["Email"] = user.TenDN;
                    Session["Password"] = user.MatKhau;
                    //return View(user)

                    return RedirectToAction("Index", "Home");
                }

            }
        }
        public ActionResult DangXuat()
        {
            Session["Email"] = null;
            Session["Email"] = null;
            Session["Password"] = null;
            Session["GioHang"] = null;
            return Redirect("/");

        }
        public ActionResult timkiem(string name)
        { 
            List<SANPHAM> sp = db.SANPHAMs.Where(n => n.TenSP.Contains(name)).ToList();
            Session["nametimkiem"] = name;
            return View(sp);
        }

        public PartialViewResult MayxayPartial ()
        {

            return PartialView(db.SANPHAMs.Where(n => n.MaLoai == 4).ToList());

        }

        public PartialViewResult MayphaPartial ()
        {

            return PartialView(db.SANPHAMs.Where(n => n.MaLoai == 5).ToList());

        }
        [HttpGet]
        public ActionResult Popup(int? iMaSP)
        {
            SANPHAM sp = (from p in db.SANPHAMs where p.MaSP == iMaSP select p).ToArray()[0];
            return Json(new { name = sp.TenSP, price = sp.DonGia, hinhminhhoa = sp.HinhMinhHoa, donvitinh = sp.Donvitinh, mota = sp.MoTa, trangthai = sp.TrangThai, soluong=sp.SoLuong, masp=sp.MaSP }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult GioiThieu()
        {
            return View();
        }
        public ActionResult SendMail()
        {
            return View();
        }

        public ActionResult EditUser(int? id)
        {
            KHACHHANG kh = db.KHACHHANGs.Find(id);
            return View(kh);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditUser([Bind(Include = "MaKH,HoTenKH,DiaChiKH,DienThoaiKH,TenDN,MatKhau,NgaySinh,GioiTinh,Email,LoaiDN")] KHACHHANG kh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index","Home");
            }
            return View(kh);
        }
        public ActionResult EditMatKhau()
        {
            return View();
        }
        public ActionResult Doimatkhau(int? id)
        {
            KHACHHANG kh = db.KHACHHANGs.Find(id);
            Session["Madoimatkhau"] = kh.MaKH;
            return View(kh);
        }
        [HttpPost]
        public ActionResult Doimatkhau(FormCollection frm)
        {
            using (db)
            {   

                int x = int.Parse(Session["Madoimatkhau"].ToString());
                KHACHHANG kh = db.KHACHHANGs.Find(x);
                var user = db.KHACHHANGs.FirstOrDefault(n => n.MaKH == x);
                string a = user.MatKhau;
                string b = frm["MatKhauCu"];
                string c = frm["MatKhauMoi"];
                string d = frm["NhapLaiMatKhau"];   
                if(GetMD5(b) != a)
                {
                    ViewBag.mess1 = "Mật khẩu không  chính xác!";
                    return View();
                }
                else if( d != c )
                {
                    ViewBag.mess2 = "Nhập lại mật khẩu không chính xác!";
                    return View();
                }
                else
                {
                    kh.MatKhau = GetMD5(c);
                    db.Entry(kh).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("LoginSSO", "Account");
                }
            }
                
        }
        public ActionResult Quenmatkhau()
        {
            return View();
        }
        [HttpPost]
        public ActionResult quenmatkhau(FormCollection frm, ShopCaPhe.Models.MailModel model)
        {
            Random rand = new Random();
            rand.Next(0, 1000);
            int num = rand.Next();
            string a = frm["To"];
            var user = db.KHACHHANGs.Where(x => x.Email == a).FirstOrDefault();
            if (user != null)
            {
                int ma = user.MaKH;
                KHACHHANG kh = db.KHACHHANGs.Find(ma);
                ViewBag.num = num;
                if (ModelState.IsValid)
                {
                    string to = model.To;
                    string subject ="ShopCaPhe cập nhập mật khẩu";
                    string body = "Mật khẩu của bạn đã được thay đổi thành: "+num+"";
                    MailMessage mail = new MailMessage();
                    mail.To.Add(to);
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.From = new MailAddress("shopcaphephuchau@gmail.com");
                    mail.IsBodyHtml = false;

                    SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = true;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential("shopcaphephuchau@gmail.com", "01882221110");
                    smtp.Send(mail);

                    kh.MatKhau = GetMD5(num.ToString());
                    db.Entry(kh).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("LoginSSO", "Account");
                }
                else
                {
                    return View();
                }
            }
            else
            {
                ViewBag.loi = "Email không tồn tại, vui lòng nhập lại!";
                return View();
            }

        }
        public ActionResult Donhangkhachhang(int? id)
        {
            List<DONDATHANG> dh = db.DONDATHANGs.Where(n => n.MaKH == id).ToList();
            return View(dh);
        }
        public ActionResult Chitietdonhang(int? id)
        {
            List<CTDONHANG> donhang = db.CTDONHANGs.Where(n => n.SoDH == id).ToList();
            ViewData["listdh"] = donhang;
            DONDATHANG dh = db.DONDATHANGs.Find(id);
            return View(dh);
        }
        public ActionResult TinTuc()
        {
            var tintuc = (from t in db.TINTUCs select t).OrderByDescending(c => c.MaTin).FirstOrDefault();
            return View(tintuc);

        }
    }
}

