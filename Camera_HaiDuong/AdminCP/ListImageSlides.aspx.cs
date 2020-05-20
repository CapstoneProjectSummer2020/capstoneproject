using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class ListImageSlides : System.Web.UI.Page
    {
        SlidesBLL sldBLL = new SlidesBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvSlides.DataSource = sldBLL.GetAllSlides();
                grvSlides.DataBind();
            }
        }

        protected void grvSlides_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvSlides.PageIndex = e.NewPageIndex;
            grvSlides.DataSource = sldBLL.GetAllSlides();
            grvSlides.DataBind();
        }

        protected void grvSlides_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("/AdminCP/SlideDetail.aspx?sid=" + grvSlides.DataKeys[e.NewSelectedIndex].Value.ToString());
        }

        protected void grvSlides_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            sldBLL.DeleteSlide(int.Parse(grvSlides.DataKeys[e.RowIndex].Value.ToString()));
            grvSlides.DataSource = sldBLL.GetAllSlides();
            grvSlides.DataBind();
        }

        protected void grvSlides_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int index = gvr.RowIndex;
                sldBLL.UpdateStatus(int.Parse(grvSlides.DataKeys[index].Value.ToString()));
                grvSlides.DataSource = sldBLL.GetAllSlides();
                grvSlides.DataBind();
            }
        }
    }
}