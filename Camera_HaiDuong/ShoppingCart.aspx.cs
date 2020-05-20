using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.Data;

namespace Camera_HaiDuong
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        static DataTable dtCart = new DataTable();
        OrdersBLL ordBLL = new OrdersBLL();
        AddressesBLL addBLL = new AddressesBLL();
        ProductsBLL prodBLL = new ProductsBLL();

        public void LoadData()
        {
            dtCart = (DataTable)Session["Cart"];
            grvCart.DataSource = dtCart;
            grvCart.DataBind();
            if (dtCart.Rows.Count > 0)
            {
                grvCart.HeaderRow.TableSection = TableRowSection.TableHeader;
                lbEmpty.Visible = false;
                showOrderInfo.Visible = true;
                lbTotalAmount.Visible = true;
                lbTotalAmount.Text = "Tổng tiền: <em>" + Convert.ToDouble(dtCart.Compute("Sum(TotalAmount)", "")).ToString("#,###,###,###").Replace(',', '.') + "</em> VNĐ";
            }
            else
            {
                lbTotalAmount.Visible = false;
                lbEmpty.Visible = true;
                showOrderInfo.Visible = false;
            }
        }

        public void LoadAddresses()
        {
            List<Address> provinces = addBLL.GetAvailableProvince();
            ddlOrderProvince.DataSource = provinces;
            ddlOrderProvince.DataValueField = "ID";
            ddlOrderProvince.DataTextField = "Name";
            ddlOrderProvince.DataBind();

            ddlShipProvince.DataSource = provinces;
            ddlShipProvince.DataValueField = "ID";
            ddlShipProvince.DataTextField = "Name";
            ddlShipProvince.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                LoadAddresses();
                rfvShipAddress.Enabled = false;
                rfvShipDistrict.Enabled = false;
                rfvShipProvince.Enabled = false;
                rfvShipName.Enabled = false;
                rfvShipEmail.Enabled = false;
                rfvShipEmailFormat.Enabled = false;
                rfvShipNameFormat.Enabled = false;
                rfvShipPhoneFormat.Enabled = false;
                rfvShipPhone.Enabled = false;
            }
        }

        protected void grvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateQuantity")
            {
                int serial = Convert.ToInt32(e.CommandArgument.ToString());
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                TextBox txt = (TextBox)grvCart.Rows[index].Cells[3].FindControl("txtQuantity");
                var obj = prodBLL.GetProductBySerial(serial);
                int max = (int)(obj.UnitInStock - obj.UnitOnOrder);
                if (int.Parse(txt.Text) > max)
                {
                    Response.Write("<script>alert('Hiện tại số lượng sản phẩm chỉ còn " + max + "! Vui lòng giảm số lượng xuống! Chúng tôi sẽ sớm cập nhật thêm!');</script>");
                }
                if (int.Parse(txt.Text) <= 0)
                {
                    Response.Write("<script>alert('Bạn phải nhập ít nhất 1 sản phẩm!');</script>");
                }
                else
                {
                    DataTable dtCart = Session["Cart"] as DataTable;
                    DataRow r = dtCart.Rows.Find(serial);
                    r["Quantity"] = int.Parse(txt.Text);
                    Session["Cart"] = dtCart;
                    LoadData();
                }

            }
            if (e.CommandName == "Remove")
            {
                int serial = Convert.ToInt32(e.CommandArgument.ToString());
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                DataTable dtCart = Session["Cart"] as DataTable;
                DataRow r = dtCart.Rows.Find(serial);
                dtCart.Rows.Remove(r);
                Session["Cart"] = dtCart;
                LoadData();
            }
        }

        protected void grvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                cell[0].Attributes.Add("data-th", "Sản phẩm");
                cell[1].Attributes.Add("data-th", "Đơn giá");
                cell[2].Attributes.Add("data-th", "Số lượng");
                cell[3].Attributes.Add("data-th", "Thành tiền");
                HiddenField hdID = (HiddenField)e.Row.FindControl("hdID");
                TextBox txtQuantity = (TextBox)e.Row.FindControl("txtQuantity");
                var obj = prodBLL.GetProductBySerial(int.Parse(hdID.Value));
                txtQuantity.Attributes.Add("max", (obj.UnitInStock - obj.UnitOnOrder).ToString());
            }
        }

        protected void btnSendOrder_Click(object sender, EventArgs e)
        {
            DataTable dtCart = Session["Cart"] as DataTable;
            List<OrdersDetail> ordersDetail = new List<OrdersDetail>();
            for (int i = 0; i < dtCart.Rows.Count; i++)
            {
                ordersDetail.Add(new OrdersDetail
                {
                    ProductID = int.Parse(dtCart.Rows[i][0].ToString()),
                    UnitPrice = double.Parse(dtCart.Rows[i][3].ToString()),
                    Quantity = int.Parse(dtCart.Rows[i][4].ToString()),
                    Discount = double.Parse(dtCart.Rows[i][5].ToString()),
                    Amount = (1 - double.Parse(dtCart.Rows[i][5].ToString()) / 100) * double.Parse(dtCart.Rows[i][3].ToString()) * int.Parse(dtCart.Rows[i][4].ToString()),
                });
                //prodBLL.UpdateStockAndBought(int.Parse(dtCart.Rows[i][0].ToString()), int.Parse(dtCart.Rows[i][4].ToString()));
            }

            if (ckbShow.Checked)
            {
                ordBLL.InsertOrder(Tools.Standardized(txtOrderName.Text), txtOrderEmail.Text, txtOrderPhone.Text, Tools.Standardized(txtOrderAddress.Text), ddlOrderProvince.SelectedItem.Text, ddlOrderDistrict.SelectedItem.Text, ordersDetail);
                string result = Tools.SendMail("doan310113364@gmail.com", "phuc1995", txtOrderEmail.Text, "Thông tin đơn hàng tại Hưng Phát Co.", 587, "smtp.gmail.com",
                Tools.Standardized(txtOrderName.Text), DateTime.Now, txtOrderEmail.Text, txtOrderPhone.Text, Tools.Standardized(txtOrderAddress.Text), ddlOrderProvince.SelectedItem.Text, ddlOrderDistrict.SelectedItem.Text,
                Tools.Standardized(txtOrderName.Text), txtOrderEmail.Text, txtOrderPhone.Text, Tools.Standardized(txtOrderAddress.Text), ddlOrderProvince.SelectedItem.Text, ddlOrderDistrict.SelectedItem.Text, ordersDetail);
            }
            else
            {
                ordBLL.InsertOrder(Tools.Standardized(txtOrderName.Text), txtOrderEmail.Text, txtOrderPhone.Text, Tools.Standardized(txtOrderAddress.Text), ddlOrderProvince.SelectedItem.Text, ddlOrderDistrict.SelectedItem.Text,
                    Tools.Standardized(txtShipName.Text), txtShipEmail.Text, txtShipPhone.Text, Tools.Standardized(txtShipAddress.Text), ddlShipProvince.SelectedItem.Text, ddlShipDistrict.SelectedItem.Text, ordersDetail);
                string result = Tools.SendMail("doan310113364@gmail.com", "phuc1995", txtOrderEmail.Text, "Thông tin đơn hàng tại Hưng Phát Co.", 587, "smtp.gmail.com",
                Tools.Standardized(txtOrderName.Text), DateTime.Now, txtOrderEmail.Text, txtOrderPhone.Text, Tools.Standardized(txtOrderAddress.Text), ddlOrderProvince.SelectedItem.Text, ddlOrderDistrict.SelectedItem.Text,
                Tools.Standardized(txtShipName.Text), txtShipEmail.Text, txtShipPhone.Text, Tools.Standardized(txtShipAddress.Text), ddlShipProvince.SelectedItem.Text, ddlShipDistrict.SelectedItem.Text, ordersDetail);
            }
            dtCart.Rows.Clear();
            Session["Cart"] = dtCart;
            string message = "Đặt hàng thành công! Thông tin đơn hàng vào email của bạn! Chúng tôi sẽ liên hệ lại với bạn để xác nhận!";
            string url = "/Default.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void ddlShipProvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlShipDistrict.DataSource = addBLL.GetDistrict(int.Parse(ddlShipProvince.SelectedValue));
            ddlShipDistrict.DataValueField = "ID";
            ddlShipDistrict.DataTextField = "Name";
            ddlShipDistrict.DataBind();
        }

        protected void ddlOrderProvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlOrderDistrict.DataSource = addBLL.GetDistrict(int.Parse(ddlOrderProvince.SelectedValue));
            ddlOrderDistrict.DataValueField = "ID";
            ddlOrderDistrict.DataTextField = "Name";
            ddlOrderDistrict.DataBind();
        }
    }
}