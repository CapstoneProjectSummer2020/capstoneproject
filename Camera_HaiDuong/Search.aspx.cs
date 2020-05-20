using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong
{
    public partial class Search : System.Web.UI.Page
    {
        protected PromotionProductsBLL pprodBLL = new PromotionProductsBLL();
        ProductsBLL proBLL = new ProductsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Page.RouteData.Values["kw"] != null)
                {
                    string kw = Page.RouteData.Values["kw"].ToString();
                    lbMessage.Text = "Tìm thấy " + (proBLL.Search(Tools.HandleInput(kw), true).Count).ToString() + " kết quả";
                    rptProducts.DataSource = proBLL.Search(Tools.HandleInput(kw), true);
                    rptProducts.DataBind();
                }
            }
        }
    }
}