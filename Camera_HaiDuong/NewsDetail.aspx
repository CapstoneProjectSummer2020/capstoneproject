<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="Camera_HaiDuong.NewsDetail" %>

<asp:Content ID="ctNewsDetail" ContentPlaceHolderID="phMain" runat="server">
    <div class="row">
        <div class="fns-menunews">
            <span class="fns-mnnewsicon"><i class="glyphicon glyphicon-menu-hamburger"></i>DANH MỤC TIN</span>
            <ul class="clearfix">
                <asp:Repeater ID="rptCates" runat="server">
                    <ItemTemplate>
                        <li><a href='/danh-sach-bai-viet/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("CateName").ToString()) %>-<%# Eval("CateID") %>'><%# Eval("CateName") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="row fnews-detail">
        <!--LEFT - MAIN-->
        <div class="hp-news-colleft">
            <h1 class="fnews-detail-title">
                <asp:Label ID="lbTitle" Text="Trên tay HTC One ME: Sự kết hợp hoàn hảo, tinh tế" runat="server" />
            </h1>

            <p class="fnews-detail-time">Ngày đăng: <asp:Label ID="lbCreatedDate" Text="31-06-2016" runat="server" /> - <span class="text-danger"> <asp:Label ID="lbView" Text="100" runat="server" /> lượt xem</span></p>

            <div class="fnews-detail-content">
                <asp:Literal ID="litNewsContent" runat="server" />
            </div>
            <!--DETAIL CONTENT-->
        </div>
        <!--RIGHT SITEBAR-->
        <div class="hp-news-colright">
            <div class="row">
                <div class="hp-rnl-row clearfix">
                    <div class="hp-rnl-col">
                        <div class="hp-rnl-ctmore">
                            <a class="fns-rnewstitle">
                                <h4>Tin tức mới nhất</h4>
                            </a>
                            <ul>
                                <asp:Repeater ID="rptNew" runat="server">
                                    <ItemTemplate>
                                        <li class="clearfix">
                                            <a href='/bai-viet/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("Title").ToString()) %>-<%# Eval("NewsID") %>'>
                                                <div class="hp-rnl-ctmoreimg">
                                                    <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Title") %>'>
                                                </div>
                                                <div class="hp-rnl-ctmoretitle">
                                                    <%# Eval("Title") %>
                                                </div>
                                            </a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <div class="hp-rnl-ctmore">
                            <a class="fns-rnewstitle">
                                <h4>Tin tức xem nhiều nhất</h4>
                            </a>
                            <ul>
                                <asp:Repeater ID="rptHot" runat="server">
                                    <ItemTemplate>
                                        <li class="clearfix">
                                            <a href='/bai-viet/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("Title").ToString()) %>-<%# Eval("NewsID") %>'>
                                                <div class="hp-rnl-ctmoreimg">
                                                    <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Title") %>'>
                                                </div>
                                                <div class="hp-rnl-ctmoretitle">
                                                    <%# Eval("Title") %>
                                                </div>
                                            </a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
