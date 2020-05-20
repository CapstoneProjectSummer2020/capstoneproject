using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class ListOrders : System.Web.UI.Page
    {
        OrdersBLL ordBLL = new OrdersBLL();
        UsersBLL uBLL = new UsersBLL();
        protected ProductsBLL prodBLL = new ProductsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvOrders.DataSource = ordBLL.GetAllOrders();
                grvOrders.DataBind();
            }
        }

        protected void grvOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvOrders.PageIndex = e.NewPageIndex;
            grvOrders.DataSource = ordBLL.GetAllOrders();
            grvOrders.DataBind();
        }

        protected void grvOrders_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal()", true);
            int oid = int.Parse(grvOrders.DataKeys[e.NewSelectedIndex].Value.ToString());
            var order = ordBLL.GetOrderInfo(oid);
            lbShipName.Text = order.ShipName;
            lbShipEmail.Text = order.ShipEmail;
            lbShipPhone.Text = order.ShipPhone;
            lbShipAddress.Text = order.ShipAddress;
            lbShipProv.Text = order.ShipProvince;
            lbShipDisc.Text = order.ShipDisctrict;
            lbOrderName.Text = order.OrderName;
            lbOrderEmail.Text = order.OrderEmail;
            lbOrderPhone.Text = order.OrderPhone;
            lbOrderAddress.Text = order.OrderAddress;
            lbOrderProv.Text = order.OrderProvince;
            lbOrderDisc.Text = order.OrderDistinct;
            lbStatus.Text = order.Status == 0 ? "Chưa duyệt" : (order.Status == 1 ? "Đã duyệt" : "Đã giao hàng");
            lbTotalAmount.Text = order.TotalAmount.Value.ToString("#,###,###,###").Replace(',', '.') + " VNĐ";
            lbShipDate.Text = order.ShipDate != null ? order.ShipDate.ToString() : "<em>-- chưa giao hàng --</em>";
            lbEmployee.Text = order.Status == 0 ? "<em>-- chưa duyệt --</em>" : uBLL.GetUserById((int)order.EmployeeID).FullName;
            grvOrderDetail.DataSource = ordBLL.GetOrderDetail(oid);
            grvOrderDetail.DataBind();
        }

        protected void grvOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ordBLL.Delete(int.Parse(grvOrders.DataKeys[e.RowIndex].Value.ToString()));
            grvOrders.DataSource = ordBLL.GetAllOrders();
            grvOrders.DataBind();
            Response.Redirect("/AdminCP/ListOrders.aspx");
        }

        protected void grvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                int id = int.Parse(grvOrders.DataKeys[index].Value.ToString());
                ordBLL.UpdateStatus(id, uBLL.GetUserByUsername(Session["admin"].ToString()).UserID);
                grvOrders.DataSource = ordBLL.GetAllOrders();
                grvOrders.DataBind();
            }
        }

        //protected void grvOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grvOrders, "Select$" + e.Row.RowIndex);
        //        e.Row.ToolTip = "Chọn để hiển thị chi tiết hóa đơn";
        //    }
        //}
    }
}