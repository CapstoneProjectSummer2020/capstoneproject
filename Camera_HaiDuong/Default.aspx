<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Camera_HaiDuong.Default" %>

<asp:Content ID="ctDefault" ContentPlaceHolderID="phMain" runat="server">
    <div class="row">
        <div class="best-seller">
            <div class="best-seller-title clearfix">
                <h4 class="left">Danh sách khách hàng quen thuộc</h4>
                <%--<a href="/danh-sach-san-pham/best-seller" target="_blank" class="best-seller-more right">Xem thêm <i class="fa fa-angle-right"></i></a>--%>
            </div>
            <div class="col-lg-12">
                <div class="row p-list">
                    <asp:Repeater ID="rptBestSeller" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-3">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="p-image">
                                            <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'>
                                                <img src='<%# Eval("ImagePath")%>' alt='<%# Eval("ProductName")%>' />
                                            </a>
                                            <div class="p-badge">
                                                <img src="/img/hot.png" alt="Hot Icon">
                                            </div>
                                            <%# (pprodBLL.GetDiscount((int)Eval("Serial")) != null) ? "<div class='p-sale'><span>- "+pprodBLL.GetDiscount((int)Eval("Serial")) + " %</span></div>" : null %>
                                        </div>
                                        <div class="p-info">
                                            <span class="sup_name"><%# supBLL.GetSupplierBySupplerID(int.Parse(Eval("SupplierID").ToString())).SupplierName %></span>
                                            <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'><%# Eval("ProductName")%> <%# Eval("ProductID")%></a>
                                            <%# (pprodBLL.GetDiscount((int)Eval("Serial")) != null) ? "<strong>" + ((100 - pprodBLL.GetDiscount((int)Eval("Serial")))/100 * float.Parse(Eval("UnitPrice").ToString())).Value.ToString("#,###,###,###").Replace(',','.') + 
                                            " đ </strong><em>" + Convert.ToDouble(Eval("UnitPrice")).ToString("#,###,###,###").Replace(',','.') + " đ</em>" : "<strong>" + Convert.ToDouble(Eval("UnitPrice")).ToString("#,###,###,###").Replace(',','.') + " đ</strong><em></em>" %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>

    <asp:Repeater ID="rptProductRegions" runat="server" OnItemDataBound="rptProductRegions_ItemDataBound">
        <ItemTemplate>
            <asp:HiddenField ID="hdProductRegionsID" Value='<%# Eval("CateID") %>' runat="server" />

            <%--  <% RandomTopBanner(); %>--%>

           <%-- <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href='/danh-sach-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("CateName").ToString()) %>-<%# Eval("CateID") %>'><%# Eval("CateName") %></a>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!-- Nav tabs -->
                        <ul class="nav nav-pills">
                            <asp:Repeater ID="rptNav" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="#<%# Eval("CateID") %>" data-toggle="tab" aria-expanded="true"><%# Eval("CateName") %></a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <asp:Repeater ID="rptTabs" runat="server" OnItemDataBound="rptTabs_ItemDataBound">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdTabsID" Value='<%# Eval("CateID") %>' runat="server" />
                                    <div class="tab-pane fade in" id='<%# Eval("CateID") %>'>
                                        <div class="row p-list">
                                            <asp:Repeater ID="rptList" runat="server">
                                                <ItemTemplate>
                                                    <div class="col-lg-3">
                                                        <div class="panel panel-default">
                                                            <div class="panel-body">
                                                                <div class="p-image">
                                                                    <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'>
                                                                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("ProductName") %>' /></a>
                                                                    <%# (pprodBLL.GetDiscount((int)Eval("Serial")) != null) ? "<div class='p-sale'><span>- "+pprodBLL.GetDiscount((int)Eval("Serial")) + " %</span></div>" : null %>
                                                                </div>
                                                                <div class="p-info">
                                                                    <span class="sup_name"><%# supBLL.GetSupplierBySupplerID(int.Parse(Eval("SupplierID").ToString())).SupplierName %></span>
                                                                    <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'><%# Eval("ProductName")%> <%# Eval("ProductID")%></a>
                                                                    <%# (pprodBLL.GetDiscount((int)Eval("Serial")) != null) ? "<strong>" + ((100 - pprodBLL.GetDiscount((int)Eval("Serial")))/100 * float.Parse(Eval("UnitPrice").ToString())).Value.ToString("#,###,###,###").Replace(',','.') + 
                                                                    " đ </strong><em>" + Convert.ToDouble(Eval("UnitPrice")).ToString("#,###,###,###").Replace(',','.') + " đ</em>" : "<strong>" + Convert.ToDouble(Eval("UnitPrice")).ToString("#,###,###,###").Replace(',','.') + " đ</strong><em></em>" %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:Label ID="lbMessage" CssClass="lbMessage text-danger" Text="Danh sách sản phẩm đang được cập nhật" runat="server" ClientIDMode="Static" />
                                        </div>

                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>--%>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
