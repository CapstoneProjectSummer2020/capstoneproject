using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace Camera_HaiDuong
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        ProductsBLL prodBLL = new ProductsBLL();
        SuppliersBLL supBLL = new SuppliersBLL();
        PromotionProductsBLL pprodBLL = new PromotionProductsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int pid = int.Parse(Page.RouteData.Values["s"].ToString());
                prodBLL.IncreaseView(pid);
                var obj = prodBLL.GetProductBySerial(pid);
                txtQuantity.Attributes.Add("max", obj.UnitInStock.ToString());
                imgProd.ImageUrl = obj.ImagePath;
                lbProdName.Text = obj.ProductName;
                lbProductID.Text = obj.ProductID;
                lbSupplier.Text = prodBLL.GetSupplierName((int)obj.CateID);
                lbView.Text = obj.Viewed.ToString();
                litDescription.Text = obj.Information;
                litIntroduction.Text = obj.Introduction;
                litParameter.Text = obj.Parameters;
                lbStatus.Text = obj.UnitInStock == 0 ? "Hết hàng" : "Còn hàng";
                lbPrice.Text = "Giá chính hãng: " + obj.UnitPrice.Value.ToString("#,###,###,###").Replace(',', '.') + " đ";
                lbFullPrice.Text = pprodBLL.GetDiscount(obj.Serial) == null ? obj.UnitPrice.Value.ToString("#,###,###,###").Replace(',', '.') + "đ" : ((1 - pprodBLL.GetDiscount(obj.Serial) / 100) * obj.UnitPrice).Value.ToString("#,###,###,###").Replace(',', '.') + "đ";
                if (pprodBLL.GetDiscount(obj.Serial) == null)
                {
                    lbPrice.Visible = false;
                    lbSub.Visible = false;
                }
                else
                {
                    lbPrice.Visible = true;
                    lbSub.Visible = true;
                    lbSub.Text = "Tiết kiệm: " + (pprodBLL.GetDiscount(obj.Serial) / 100 * obj.UnitPrice).Value.ToString("#,###,###,###").Replace(',', '.') + " đ";
                }
                if (obj.UnitInStock - obj.UnitOnOrder <= 0)
                {
                    btnAddToCart.Attributes.Add("onclick", "alert('Hiện tài sản phẩm này đã hết! Vui lòng thử lại sau!'); return false;");
                    btnAddToCart.UseSubmitBehavior = false;
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int serial = int.Parse(Page.RouteData.Values["s"].ToString());
            var p = prodBLL.GetProductBySerial(serial);
            DataTable dtCart = Session["Cart"] as DataTable;
            DataRow dtRow = dtCart.Rows.Find(serial);
            if (dtRow != null)
            {
                dtRow["Quantity"] = (int)dtRow["Quantity"] + int.Parse(txtQuantity.Text);
            }
            else
            {
                dtCart.Rows.Add(p.Serial, p.ProductName, p.ImagePath, p.UnitPrice, int.Parse(txtQuantity.Text), pprodBLL.GetDiscount(p.Serial) == null ? 0 : pprodBLL.GetDiscount(p.Serial),
                    pprodBLL.GetDiscount(p.Serial) == null ? p.UnitPrice : p.UnitPrice * (1 - pprodBLL.GetDiscount(p.Serial) / 100) * int.Parse(txtQuantity.Text));
            }
            Session["Cart"] = dtCart;
            Response.Redirect("/gio-hang");
        }
    }
}