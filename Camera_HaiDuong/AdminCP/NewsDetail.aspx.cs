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
    public partial class NewsDetail : System.Web.UI.Page
    {
        NewslettersBLL newsBLL = new NewslettersBLL();
        NewslettersCateBLL ncateBLL = new NewslettersCateBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategories.DataSource = ncateBLL.GetAvailableNewsCate();
                ddlCategories.DataTextField = "CateName";
                ddlCategories.DataValueField = "CateID";
                ddlCategories.DataBind();

                if (Request.QueryString["nid"] != null)
                {
                    btnAdd.Visible = false;
                    btnUpdate.Visible = true;
                    imgNews.Visible = true;
                    int nid = int.Parse(Request.QueryString["nid"].ToString());
                    var obj = newsBLL.GetNewsDetail(nid);
                    txtTitle.Text = obj.Title;
                    txtSubtitle.Text = obj.Subtitle;
                    ckeContent.Text = obj.Content;
                    imgNews.ImageUrl = obj.ImagePath;
                    ddlCategories.SelectedValue = obj.CateID.ToString();
                    ddlStatus.SelectedValue = obj.Status == true ? "1" : "0";
                }
                else
                {
                    btnAdd.Visible = true;
                    btnUpdate.Visible = false;
                    imgNews.Visible = false;
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string imgPath = "";
            if (uploadImage.HasFile)
            {
                imgPath = "/upload/images/news/" + uploadImage.FileName;
                uploadImage.SaveAs(Server.MapPath(imgPath));
            }
            newsBLL.Insert(new Newsletter
            {
                CateID = int.Parse(ddlCategories.SelectedValue),
                Title = txtTitle.Text,
                Subtitle = txtSubtitle.Text,
                Content = ckeContent.Text,
                ImagePath = imgPath,
                Status = ddlStatus.SelectedValue == "1" ? true : false,
                CreatedDate = DateTime.Now,
                Viewed = 0
            });
            string message = "Thêm bài viết thành công";
            string url = "/AdminCP/ListNews.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["nid"] != null)
            {
                int nid = int.Parse(Request.QueryString["nid"].ToString());
                var obj = newsBLL.GetNewsDetail(nid);
                string imgPath = obj.ImagePath;
                if (uploadImage.HasFile)
                {
                    imgPath = "/upload/images/news/" + uploadImage.FileName;
                    uploadImage.SaveAs(Server.MapPath(imgPath));
                }
                newsBLL.Update(new Newsletter
                {
                    NewsID = nid,
                    CateID = int.Parse(ddlCategories.SelectedValue),
                    Title = txtTitle.Text,
                    Subtitle = txtSubtitle.Text,
                    Content = ckeContent.Text,
                    ImagePath = imgPath,
                    Status = ddlStatus.SelectedValue == "1" ? true : false
                });

                string message = "Cập nhật bài viết thành công";
                string url = "/AdminCP/ListNews.aspx";
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