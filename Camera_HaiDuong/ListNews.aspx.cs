using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Drawing;

namespace Camera_HaiDuong
{
    public partial class ListNews : System.Web.UI.Page
    {
        NewslettersBLL newsBLL = new NewslettersBLL();
        NewslettersCateBLL ncateBLL = new NewslettersCateBLL();
        readonly PagedDataSource _pgsource = new PagedDataSource();

        int _firstIndex, _lastIndex;
        private int _pageSize = 3;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Page.RouteData.Values["cid"] != null)
                {
                    lbTitle.Text = ncateBLL.GetCateInfo(int.Parse(Page.RouteData.Values["cid"].ToString())).CateName;
                }
                else
                {
                    lbTitle.Text = "Tin khuyến mại";
                }
                rptCates.DataSource = ncateBLL.GetAllNewsCate();
                rptCates.DataBind();
                rptNew.DataSource = newsBLL.GetTopNew(5);
                rptNew.DataBind();
                rptHot.DataSource = newsBLL.GetTopHot(5);
                rptHot.DataBind();

                BindDataIntoRepeater();
            }
        }

        #region Paging
        protected void lbFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindDataIntoRepeater();
        }

        protected void lbLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            BindDataIntoRepeater();
        }

        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindDataIntoRepeater();
        }

        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataIntoRepeater();
        }

        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newpage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            BindDataIntoRepeater();
        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
        }

        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        private void BindDataIntoRepeater()
        {
            if (Page.RouteData.Values["cid"] != null)
            {
                int cid = int.Parse(Page.RouteData.Values["cid"].ToString());
                _pgsource.DataSource = newsBLL.GetNewsByCateID(cid);
                if (newsBLL.GetNewsByCateID(cid).Count == 0)
                    pg.Visible = false;
                else pg.Visible = true;
            }
            else
            {
                _pgsource.DataSource = newsBLL.GetNewsByCateID(3);
            }
            _pgsource.AllowPaging = true;
            // Number of items to be displayed in the Repeater
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            // Keep the Total pages in View State
            ViewState["TotalPages"] = _pgsource.PageCount;
            // Example: "Page 1 of 10"
            lblpage.Text = "Trang " + (CurrentPage + 1) + " / " + _pgsource.PageCount;
            // Enable First, Last, Previous, Next buttons
            lbPrevious.Enabled = !_pgsource.IsFirstPage;
            lbNext.Enabled = !_pgsource.IsLastPage;
            lbFirst.Enabled = !_pgsource.IsFirstPage;
            lbLast.Enabled = !_pgsource.IsLastPage;

            // Bind data into repeater
            rptListNews.DataSource = _pgsource;
            rptListNews.DataBind();

            // Call the function to do paging
            HandlePaging();
        }

        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex"); //Start from 0
            dt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            // Check last page is greater than total page then reduced it to total no. of page is last index
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            // Now creating page number based on above first and last page index
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }
        #endregion
    }
}