<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Camera_HaiDuong.Search" %>

<asp:Content ID="ctSearch" ContentPlaceHolderID="phMain" runat="server">
    <div class="row">
        <div class="form-group">
            <h3><asp:Label ID="lbMessage" Text="Tìm thấy" runat="server" /></h3>
        </div>
    </div>
    <div class="row">
        <div class="best-seller">
            <div class="best-seller-title clearfix">
                <h4 class="left">Tìm kiếm sản phẩm</h4>
            </div>
            <div class="col-lg-12">
                <div class="row p-list">
                    <asp:Repeater ID="rptProducts" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-3">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="p-image">
                                            <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'>
                                                <img src='<%# Eval("ImagePath")%>' alt='<%# Eval("ProductName")%>' />
                                            </a>
                                            <%# (pprodBLL.GetDiscount((int)Eval("Serial")) != null) ? "<div class='p-sale'><span>- "+pprodBLL.GetDiscount((int)Eval("Serial")) + " %</span></div>" : null %>
                                        </div>
                                        <div class="p-info">
                                            <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'><%# Eval("ProductName") %> - <%# Eval("ProductName")%></a>
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
</asp:Content>
