using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class ListProducts : System.Web.UI.Page
    {
        protected SuppliersBLL supBLL = new SuppliersBLL();
        protected ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();
        ProductsBLL prodBLL = new ProductsBLL();
        public static List<Product> list = new List<Product>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                list = prodBLL.GetAllProducts();
                grvProducts.DataSource = list;
                grvProducts.DataBind();
            }
        }

        protected void grvProducts_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("/AdminCP/ProductDetail.aspx?id=" + grvProducts.DataKeys[e.NewSelectedIndex].Value.ToString());
        }

        protected void grvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvProducts.PageIndex = e.NewPageIndex;
            grvProducts.DataSource = list;
            grvProducts.DataBind();
        }

        protected void grvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                prodBLL.Delete(int.Parse(grvProducts.DataKeys[e.RowIndex].Value.ToString()));
                string message = "Xóa sản phẩm thành công!";
                string url = "/AdminCP/ListProducts.aspx";
                string script = "$(document).ready(function (e) {";
                script += "    bootbox.alert('" + message + "', function () {";
                script += "        window.location = '" + url + "';";
                script += "    });";
                script += "});";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
            }
            catch
            {
                string message = "Sản phẩm đang có trong hóa đơn! <br /. Hãy xóa hóa đơn trước khi xóa sản phẩm này!";
                string url = "/AdminCP/ListProducts.aspx";
                string script = "$(document).ready(function (e) {";
                script += "    bootbox.alert('" + message + "', function () {";
                script += "        window.location = '" + url + "';";
                script += "    });";
                script += "});";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
            }
        }

        protected void btnSearchProduct_Click(object sender, EventArgs e)
        {
            list = prodBLL.Search(Tools.HandleInput(txtKeyword.Text), false);
            grvProducts.DataSource = list;
            grvProducts.DataBind();
        }

    }
}