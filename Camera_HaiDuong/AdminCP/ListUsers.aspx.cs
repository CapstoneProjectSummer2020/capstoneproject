using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class ListUsers : System.Web.UI.Page
    {
        protected RolesBLL rBLL = new RolesBLL();
        UsersBLL userBLL = new UsersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                grvUsers.DataSource = userBLL.GetAllUsers();
                grvUsers.DataBind();
            }
        }

        protected void grvUsers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            userBLL.ChangeStatus(int.Parse(grvUsers.DataKeys[e.NewSelectedIndex].Value.ToString()));
            grvUsers.DataSource = userBLL.GetAllUsers();
            grvUsers.DataBind();
        }

        protected void grvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvUsers.PageIndex = e.NewPageIndex;
            grvUsers.DataSource = userBLL.GetAllUsers();
            grvUsers.DataBind();
        }
    }
}