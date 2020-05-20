using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class ListCateProducts : System.Web.UI.Page
    {
        protected ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvCateProducts.DataSource = pcateBLL.GetAllCate();
                grvCateProducts.DataBind();
            }
        }

        protected void grvCateProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvCateProducts.PageIndex = e.NewPageIndex;
            grvCateProducts.DataSource = pcateBLL.GetAllCate();
            grvCateProducts.DataBind();
        }

        protected void grvCateProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            pcateBLL.Delete(int.Parse(grvCateProducts.DataKeys[e.RowIndex].Value.ToString()));
            string message = "Xóa thành công!";
            string url = "/AdminCP/ListCateProducts.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void grvCateProducts_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("/AdminCP/ProductCateDetail.aspx?id=" + grvCateProducts.DataKeys[e.NewSelectedIndex].Value.ToString());
        }

        protected void grvCateProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HiddenField hdDelete = (HiddenField)e.Row.FindControl("hdDelete");
                LinkButton lbtDelete = (LinkButton)e.Row.FindControl("lbtDelete");
                if (!pcateBLL.isChildsCate(int.Parse(hdDelete.Value)))
                {
                    lbtDelete.Attributes.Add("onclick", "return confirmDelete2(this);");
                }
            }
        }
    }
}