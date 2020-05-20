using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class Login : System.Web.UI.Page
    {
        UsersBLL userBLL = new UsersBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var acc = userBLL.GetUserByLogin(txtUsername.Text, txtPassword.Text);
            if (acc != null)
            {
                Session["admin"] = acc.Username;
                Response.Redirect("/AdminCP/");
            }
            else
            {
                string message = "Tài khoản, mật khẩu không chính xác! Hoặc tài khoản của bạn bị khóa!";
                string url = Request.RawUrl;
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