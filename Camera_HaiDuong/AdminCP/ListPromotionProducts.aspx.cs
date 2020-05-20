using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class ListPromotionProducts : System.Web.UI.Page
    {
        protected ProductsBLL prodBLL = new ProductsBLL();
        private PromotionProductsBLL pprodBLL = new PromotionProductsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvPromotionProducts.DataSource = pprodBLL.GetAllPromotionProducts();
                grvPromotionProducts.DataBind();
            }
        }

        protected void grvPromotionProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvPromotionProducts.PageIndex = e.NewPageIndex;
            grvPromotionProducts.DataSource = pprodBLL.GetAllPromotionProducts();
            grvPromotionProducts.DataBind();
        }

        protected void grvPromotionProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            pprodBLL.Delete(int.Parse(grvPromotionProducts.DataKeys[e.RowIndex].Value.ToString()));
            string message = "Xóa bỏ khuyến mại thành công!";
            string url = Request.RawUrl;
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void grvPromotionProducts_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("/AdminCP/EditPromotionProduct.aspx?id=" + grvPromotionProducts.DataKeys[e.NewSelectedIndex].Value.ToString());
        }
    }
}