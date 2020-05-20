<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Promotions.aspx.cs" Inherits="Camera_HaiDuong.Promotions" %>

<asp:Content ID="ctPromotion" ContentPlaceHolderID="phMain" runat="server">
    <div class="row">
        <div class="best-seller">
            <div class="best-seller-title clearfix">
                <h4 class="left">Sản phẩm khuyến mại hot</h4>
            </div>
            <div class="col-lg-12">
                <div class="row p-list">
                    <asp:Repeater ID="rptBestPromotion" runat="server">
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
                                            <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'><%# Eval("ProductID")%> - <%# Eval("ProductName")%></a>
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
    <div class="row">
        <div class="best-seller">
            <div class="best-seller-title clearfix">
                <h4 class="left">Tin khuyến mại</h4>
            </div>
            <div class="col-lg-12">
                <div class="row p-list">
                    <asp:Repeater ID="rptNews" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="kms-kmnews-itemtop clearfix">
                                            <a href='/NewsDetail.aspx?nid=<%# Eval("NewsID")%>'>
                                                <img src='<%# Eval("ImagePath")%>' alt='<%# Eval("Title")%>' />
                                            </a>
                                            <div class="kms-kmnews-iteminfobig">
                                                <p class="kms-kmnews-iname"><a href='/NewsDetail.aspx?nid=<%# Eval("NewsID")%>' title='<%# Eval("Title")%>'><%# Eval("Title")%></a></p>
                                                <p class="kms-kmnews-itime">Ngày đăng:&nbsp;<%# Eval("CreatedDate")%></p>
                                                <p class="kms-kmnews-itext">
                                                    <%# Eval("Subtitle")%>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="col-lg-12 text-center">
                <div class="form-group">
                    <a href="/danh-sach-bai-viet/Tin-khuyen-mai-3" class="btn btn-primary">Xem tất cả</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
