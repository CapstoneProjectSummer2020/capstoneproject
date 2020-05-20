<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ListNews.aspx.cs" Inherits="Camera_HaiDuong.ListNews" EnableEventValidation="false" %>

<asp:Content ID="ctListNews" ContentPlaceHolderID="phMain" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
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
    <div class="row hp-newslist">
        <!--LEFT - MAIN-->
        <div class="hp-news-colleft">
            <div class="row">
                <div class="fns-lnewsbox">
                    <h3 class="page-header">
                        <asp:Label ID="lbTitle" Text="Tin khuyến mại" runat="server" /></h3>
                    <asp:UpdatePanel ID="udpListNews" runat="server">
                        <ContentTemplate>
                            <asp:Repeater ID="rptListNews" runat="server">
                                <ItemTemplate>
                                    <div class="fns-lnewsitem">
                                        <a href='/bai-viet/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("Title").ToString()) %>-<%# Eval("NewsID") %>'>
                                            <img class="fns-lnewsimg" src='<%# Eval("ImagePath") %>' alt='<%# Eval("Title") %>'>
                                        </a>
                                        &nbsp;&nbsp;&nbsp;<a href='/bai-viet/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("Title").ToString()) %>-<%# Eval("NewsID") %>'><h3 class="fns-lnewstitle"><%# Eval("Title") %></h3>
                                        </a>
                                        <div class="fns-lnewstime">Ngày đăng: <%# Eval("CreatedDate") %></div>
                                        <div class="fns-lnewsinfo">
                                            <%# Eval("Subtitle") %>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:Panel ID="pg" runat="server">
                                <div class="detail-newsmo-mores clearfix">
                                    <asp:LinkButton ID="lbFirst" runat="server" OnClick="lbFirst_Click">««</asp:LinkButton>
                                    <asp:LinkButton ID="lbPrevious" runat="server" OnClick="lbPrevious_Click">«</asp:LinkButton>
                                    <asp:DataList ID="rptPaging" runat="server"
                                        OnItemCommand="rptPaging_ItemCommand"
                                        OnItemDataBound="rptPaging_ItemDataBound" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbPaging" runat="server" ClientIDMode="Static" CommandArgument='<%# Eval("PageIndex") %>' CommandName="newpage" Text='<%# Eval("PageText") %> '></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:LinkButton ID="lbNext" runat="server" OnClick="lbNext_Click">»</asp:LinkButton>
                                    <asp:LinkButton ID="lbLast" runat="server" OnClick="lbLast_Click">»»</asp:LinkButton>
                                    <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
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
