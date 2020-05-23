<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Camera_HaiDuong.Default" %>

<asp:Content ID="ctDefault" ContentPlaceHolderID="phMain" runat="server">
    <div class="main">
        <div class="wrap">
            <div class="section group">
                <div class="cont span_2_of_3">
                    <h2 class="head">Featured Products</h2>
                    <div class="top-box">
                        <asp:Repeater ID="rptBestSeller" runat="server">
                            <ItemTemplate>
                                <div class="col_1_of_3 span_1_of_3">
                                    <div class="inner_content clearfix">
                                        <div class="product_image">
                                            <img src='<%# Eval("ImagePath")%>' alt='<%# Eval("ProductName")%>' />
                                        </div>
                                        <div class="sale-box">
                                        </div>
                                        <div class="price">
                                            <div class="cart-left">
                                                <p class="title"><a href='/chi-tiet-san-pham/<%# Camera_HaiDuong.Tools.convertToUnSign(Eval("ProductName").ToString()) %>-<%# Eval("Serial") %>'><%# Eval("ProductName")%> <%# Eval("ProductID")%></a></p>
                                                <div class="price1">
                                                    <span class="actual"><%#(pprodBLL.GetDiscount((int)Eval("Serial")) != null) ? "<strong>" + ((100 - pprodBLL.GetDiscount((int)Eval("Serial")))/100 * float.Parse(Eval("UnitPrice").ToString())).Value.ToString("#,###,###,###").Replace(',','.') + 
                                            " đ </strong>" + Convert.ToDouble(Eval("UnitPrice")).ToString("#,###,###,###").Replace(',','.') + " đ" : "<strong>" + Convert.ToDouble(Eval("UnitPrice")).ToString("#,###,###,###").Replace(',','.') + " đ</strong>" %></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>                    
                <div class="clear"></div>
                </div>
                 <div class="clear"></div>
            </div>
        </div>
    </div>
</asp:Content>

