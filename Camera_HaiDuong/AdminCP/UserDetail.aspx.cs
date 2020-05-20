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
    public partial class UserDetail : System.Web.UI.Page
    {
        UsersBLL uBLL = new UsersBLL();
        RolesBLL rBLL = new RolesBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlRoles.DataSource = rBLL.GetAvailableRoles();
                ddlRoles.DataTextField = "RoleName";
                ddlRoles.DataValueField = "RoleID";
                ddlRoles.DataBind();
                if (Request.QueryString["id"] == null)
                {
                    btnCreate.Visible = true;
                    btnUpdate.Visible = false;
                }
                else
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    var obj = uBLL.GetUserById(id);
                    hdUserID.Value = id.ToString();
                    txtFullName.Text = obj.FullName;
                    txtUsername.Text = obj.Username;
                    txtAddress.Text = obj.Address;
                    txtPhone.Text = obj.Phone;
                    ddlRoles.SelectedValue = obj.RoleID.ToString();
                    ddlStatus.SelectedValue = obj.Status == true ? "1" : "0";
                    btnCreate.Visible = false;
                    btnUpdate.Visible = true;
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            uBLL.Insert(new User
            {
                RoleID = int.Parse(ddlRoles.SelectedValue),
                FullName = txtFullName.Text,
                Username = txtUsername.Text,
                Password = uBLL.md5(txtPassword.Text),
                Address = txtAddress.Text,
                Phone = txtPhone.Text,
                CreatedDate = DateTime.Now,
                Status = ddlStatus.SelectedValue == "1" ? true : false
            });
            string message = "Thêm thành công!";
            string url = "/AdminCP/ListUsers.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            User u = new DAL.User();
            u.UserID = int.Parse(hdUserID.Value);
            u.RoleID = int.Parse(ddlRoles.SelectedValue);
            u.FullName = txtFullName.Text;
            u.Username = txtUsername.Text;
            if (txtPassword.Text != "")
                u.Password = uBLL.md5(txtPassword.Text);
            else u.Password = uBLL.GetUserById(int.Parse(hdUserID.Value)).Password;
            u.Address = txtAddress.Text;
            u.Phone = txtPhone.Text;
            u.CreatedDate = DateTime.Now;
            u.Status = ddlStatus.SelectedValue == "1" ? true : false;
            uBLL.Update(u);
            string message = "Cập nhật thành công!";
            string url = "/AdminCP/ListUsers.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}