using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong
{
    public partial class Default : System.Web.UI.Page
    {
        ProductsBLL prodBLL = new ProductsBLL();
        ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();
        protected PromotionProductsBLL pprodBLL = new PromotionProductsBLL();
        BannersBLL bannBLL = new BannersBLL();
        protected SuppliersBLL supBLL = new SuppliersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptBestSeller.DataSource = prodBLL.GetTopHotProduct(4);
                rptBestSeller.DataBind();

                //rptProductRegions.DataSource = pcateBLL.GetAllCateParents();
                //rptProductRegions.DataBind();
            }
        }

        protected void rptProductRegions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HiddenField hdProductRegionsID = (HiddenField)e.Item.FindControl("hdProductRegionsID");
            Repeater rptNav = (Repeater)e.Item.FindControl("rptNav");
            rptNav.DataSource = pcateBLL.GetCateChildByParentsID(int.Parse(hdProductRegionsID.Value));
            rptNav.DataBind();

            Repeater rptTabs = (Repeater)e.Item.FindControl("rptTabs");
            rptTabs.DataSource = pcateBLL.GetCateChildByParentsID(int.Parse(hdProductRegionsID.Value));
            rptTabs.DataBind();
        }

        protected void rptTabs_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lbMessage = (Label)e.Item.FindControl("lbMessage");
            HiddenField hdTabsID = (HiddenField)e.Item.FindControl("hdTabsID");
            Repeater rptList = (Repeater)e.Item.FindControl("rptList");
            var obj = prodBLL.GetProductsByParentsCateID(int.Parse(hdTabsID.Value));
            if (obj.Count > 0)
            {
                lbMessage.Visible = false;
                rptList.DataSource = obj;
                rptList.DataBind();
            }
            else
                lbMessage.Visible = true;
        }

        //protected void RandomTopBanner()
        //{
        //    string html = "";
        //    html += "<div class=\"row margin-bottom-10\">";
        //    html += "    <a href='" + bannBLL.RandomTopBanner().Url + "'><img src='" + bannBLL.RandomTopBanner().BannerPath + "' alt='" + bannBLL.RandomTopBanner().BannerAlt + "' /></a>";
        //    html += "</div>";
        //    Response.Write(html);
        //}

        //protected void RandomInsideBanner()
        //{
        //    if (bannBLL.GetInsideBanner().Count > 0)
        //    {
        //        string html = "";
        //        html += "<a href='" + bannBLL.RandomInsideBanner().Url + "' target=\"_blank\">";
        //        html += "    <img src='" + bannBLL.RandomInsideBanner().BannerPath + "'>";
        //        html += "</a>";
        //        html += "<a href='" + bannBLL.RandomInsideBanner().Url + "'>";
        //        html += "    <img src='" + bannBLL.RandomInsideBanner().BannerPath + "'>";
        //        html += "</a>";
        //        Response.Write(html);
        //    }
        //}
    }
}