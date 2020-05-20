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
    public partial class ProductCateDetail : System.Web.UI.Page
    {
        ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<ProductCategory> source = new List<ProductCategory>();
                foreach (var item in pcateBLL.GetAvailableCate())
                {
                    if (!pcateBLL.isChildsCate(item.CateID))
                    {
                        source.Add(item);
                    }
                }
                ddlCateParents.DataSource = source;
                ddlCateParents.DataTextField = "CateName";
                ddlCateParents.DataValueField = "CateID";
                ddlCateParents.DataBind();
                ddlCateParents.Items.Insert(0, new ListItem { Value = "0", Text = "-- Cấp cha ---" });
                if (Request.QueryString["id"] == null)
                {
                    btnCreate.Visible = true;
                    btnUpdate.Visible = false;
                }
                else
                {
                    btnCreate.Visible = false;
                    btnUpdate.Visible = true;
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    var obj = pcateBLL.GetCateInfoByCateID(id);
                    hdCateID.Value = id.ToString();
                    ddlCateParents.SelectedValue = obj.CateParentsID.ToString();
                    txtCateName.Text = obj.CateName;
                    ddlStatus.SelectedValue = obj.Status == true ? "1" : "0";
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            ProductCategory obj = new ProductCategory();
            if (ddlCateParents.SelectedValue != "0")
                obj.CateParentsID = int.Parse(ddlCateParents.SelectedValue);
            obj.CateName = txtCateName.Text;
            obj.Status = ddlStatus.SelectedValue == "1" ? true : false;
            pcateBLL.Insert(obj);
            string message = "Thêm thành công!";
            string url = "/AdminCP/ListCateProducts.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var obj = pcateBLL.GetCateInfoByCateID(int.Parse(hdCateID.Value));
            if (ddlCateParents.SelectedValue != "0")
                obj.CateParentsID = int.Parse(ddlCateParents.SelectedValue);
            obj.CateName = txtCateName.Text;
            obj.Status = ddlStatus.SelectedValue == "1" ? true : false;
            pcateBLL.Update(obj);
            string message = "Cập nhật thành công!";
            string url = "/AdminCP/ListCateProducts.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}