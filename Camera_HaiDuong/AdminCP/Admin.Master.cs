using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        UsersBLL uBLL = new UsersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                    Response.Redirect("/AdminCP/Login.aspx");
                int role = (int)uBLL.GetUserByUsername(Session["admin"].ToString()).RoleID;
                if (role == 1) pnAdmin.Visible = true;
                else pnAdmin.Visible = false;
            }
        }

        protected void lbtLogout_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Response.Redirect("/AdminCP/Login.aspx");
        }
    }
}