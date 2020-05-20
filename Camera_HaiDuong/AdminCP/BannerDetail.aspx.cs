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
    public partial class BannerDetail : System.Web.UI.Page
    {
        BannersBLL bBLL = new BannersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    var obj = bBLL.GetBannerByID(int.Parse(Request.QueryString["id"].ToString()));
                    ddlStatus.SelectedValue = obj.Status == true ? "1" : "0";
                    ddlType.SelectedValue = obj.Type.ToString();
                    txtUrl.Text = obj.Url;
                    imgPreview.ImageUrl = obj.BannerPath;
                    imgPreview.Visible = true;
                    btnCreate.Visible = false;
                    btnUpdate.Visible = true;
                }
                else
                {
                    imgPreview.Visible = false;
                    btnCreate.Visible = true;
                    btnUpdate.Visible = false;
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string path = "";
            Banner bn = new Banner();
            bn.Type = int.Parse(ddlType.SelectedValue);
            bn.Status = ddlStatus.SelectedValue == "1" ? true : false;
            bn.Url = txtUrl.Text;
            if (uploadImage.HasFile)
            {
                path = "/upload/images/banner/" + uploadImage.FileName;
                uploadImage.SaveAs(Server.MapPath(path));
                bn.BannerPath = path;
            }
            bBLL.Insert(bn);
            string message = "Thêm banner thành công!";
            string url = "/AdminCP/ListBanners.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string path = bBLL.GetBannerByID(int.Parse(Request.QueryString["id"].ToString())).BannerPath;
            Banner bn = new Banner
            {
                ID = int.Parse(Request.QueryString["id"].ToString()),
                Type = int.Parse(ddlType.SelectedValue),
                Status = ddlStatus.SelectedValue == "1" ? true : false,
                Url = txtUrl.Text
            };

            if (uploadImage.HasFile)
            {
                path = "/upload/images/banner/" + uploadImage.FileName;
                uploadImage.SaveAs(Server.MapPath(path));
            }
            bn.BannerPath = path;
            bBLL.Update(bn);

            string message = "Cập nhật banner thành công!";
            string url = "/AdminCP/ListBanners.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}