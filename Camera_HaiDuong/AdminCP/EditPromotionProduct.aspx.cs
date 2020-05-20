using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.Data.Linq.SqlClient;

namespace Camera_HaiDuong.AdminCP
{
    public partial class EditPromotionProduct : System.Web.UI.Page
    {
        PromotionProductsBLL pprodBLL = new PromotionProductsBLL();
        ProductsBLL prodBLL = new ProductsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    var obj = pprodBLL.GetPromotionByID(int.Parse(Request.QueryString["id"]));
                    hdID.Value = obj.ID.ToString();
                    hdProductID.Value = obj.ProductID.ToString();
                    txtProductName.Text = prodBLL.GetProductBySerial((int)obj.ProductID).ProductName;
                    txtDiscount.Text = obj.Discount.ToString();
                    txtStartDate.Text = obj.BeginDate.Value.ToString("yyyy-MM-dd");
                    txtEndDate.Text = obj.EndDate.Value.ToString("yyyy-MM-dd");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (SqlMethods.DateDiffDay(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text)) < 0)
            {
                string message = "Ngày kết thúc phải lớn hơn ngày bắt đầu!";
                string url = Request.RawUrl;
                string script = "$(document).ready(function (e) {";
                script += "    bootbox.alert('" + message + "', function () {";
                script += "        window.location = '" + url + "';";
                script += "    });";
                script += "});";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
            }
            else
            {
                pprodBLL.Update(new PromotionProduct
                {
                    ID = int.Parse(hdID.Value),
                    ProductID = int.Parse(hdProductID.Value),
                    Discount = double.Parse(txtDiscount.Text),
                    BeginDate = Convert.ToDateTime(txtStartDate.Text),
                    EndDate = Convert.ToDateTime(txtEndDate.Text)
                });
                string message = "Cập nhật khuyến mại thành công!";
                string url = "/AdminCP/ListPromotionProducts.aspx";
                string script = "$(document).ready(function (e) {";
                script += "    bootbox.alert('" + message + "', function () {";
                script += "        window.location = '" + url + "';";
                script += "    });";
                script += "});";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
            }
        }
    }
}