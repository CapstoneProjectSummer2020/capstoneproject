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
    public partial class SlideDetail : System.Web.UI.Page
    {
        SlidesBLL sldBLL = new SlidesBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["sid"] != null)
                {
                    btnCreate.Visible = false;
                    btnUpdate.Visible = true;
                    var obj = sldBLL.GetSlideInfo(int.Parse(Request.QueryString["sid"].ToString()));
                    txtLink.Text = obj.Link;
                    imgPreview.ImageUrl = obj.ImagePath;
                    imgThumbnail.ImageUrl = obj.ThumbnailPath;
                    ddlStatus.SelectedValue = obj.Status == true ? "1" : "0";
                    imgPreview.Visible = true;
                    imgThumbnail.Visible = true;
                }
                else
                {
                    imgPreview.Visible = false;
                    imgThumbnail.Visible = false;
                    btnCreate.Visible = true;
                    btnUpdate.Visible = false;
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string imgPath = "", thumbPath = "";
            if (uploadThumbail.HasFile)
            {
                thumbPath = "/upload/images/slideshow/" + uploadThumbail.FileName;
                uploadThumbail.SaveAs(Server.MapPath(thumbPath));
            }
            if (uploadImage.HasFile)
            {
                imgPath = "/upload/images/slideshow/" + uploadImage.FileName;
                uploadImage.SaveAs(Server.MapPath(imgPath));
            }
            sldBLL.Insert(new Slideshow
            {
                ImagePath = imgPath,
                ThumbnailPath = thumbPath,
                Link = txtLink.Text,
                Status = ddlStatus.SelectedValue == "1" ? true : false
            });
            string message = "Thêm slide mới thành công!";
            string url = "/AdminCP/ListImageSlides.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int sid = int.Parse(Request.QueryString["sid"].ToString());
            var slide = sldBLL.GetSlideInfo(sid);
            if (uploadThumbail.HasFile)
            {
                slide.ThumbnailPath = "/upload/images/slideshow/" + uploadThumbail.FileName;
                uploadThumbail.SaveAs(Server.MapPath(slide.ThumbnailPath));
            }
            if (uploadImage.HasFile)
            {
                slide.ImagePath = "/upload/images/slideshow/" + uploadImage.FileName;
                uploadImage.SaveAs(Server.MapPath(slide.ImagePath));
            }
            slide.Link = txtLink.Text;
            slide.Status = ddlStatus.SelectedValue == "1" ? true : false;
            sldBLL.Update(slide);
            string message = "Cập nhật slide thành công!";
            string url = "/AdminCP/ListImageSlides.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}