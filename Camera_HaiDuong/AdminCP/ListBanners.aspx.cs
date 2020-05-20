using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class ListBanners : System.Web.UI.Page
    {
        protected BannersBLL bBLL = new BannersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                grvBanners.DataSource = bBLL.GetAllBanners();
                grvBanners.DataBind();
            }
        }

        protected void grvBanners_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvBanners.PageIndex = e.NewPageIndex;
            grvBanners.DataSource = bBLL.GetAllBanners();
            grvBanners.DataBind();
        }

        protected void grvBanners_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            bBLL.UpdateStatus(int.Parse(grvBanners.DataKeys[e.NewSelectedIndex].Value.ToString()));
            grvBanners.DataSource = bBLL.GetAllBanners();
            grvBanners.DataBind();
        }

        protected void grvBanners_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bBLL.Delete(int.Parse(grvBanners.DataKeys[e.RowIndex].Value.ToString()));
            Response.Redirect(Request.RawUrl);
        }
    }
}