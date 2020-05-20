<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ListProducts.aspx.cs" Inherits="Camera_HaiDuong.ListProducts" EnableEventValidation="false" %>

<asp:Content ID="ctListProducts" ContentPlaceHolderID="phMain" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row hp-lprod-main">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="well">
                            <h3 class="text-center"><asp:Label ID="lbTitle" Text="Vantech" runat="server" /></h3>
                        </div>
                        <div class="panel-group" id="accordion">
                            <asp:Repeater ID="rptFilter" runat="server" OnItemDataBound="rptFilter_ItemDataBound">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdParentsID" Value='<%# Eval("CateID") %>' runat="server" />
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%# Eval("CateID") %>" aria-expanded="false" class="collapsed">
                                                    <%# Eval("CateName") %>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapse<%# Eval("CateID") %>" class="panel-collapse collapse">
                                            <ul class="nav" id="site-menu">
                                                <asp:Repeater ID="rptChilds" runat="server">
                                                    <ItemTemplate>
                                                        <li><a href='/danh-sach-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("CateName").ToString()) %>-<%# Eval("CateID") %>'><%# Eval("CateName") %></a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>

                    <div class="col-lg-9">
                        <div class="row p-list">
                            <h2><asp:Label ID="lbListTitle" Text="Danh sách sản phẩm" runat="server" /></h2>
                            <asp:Repeater ID="rptProducts" runat="server">
                                <ItemTemplate>
                                    <div class="col-sm-6 col-xs-12 col-md-4 col-lg-4">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <div class="p-image">
                                                    <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'>
                                                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("ProductName") %>' /></a>
                                                </div>
                                                <div class="p-info">
                                                    <a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'><%# Eval("ProductID")%> - <%# Eval("ProductName") %></a>
                                                    <%# (pprodBLL.GetDiscount((int)Eval("Serial")) != null) ? "<strong>" + ((100 - pprodBLL.GetDiscount((int)Eval("Serial")))/100 * float.Parse(Eval("UnitPrice").ToString())).Value.ToString("#,###,###,###").Replace(',','.') + 
                                            " đ </strong><em>" + Convert.ToDouble(Eval("UnitPrice")).ToString("#,###,###,###").Replace(',','.') + " đ</em>" : "<strong>" + Convert.ToDouble(Eval("UnitPrice")).ToString("#,###,###,###").Replace(',','.') + " đ</strong><em></em>" %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <asp:Panel ID="pnPage" runat="server">
                            <div class="detail-newsmo-mores clearfix">
                                <asp:LinkButton ID="lbFirst" Text="text" runat="server" OnClick="lbFirst_Click">««</asp:LinkButton>
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
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
