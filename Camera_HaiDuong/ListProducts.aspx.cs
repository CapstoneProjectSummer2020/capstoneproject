using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace Camera_HaiDuong
{
    public partial class ListProducts : System.Web.UI.Page
    {
        ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();
        protected PromotionProductsBLL pprodBLL = new PromotionProductsBLL();
        ProductsBLL prodBLL = new ProductsBLL();
        int supID;
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 12;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Page.RouteData.Values["cid"] != null)
                {
                    int cid = int.Parse(Page.RouteData.Values["cid"].ToString());
                    int[] brands = pcateBLL.GetFullParents(cid);
                    supID = brands[2];
                    for (int i = 0; i < 3; i++)
                    {
                        if (brands[i] == 0)
                        {
                            supID = brands[i - 1];
                            break;
                        }
                    }

                    lbListTitle.Text = pcateBLL.GetCateInfoByCateID(cid).CateName;
                    lbTitle.Text = pcateBLL.GetCateInfoByCateID(supID).CateName;
                    rptFilter.DataSource = pcateBLL.GetCateChildByParentsID(supID);
                    rptFilter.DataBind();

                    BindDataIntoRepeater();
                }
            }
        }

        protected void rptFilter_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HiddenField hdParentsID = (HiddenField)e.Item.FindControl("hdParentsID");
            Repeater rptChilds = (Repeater)e.Item.FindControl("rptChilds");

            rptChilds.DataSource = pcateBLL.GetCateChildByParentsID(int.Parse(hdParentsID.Value));
            rptChilds.DataBind();
        }

        #region Paging

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
            int cid = int.Parse(Page.RouteData.Values["cid"].ToString());
            if (pcateBLL.isGrandParentsCate(cid))
            {
                var obj = prodBLL.GetProductsByGrandParentsCateID(cid);
                if (obj.Count == 0) pnPage.Visible = false;
                else pnPage.Visible = true;
                _pgsource.DataSource = obj;
            }
            else
            {
                var obj = prodBLL.GetProductsByCateID(cid);
                if (obj.Count == 0) pnPage.Visible = false;
                else pnPage.Visible = true;
                _pgsource.DataSource = obj;
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
            rptProducts.DataSource = _pgsource;
            rptProducts.DataBind();


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

        protected void lbFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindDataIntoRepeater();
        }

        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
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

        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataIntoRepeater();
        }

        protected void lbLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            BindDataIntoRepeater();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");

        }
    }
}