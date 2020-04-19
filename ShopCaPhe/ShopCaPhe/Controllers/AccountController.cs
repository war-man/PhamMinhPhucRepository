using ShopCaPhe.Models;
using Microsoft.Owin.Security.Cookies;
using System.Security.Claims;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using Microsoft.Owin;

namespace ShopCaPhe.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        CàPheEntities db = new CàPheEntities();

    
        public ActionResult LoginSSO()
        {
            return View();
        }
        public void SignIn(string ReturnUrl = "/", string type = "") 
        {
            if (!Request.IsAuthenticated)
            {
                if (type == "Google")
                {
                    HttpContext.GetOwinContext().Authentication.Challenge(new AuthenticationProperties { RedirectUri = "Account/GoogleLoginCallback" }, "Google");
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
                    return View("LoginSSO", model);
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
        public ActionResult SignOut()
        {
            HttpContext.GetOwinContext().Authentication.SignOut(CookieAuthenticationDefaults.AuthenticationType);
            Session["username"] = null;
            Session["makh"] = null;
            Session["GioHang"] = null;
            return RedirectToAction("Index", "Home");
        }

        [AllowAnonymous]
        public ActionResult GoogleLoginCallback()
        {
            var claimsPrincipal = HttpContext.User.Identity as ClaimsIdentity;

            var loginInfo = SSO.GetLoginInfo(claimsPrincipal);
            if (loginInfo == null)
            {
                return RedirectToAction("LoginSSO");
            }
            CàPheEntities db = new CàPheEntities(); //DbContext
            var user = db.KHACHHANGs.FirstOrDefault(x => x.Email == loginInfo.emailaddress);

            if (user == null)
            {
                user = new KHACHHANG
                {

                    Email = loginInfo.emailaddress,
                    HoTenKH = loginInfo.name,
                    DiaChiKH = loginInfo.nameidentifier,

                };
                db.KHACHHANGs.Add(  user);
                db.SaveChanges();
            }
            Session["username"] = loginInfo.name;
            Session["makh"] = user.MaKH;

            var ident = new ClaimsIdentity(
                    new[] { 
									// adding following 2 claim just for supporting default antiforgery provider
									new Claim(ClaimTypes.NameIdentifier, user.Email),
                                    new Claim("http://schemas.microsoft.com/accesscontrolservice/2010/07/claims/identityprovider", "ASP.NET Identity", "http://www.w3.org/2001/XMLSchema#string"),
                                    new Claim(ClaimTypes.Name, user.HoTenKH),
                                    new Claim(ClaimTypes.Email, user.Email),
									// optionally you could add roles if any
									new Claim(ClaimTypes.Role, "User")
                    },
                    CookieAuthenticationDefaults.AuthenticationType);


            HttpContext.GetOwinContext().Authentication.SignIn(
                        new AuthenticationProperties { IsPersistent = false }, ident);
            return RedirectToAction("Index","Home");
        }
    }
}