using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Camera_HaiDuong
{
    public partial class Pages : System.Web.UI.Page
    {
        OthersBLL othBLL = new OthersBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = int.Parse(Page.RouteData.Values["pid"].ToString());
                var page = othBLL.GetPage(id);
                lbTitle.Text = page.Name;
                litPageContent.Text = page.Content;
            }
        }
    }
}