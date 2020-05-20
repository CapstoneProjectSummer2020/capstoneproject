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
    public partial class ListAddresses : System.Web.UI.Page
    {
        protected AddressesBLL addBLL = new AddressesBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvAddresses.DataSource = addBLL.GetAllAddresses();
                grvAddresses.DataBind();
            }
        }

        protected void grvAddresses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvAddresses.PageIndex = e.NewPageIndex;
            grvAddresses.DataSource = addBLL.GetAllAddresses();
            grvAddresses.DataBind();
        }

        protected void grvAddresses_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int id = int.Parse(grvAddresses.DataKeys[e.NewSelectedIndex].Value.ToString());
            addBLL.UpdateStatus(id);
            grvAddresses.DataSource = addBLL.GetAllAddresses();
            grvAddresses.DataBind();
        }
    }
}