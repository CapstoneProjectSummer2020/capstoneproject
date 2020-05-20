using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong
{
    public partial class Promotions : System.Web.UI.Page
    {
        protected PromotionProductsBLL pprodBLL = new PromotionProductsBLL();
        NewslettersBLL newsBLL = new NewslettersBLL();
        ProductsBLL prodBLL = new ProductsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptBestPromotion.DataSource = prodBLL.GetAllPromotionProducts();
                rptBestPromotion.DataBind();

                rptNews.DataSource = newsBLL.GetTopNewsByCateID(3, 4);
                rptNews.DataBind();
            }
        }
    }
}