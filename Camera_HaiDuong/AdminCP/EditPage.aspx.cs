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
    public partial class EditPage : System.Web.UI.Page
    {
        OthersBLL othBLL = new OthersBLL();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlParents.DataSource = othBLL.GetCateParents();
                ddlParents.DataValueField = "ID";
                ddlParents.DataTextField = "Name";
                ddlParents.DataBind();

                if(Request.QueryString["pid"]!=null)
                {
                    int pid = int.Parse(Request.QueryString["pid"].ToString());
                    var page = othBLL.GetPage(pid);
                    ddlParents.SelectedValue = page.ParentsID.ToString();
                    txtTitle.Text = page.Name;
                    ckeContent.Text = page.Content;
                    btnAdd.Visible = false;
                    btnUpdate.Visible = true;
                }
                else
                {
                    btnAdd.Visible = true;
                    btnUpdate.Visible = false;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            othBLL.Update(new Other
            {
                ID = int.Parse(Request.QueryString["pid"].ToString()),
                ParentsID = int.Parse(ddlParents.SelectedValue),
                Name = txtTitle.Text,
                Content = ckeContent.Text
            });
            string message = "Cập nhật trang thành công!";
            string url = "/AdminCP/Pages.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            othBLL.Insert(new Other
            {
                ParentsID = int.Parse(ddlParents.SelectedValue),
                Name = txtTitle.Text,
                Content = ckeContent.Text
            });
            string message = "Thêm trang mới thành công!";
            string url = "/AdminCP/Pages.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}