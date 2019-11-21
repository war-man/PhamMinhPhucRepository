using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Google;
using Owin;


namespace ShopCaPhe
{
    public partial class Startup
    {
        public void ConfigureAuth(IAppBuilder app)
        {
            app.SetDefaultSignInAsAuthenticationType(CookieAuthenticationDefaults.AuthenticationType);
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                LoginPath = new PathString("/Account/LoginSSO"),
                SlidingExpiration = true
            });
            app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions()
            {
                ClientId = "706074507952-a3l8at37mdhau3uaprdo4j9hu60g47tt.apps.googleusercontent.com",
                ClientSecret = "mY4GdKSAIZiSEbZVQ02DmFnI",
                CallbackPath = new PathString("/GoogleLoginCallback")
            });


        }
    }
}

