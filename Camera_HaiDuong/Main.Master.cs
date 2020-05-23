using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong
{
    public partial class Main : System.Web.UI.MasterPage
    {
        ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();
        NewslettersCateBLL ncateBLL = new NewslettersCateBLL();
        OthersBLL othBLL = new OthersBLL();
        SlidesBLL sldBLL = new SlidesBLL();
        SupportsBLL spBLL = new SupportsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //rptCateNews.DataSource = ncateBLL.GetAllNewsCate();
                //rptCateNews.DataBind();
                //rptSupplier.DataSource = pcateBLL.GetAllCateParents();
                //rptSupplier.DataBind();
                rptMenuWrapper.DataSource = pcateBLL.GetAllCateParents();
                rptMenuWrapper.DataBind();
                //rptCS.DataSource = othBLL.GetPagesByParentsID(2);
                //rptCS.DataBind();
                //rptSeviceAndSupport.DataSource = othBLL.GetPagesByParentsID(8);
                //rptSeviceAndSupport.DataBind();
                //rptSlides.DataSource = sldBLL.GetAvailableSlides();
                //rptSlides.DataBind();
                //rptOnlineSupport.DataSource = spBLL.GetOnlineSupport();
                //rptOnlineSupport.DataBind();
                //rptOnlineSupportTech.DataSource = spBLL.GetOnlineSupportTech();
                //rptOnlineSupportTech.DataBind();
            }
        }

        protected void rptSupplier_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptCateParents = (Repeater)e.Item.FindControl("rptCateParents");
            HiddenField hdSupplierID = (HiddenField)e.Item.FindControl("hdSupplierID");
            rptCateParents.DataSource = pcateBLL.GetCateChildByParentsID(int.Parse(hdSupplierID.Value));
            rptCateParents.DataBind();
        }

        protected void rptCateParents_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptCateChilds = (Repeater)e.Item.FindControl("rptCateChilds");
            HiddenField hdCateParentsID = (HiddenField)e.Item.FindControl("hdCateParentsID");
            rptCateChilds.DataSource = pcateBLL.GetCateChildByParentsID(int.Parse(hdCateParentsID.Value));
            rptCateChilds.DataBind();
        }
    }
}