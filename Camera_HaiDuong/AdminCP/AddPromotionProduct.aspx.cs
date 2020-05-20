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
    public partial class AddPromotionProduct : System.Web.UI.Page
    {
        public SuppliersBLL supBLL = new SuppliersBLL();
        public ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();
        private ProductsBLL prodBLL = new ProductsBLL();
        private PromotionProductsBLL pprodBLL = new PromotionProductsBLL();
        public static List<Product> list = new List<Product>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    pnSelectProducts.Visible = true;
                    pnInfo.Visible = false;
                    list = prodBLL.GetAllProducts();
                    grvProducts.DataSource = list;
                    grvProducts.DataBind();
                }
                else
                {
                    pnSelectProducts.Visible = false;
                    pnInfo.Visible = true;
                    txtSerial.Text = Request.QueryString["id"].ToString();
                    txtProductName.Text = prodBLL.GetProductBySerial(int.Parse(Request.QueryString["id"].ToString())).ProductName;
                }
            }
        }

        protected void grvProducts_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("/AdminCP/AddPromotionProduct.aspx?id=" + grvProducts.DataKeys[e.NewSelectedIndex].Value.ToString());
        }

        protected void lbtSearchSerial_Click(object sender, EventArgs e)
        {
            list = prodBLL.Search(Tools.HandleInput(txtSearchSerial.Text), false);
            grvProducts.DataSource = list;
            grvProducts.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
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
                pprodBLL.Insert(new PromotionProduct
                    {
                        ProductID = int.Parse(txtSerial.Text),
                        Discount = double.Parse(txtDiscount.Text),
                        BeginDate = Convert.ToDateTime(txtStartDate.Text),
                        EndDate = Convert.ToDateTime(txtEndDate.Text)
                    });
                string message = "Thêm thành công!";
                string url = "/AdminCP/ListPromotionProducts.aspx";
                string script = "$(document).ready(function (e) {";
                script += "    bootbox.alert('" + message + "', function () {";
                script += "        window.location = '" + url + "';";
                script += "    });";
                script += "});";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
            }
        }

        protected void grvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvProducts.PageIndex = e.NewPageIndex;
            grvProducts.DataSource = list;
            grvProducts.DataBind();
        }
    }
}