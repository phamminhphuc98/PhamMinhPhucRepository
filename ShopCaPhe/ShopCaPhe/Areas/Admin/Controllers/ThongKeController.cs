using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using ShopCaPhe.Models;
using PagedList;
using Rotativa;
using System.Data;
using ClosedXML.Excel;
using System.IO;

namespace ShopCaPhe.Areas.Admin.Controllers
{
    public class ThongKeController : Controller
    {

        CàPheEntities db = new CàPheEntities();
        public ActionResult ThongKe(int? iyear, int? imonth, string language)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;

            //int month = int.Parse(frmTao["thang"]);
            //int year = int.Parse(frmTao["nam"]);


            List<DONDATHANG> ddh = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == imonth && n.NgayDH.Value.Year == iyear && n.TrangThai == "Đã giao").ToList();
            var x = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == imonth && n.NgayDH.Value.Year == iyear && n.TrangThai=="Đã giao").Sum(n => n.TriGia);
            Session["TongDG"] = x;
            Session["month"] = imonth;
            Session["year"] = iyear;
            Session["data"] = ddh;

            return View(ddh);
        }
        //[HttpPost]
        //public ActionResult ThongKe(FormCollection frmTao)
        //{
        //    int month =int.Parse(frmTao["thang"]);
        //    int year =int.Parse(frmTao["nam"]);
        //    ViewBag.month = month;
        //    ViewBag.year = year;
        //    List<DONDATHANG> ddh = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year).ToList();
        //    var x = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year).Sum(n => n.TriGia);
        //    Session["TongDG"] = x;
        //    return RedirectToAction("ThongKe","ThongKe");
        //}
        public PartialViewResult DSThongKePartial(int IdMonth = 10, int IdYear = 2019)
        {
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;

            // SELECT* FROM KHACHHANG WHERE MONTH(NGAYSINH) = 2 AND YEAR(NGAYSINH)= 2000
            var DSThongKeThang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == IdMonth && n.NgayDH.Value.Year == IdYear).ToList();

            ViewBag.DS = DSThongKeThang;
            return PartialView(ViewBag.DS);

        }
        public ActionResult HoaDon(int? year, int? month, int? day, string language)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
            List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday;
            List<DONDATHANG> donhang1 = db.DONDATHANGs.OrderByDescending(n=>n.SoDH).ToList();
            List<DONDATHANG> donhang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year && n.NgayDH.Value.Day == day).OrderByDescending(n=>n.SoDH).ToList();

            Session["data"] = donhang;
            Session["year"] = year;
            Session["month"] = month;

            return View(donhang1);
        }
        [HttpGet]
        public ActionResult HoaDon(int? size, string language, int? page, string sortProperty, string sortOrder, int? searchString)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);

            if (Session["MaAdmin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
           List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday; // 1. Tham số int? dùng để thể hiện null và kiểu int
            // page có thể có giá trị là null và kiểu int.

            // 2. Nếu page = null thì đặt lại là 1.
            if (page == null) page = 1;

            // 3. Tạo truy vấn, lưu ý phải sắp xếp theo trường nào đó, ví dụ OrderBy
            // theo LinkID mới có thể phân trang.
            //var links = (from l in db.DONDATHANGs
            //             select l).OrderByDescending(x => x.SoDH);

            // 4. Tạo kích thước trang (pageSize) hay là số Link hiển thị trên 1 trang
            int pageSize = 10;
            //var links = from l in db.DONDATHANGs select l;
            var links = from l in db.DONDATHANGs select l;


            // 5. Tạo thuộc tính sắp xếp mặc định là "LinkID"
            if (String.IsNullOrEmpty(sortProperty)) sortProperty = "SoDH";

            // 5. S?p x?p tang/gi?m b?ng phuong th?c OrderBy s? d?ng trong thu vi?n Dynamic LINQ
            if (sortOrder == "desc") links = links.OrderBy(sortProperty + " desc");
            else if (sortOrder == "asc") links = links.OrderBy(sortProperty);
            else links = links.OrderByDescending(n=>n.SoDH);


            if (searchString != null)
            {
                links = links.Where(s => s.SoDH==searchString);
            }
            // 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
            // nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            int pageNumber = (page ?? 1);

            // 5. Trả về các Link được phân trang theo kích thước và số trang.
            return View(links.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Hoadonngay(int? day, int? year, int? month, string language)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);


            List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday;
            Session["year"] = year;
            Session["month"] = month;
            Session["day"] = day;
            List<DONDATHANG> donhang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Day == day && n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year).ToList();
            return View(donhang);
        }


        public ActionResult Hoadonthang(int? year, int? month, string language)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);


            List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday;
            Session["year"] = year;
            Session["month"] = month;
            List<DONDATHANG> donhang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Month == month && n.NgayDH.Value.Year == year).ToList();
            return View(donhang);
        }

        public ActionResult Hoadonnam(int? year, string language)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);


            List<int> ItemDay = new List<int>();
            for (int i = 1; i < 31; i++)
            {
                ItemDay.Add(i);
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemday = new SelectList(ItemDay);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            ViewBag.ItemDay = itemday;
            Session["year"] = year;
            List<DONDATHANG> donhang = db.DONDATHANGs.Where(n => n.NgayDH.Value.Year == year).ToList();
            return View(donhang);
        }
        public ActionResult EditHoaDon(int? sohd, string language)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
            //CTDONHANG dh = db.CTDONHANGs.Find(sohd);
            List<CTDONHANG> donhang = db.CTDONHANGs.Where(n => n.SoDH == sohd).ToList();
            //ViewData["datadh"] = db.SANPHAMs.Where(n => n.MaSP == dh.MaSP );
            ViewBag.trigia = db.DONDATHANGs.SingleOrDefault(n => n.SoDH == sohd).TriGia;

            return View(donhang);
        }


        public ActionResult Edit(int? id, string language)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);


            //Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            //Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);

            // List<Category> lis = db.Categories.ToList();
            List<CTDONHANG> donhang = db.CTDONHANGs.Where(n => n.SoDH == id).ToList();
            ViewData["listdh"] = donhang;
            DONDATHANG dh = db.DONDATHANGs.Find(id);
            return View(dh);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SoDH,MaKH,NgayDH,Ngaygiaohang,TriGia,TrangThai,TenNguoiNhan,DiaChiNhan,DienThoaiNhan,MaHTTT,MaHTGH")] DONDATHANG dh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("HoaDon","ThongKe");
            }
            return View(dh);
        }

        public ActionResult xulytrangthai(int? id)
        {
            var trangthaithuc = "";
            DONDATHANG dh = db.DONDATHANGs.Find(id);
            if (dh.TrangThai == "Đã giao")
            {
                trangthaithuc = "Đang giao";
                dh.TrangThai = trangthaithuc;
                dh.Ngaygiaohang = null;
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("HoaDon");

            }
            else
            {
                trangthaithuc = "Đã giao";
                dh.TrangThai = trangthaithuc;
                dh.Ngaygiaohang = DateTime.Parse(DateTime.Now.ToString());
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("HoaDon");

            }
        }
        public ActionResult ExportPDF()
        {
            return new ActionAsPdf("ThongKe")
            {
                FileName = Server.MapPath("~/Content/ListThongKe.pdf")
            };
        }
        [HttpPost]
        public FileResult Export()
        {
            
            int tong = int.Parse(Session["TongDG"].ToString());
            string tong1 = string.Format("{0:0,0}", tong);
            string tong2 = tong1+"đ";

            CàPheEntities entities = new CàPheEntities();
            DataTable dt = new DataTable("DoanhThu");
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("Mã Đơn Hàng"),
                                        new DataColumn("Tên khách hàng"),
                                        new DataColumn("Ngày đặt hàng"),
                                        new DataColumn("Ngày giao hàng"),
                                        new DataColumn("Trị giá"),
                                        new DataColumn("Tình trạng giao hàng"),
                                           });
            int i = int.Parse(Session["month"].ToString());
            int i1 = int.Parse(Session["year"].ToString());
            var customers = from customer in entities.DONDATHANGs.Where(n => n.NgayDH.Value.Month == i && n.NgayDH.Value.Year == i1 && n.TrangThai=="Đã giao")
                            select customer;
            Session["excel"] = customers;
            foreach (var customer in customers)
            {
                if (customer.TrangThai == "Đã giao")
                {
                    dt.Rows.Add(customer.SoDH, customer.TenNguoiNhan, customer.NgayDH, customer.Ngaygiaohang, customer.TriGia, customer.TrangThai );
                }
                else
                {
                }

            }
            dt.Rows.Add("");
            dt.Rows.Add("Thống kê doanh thu tháng "+Session["month"]+" năm "+Session["year"]+"");
            dt.Rows.Add("Tổng tiền:", tong2);
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt);
                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Doanh Thu Thang "+ Session["month"]+"/" + Session["year"]+".xlsx");
                }
            }
        }
    }
}
