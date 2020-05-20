using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Camera_HaiDuong
{
    public class Global : System.Web.HttpApplication
    {
        void RegisterRoute(RouteCollection route)
        {
            route.MapPageRoute("trang-chu", "trang-chu", "~/Default.aspx");
            route.MapPageRoute("trang", "p/{name}-{pid}", "~/Pages.aspx");
            route.MapPageRoute("danh-sach-san-pham", "danh-sach-san-pham/{title}-{cid}", "~/ListProducts.aspx");
            route.MapPageRoute("chi-tiet-san-pham", "chi-tiet-san-pham/{title}-{s}", "~/ProductDetail.aspx");
            route.MapPageRoute("danh-sach-bai-viet", "danh-sach-bai-viet/{title}-{cid}", "~/ListNews.aspx");
            route.MapPageRoute("bai-viet", "bai-viet/{title}-{nid}", "~/NewsDetail.aspx");
            route.MapPageRoute("gio-hang", "gio-hang", "~/ShoppingCart.aspx");
            route.MapPageRoute("khuyen-mai", "khuyen-mai", "~/Promotions.aspx");
            route.MapPageRoute("tim-kiem", "tim-kiem/{kw}", "~/Search.aspx");
        }
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoute(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            DataTable dtCart = new DataTable();
            dtCart.Columns.Add("ID", typeof(int));
            dtCart.Columns.Add("Name", typeof(string));
            dtCart.Columns.Add("Image", typeof(string));
            dtCart.Columns.Add("Price", typeof(double));
            dtCart.Columns.Add("Quantity", typeof(int));
            dtCart.Columns.Add("Discount", typeof(double));
            dtCart.Columns["Quantity"].DefaultValue = 1;
            dtCart.Columns.Add("TotalAmount", typeof(double), "(1 - Discount / 100) * Price * Quantity");
            dtCart.PrimaryKey = new DataColumn[] { dtCart.Columns[0] };
            Session["Cart"] = dtCart;
        }
    }
}