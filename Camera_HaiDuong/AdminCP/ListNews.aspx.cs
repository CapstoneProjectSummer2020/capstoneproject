using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class ListNews : System.Web.UI.Page
    {
        NewslettersBLL newsBLL = new NewslettersBLL();
        protected NewslettersCateBLL ncateBLL = new NewslettersCateBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvNews.DataSource = newsBLL.GetAllNews();
                grvNews.DataBind();
            }
        }

        protected void grvNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvNews.PageIndex = e.NewPageIndex;
            grvNews.DataSource = newsBLL.GetAllNews();
            grvNews.DataBind();
        }

        protected void grvNews_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            newsBLL.Delete(int.Parse(grvNews.DataKeys[e.RowIndex].Value.ToString()));
            string message = "Xóa bài viết thành công";
            string url = "/AdminCP/ListNews.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void grvNews_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("/AdminCP/NewsDetail.aspx?nid=" + grvNews.DataKeys[e.NewSelectedIndex].Value.ToString());
        }
    }
}