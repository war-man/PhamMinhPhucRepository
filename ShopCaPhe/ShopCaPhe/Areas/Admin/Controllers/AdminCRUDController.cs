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

namespace ShopCaPhe.Areas.Admin.Controllers
{
    public class AdminCRUDController : Controller
    {
        // GET: Admin/Admin
        CàPheEntities db = new CàPheEntities();
        // GET: Admin/AdminCRUD
        public class HttpParamActionAttribute : ActionNameSelectorAttribute
        {
            public override bool IsValidName(ControllerContext controllerContext, string actionName, MethodInfo methodInfo)
            {
                if (actionName.Equals(methodInfo.Name, StringComparison.InvariantCultureIgnoreCase))
                    return true;

                var request = controllerContext.RequestContext.HttpContext.Request;
                return request[methodInfo.Name] != null;
            }
        }
        public ActionResult IndexAdmin()
        {
            if (Session["MaAdmin"] == null)
            {
                RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            return View();
        }
        [HttpGet]
        public ActionResult IndexAdmin(int? size, int? page, string sortProperty, string sortOrder, string searchString)
        {
            if (Session["MaAdmin"] == null)
            {
               return RedirectToAction("LoginAdmin", "LoginAdmin");
            }

            ViewBag.searchValue = searchString;
            ViewBag.sortProperty = sortProperty;
            ViewBag.page = page;

            List<SelectListItem> items = new List<SelectListItem>();
            items.Add(new SelectListItem { Text = "5", Value = "5" });
            items.Add(new SelectListItem { Text = "10", Value = "10" });
            items.Add(new SelectListItem { Text = "20", Value = "20" });
            items.Add(new SelectListItem { Text = "25", Value = "25" });

            foreach (var item in items)
            {
                if (item.Value == size.ToString()) item.Selected = true;
            }
            ViewBag.size = items;
            ViewBag.currentSize = size;

            var links = from l in db.SANPHAMs select l;
            // 5. T?o thu?c tính s?p x?p m?c d?nh là "LinkID"
            if (String.IsNullOrEmpty(sortProperty)) sortProperty = "BookId";

            // 5. S?p x?p tang/gi?m b?ng phuong th?c OrderBy s? d?ng trong thu vi?n Dynamic LINQ
            if (sortOrder == "desc") links = links.OrderBy(sortProperty + " desc");
            else if (sortOrder == "asc") links = links.OrderBy(sortProperty);
            else links = links.OrderBy("TenSP");

            if (!String.IsNullOrEmpty(searchString))
            {
                links = links.Where(s => s.TenSP.Contains(searchString));
            }

            page = page ?? 1;


            int pageSize = (size ?? 5);

            ViewBag.pageSize = pageSize;

            // 6. Toán t? ?? trong C# mô t? n?u page khác null thì l?y giá tr? page, còn
            // n?u page = null thì l?y giá tr? 1 cho bi?n pageNumber. --- dammio.com
            int pageNumber = (page ?? 1);

            // 6.2 L?y t?ng s? record chia cho kích thu?c d? bi?t bao nhiêu trang
            int checkTotal = (int)(links.ToList().Count / pageSize) + 1;
            // N?u trang vu?t qua t?ng s? trang thì thi?t l?p là 1 ho?c t?ng s? trang
            if (pageNumber > checkTotal) pageNumber = checkTotal;

            return View(links.ToPagedList(pageNumber, pageSize));

        }
        [HttpPost, HttpParamAction]
        public ActionResult Reset()
        {
            ViewBag.searchValue = "";
            //IndexAdmin(null, null, "", "", "");
            return View();

        }
        public ActionResult Edit(int? id)
        {
            //Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            //Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);

            ViewBag.imgurl = db.SANPHAMs.SingleOrDefault(n => n.MaSP == id).HinhMinhHoa;
            // List<Category> lis = db.Categories.ToList();

            SANPHAM sp = db.SANPHAMs.Find(id);
            return View(sp);

        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,TenSP,MaLoai,Donvitinh,DonGia,MoTa,HinhMinhHoa,NgayTao,NgayChinhSua,TrangThai,SoLuong")] SANPHAM sp)
        {   
            if (ModelState.IsValid)
            {
                sp.NgayChinhSua = DateTime.Now;
                db.Entry(sp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }
            return View(sp);
        }
        public ActionResult Delete(int? id )
        {

           SANPHAM sp = db.SANPHAMs.Find(id);
           Session["itemid"] = id;
            return View(sp);
        }
      

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            
            SANPHAM sp = db.SANPHAMs.Find(id);
            db.SANPHAMs.Remove(sp);
            db.SaveChanges();
            return RedirectToAction("IndexAdmin");
        }

        public ActionResult DeleteLoai(int? id)
        {

            LOAISP lsp = db.LOAISPs.Find(id);
            return View(lsp);
        }
        [HttpPost, ActionName("DeleteLoai")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteLoaiSP(int id)
        {

            LOAISP sp = db.LOAISPs.Find(id);
            db.LOAISPs.Remove(sp);
            db.SaveChanges();
            return RedirectToAction("createLoaiSP");
        }

        public ActionResult CreateSP(/*string language*/)
        {
            //Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            //Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);

            List<LOAISP> loai = db.LOAISPs.ToList();
            SelectList ListLoai = new SelectList(loai, "MaLoai", "TenLoai");
            ViewBag.Loai = ListLoai;
            return View();
        }
        public string ProcessUpload(HttpPostedFileBase file)
        {
            //xử lí upload

            // upload chorme
            file.SaveAs(Server.MapPath("~/Images/" + file.FileName));
            return "/Images/" + file.FileName;

            //upload file ie
            //return  file.FileName;


        }
        public string UploadEdit(HttpPostedFileBase file)
        {
            //xử lí upload
            file.SaveAs(Server.MapPath("~/Images" + file.FileName));
            return file.FileName;
        }
        [HttpPost]
        public ActionResult Tao(FormCollection frmTao, SANPHAM sp)
        {

            sp.TenSP = frmTao["name"];
            sp.MoTa = frmTao["mota"];
            sp.MaLoai = Convert.ToInt32(frmTao["Loai"]);
            //Book.AuthorId = Convert.ToInt32(frmTao["author"]);
            //Book.PubId = Convert.ToInt32(frmTao["pub"]);
            sp.DonGia = Convert.ToInt32(frmTao["gia"]);
            sp.SoLuong = Convert.ToInt32(frmTao["SL"]);
            sp.TrangThai = frmTao["trangthai"];
            sp.NgayTao = DateTime.Now;
            sp.HinhMinhHoa = frmTao["fileUpload"];
            sp.Donvitinh = frmTao["dvtinh"];
            db.SANPHAMs.Add(sp);
            db.SaveChanges();
            return RedirectToAction("IndexAdmin", "AdminCRUD");
        }

        //    public ActionResult ChitietBookAdmin(int? BookId)
        //    {
        //        //  Book s = db.Books.Single(n => n.BookId == id);
        //        SANPHAM b = (from p in db.SANPHAMs where p.MaSP == BookId select p).ToArray()[0];

        //        return View(b);
        //    }

        //    
        //  

        public ActionResult createLoaiSP()
        {

            List<LOAISP> sp = db.LOAISPs.ToList();

            var f = from s in db.LOAISPs select s;
            ViewBag.sklist = db.LOAISPs.ToList();
            return View(sp);

        }
        [HttpPost]
        public ActionResult createLoaiSP(FormCollection frmCreate, LOAISP lsp)
        {

            lsp.TenLoai = frmCreate["TenLoaiSP"];
            db.LOAISPs.Add(lsp);
            db.SaveChanges();
            return RedirectToAction("createLoaiSP", "AdminCRUD");
        }
        //    public ActionResult createPub()
        //    {
        //        var f = from s in db.Publishers select s;
        //        ViewBag.sklist = db.Publishers.ToList();
        //        return View();

        //    }
        //    [HttpPost]
        //    public ActionResult createPub(FormCollection frmCreate, Publisher p)
        //    {

        //        p.Name = frmCreate["Name"];
        //        p.Description = frmCreate["Description"];

        //        db.Publishers.Add(p);
        //        db.SaveChanges();
        //        return RedirectToAction("createPub", "AdminCRUD");
        //    }
        //    public ActionResult createCate()
        //    {
        //        var f = from s in db.Categories select s;
        //        ViewBag.sklist = db.Categories.ToList();
        //        return View();

        //    }
        //    [HttpPost]
        //    public ActionResult createCate(FormCollection frmCreate, Category c)
        //    {

        //        c.CateName = frmCreate["CateName"];
        //        c.Description = frmCreate["Description"];

        //        db.Categories.Add(c);
        //        db.SaveChanges();
        //        return RedirectToAction("createCate", "AdminCRUD");
        //    }
        //}
    }
}