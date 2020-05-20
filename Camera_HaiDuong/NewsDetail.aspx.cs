using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong
{
    public partial class NewsDetail : System.Web.UI.Page
    {
        NewslettersBLL newsBLL = new NewslettersBLL();
        NewslettersCateBLL ncateBLL = new NewslettersCateBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptCates.DataSource = ncateBLL.GetAllNewsCate();
                rptCates.DataBind();
                rptNew.DataSource = newsBLL.GetTopNew(5);
                rptNew.DataBind();
                rptHot.DataSource = newsBLL.GetTopHot(5);
                rptHot.DataBind();

                int nid = int.Parse(Page.RouteData.Values["nid"].ToString());
                var obj = newsBLL.GetNewsDetail(nid);
                newsBLL.IncreaseView(nid);
                lbTitle.Text = obj.Title;
                lbCreatedDate.Text = obj.CreatedDate.ToString();
                lbView.Text = obj.Viewed.ToString();
                litNewsContent.Text = obj.Content;
            }
        }
    }
}