using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class Pages : System.Web.UI.Page
    {
        protected OthersBLL othBLL = new OthersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvPages.DataSource = othBLL.GetAllPage();
                grvPages.DataBind();
            }
        }

        protected void grvPages_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("/AdminCP/EditPage.aspx?pid=" + grvPages.DataKeys[e.NewSelectedIndex].Value.ToString());
        }

        protected void grvPages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvPages.PageIndex = e.NewPageIndex;
            grvPages.DataSource = othBLL.GetAllPage();
            grvPages.DataBind();
        }

        protected void grvPages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            othBLL.DeletePage(int.Parse(grvPages.DataKeys[e.RowIndex].Value.ToString()));
            grvPages.DataSource = othBLL.GetAllPage();
            grvPages.DataBind();
        }
    }
}