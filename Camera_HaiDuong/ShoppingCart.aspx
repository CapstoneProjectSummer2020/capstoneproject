<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Camera_HaiDuong.ShoppingCart" EnableEventValidation="false" %>

<asp:Content ID="ctShoppingCart" ContentPlaceHolderID="phMain" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <div class="hp-lprod-top">
        <div class="row">
            <div class="col-lg-12">
                <div class="hp-breadcrumb">
                    <asp:SiteMapPath runat="server" />
                </div>
            </div>
        </div>
    </div>
    <div class="row hp-lprod-main">
        <div class="shopping">
            <asp:GridView ID="grvCart" OnRowDataBound="grvCart_RowDataBound" ClientIDMode="Static" runat="server" GridLines="None" AutoGenerateColumns="False" CssClass="table table-hover table-condensed" OnRowCommand="grvCart_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Sản phẩm">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-sm-2 hidden-xs">
                                    <asp:Image ID="imgProd" ImageUrl='<%# Eval("Image") %>' runat="server" />
                                </div>
                                <div class="col-sm-10">
                                    <h4 class="nomargin">
                                        <asp:Label ID="lbName" Text='<%# Eval("Name") %>' runat="server" />
                                    </h4>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Đơn giá" DataField="Price" DataFormatString="{0:#,###,###,###}" />
                    <asp:TemplateField HeaderText="Số lượng">
                        <ItemTemplate>
                            <asp:HiddenField ID="hdID" Value='<%# Eval("ID") %>' runat="server" />
                            <asp:TextBox ID="txtQuantity" Text='<%# Eval("Quantity") %>' min="1" TextMode="Number" CssClass="form-control text-center" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Thành tiền" DataField="TotalAmount" DataFormatString="{0:#,###,###,###}" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnUpdate" Text="<i class='fa fa-edit'></i>" OnClientClick="" CausesValidation="False" runat="server" CommandName="UpdateQuantity" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-info btn-sm" />
                            <asp:LinkButton ID="btnRemove" Text="<i class='fa fa-trash'></i>" CausesValidation="False" runat="server" CommandName="Remove" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <h1 class="text-center">
                        <asp:Label ID="lbEmpty" Text="Giỏ hàng hiện tại chưa có sản phẩm nào!" runat="server" /></h1>
                </div>
                <div class="form-group text-right">
                    <h3><asp:Label ID="lbTotalAmount" Text="<strong>Thành tiền: </strong>300.000.000 VNĐ" runat="server" /></h3>
                </div>
                <div class="form-group text-right">
                    <a href="/" class="btn btn-primary"><i class="fa fa-reply"></i>&nbsp;Tiếp tục mua hàng</a>
                    <asp:HyperLink CssClass="btn btn-success" Text="Đặt hàng" ClientIDMode="Static" ID="showOrderInfo" runat="server" />
                </div>
            </div>
        </div>
        <div class="row">
            <div id="order-info" class="col-lg-6 col-md-12">
                <h3 class="page-header">Thông tin thanh toán</h3>
                <div class="form-group">
                    <label>Họ tên (*)</label>
                    <asp:TextBox CssClass="form-control" ID="txtOrderName" runat="server" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOrderName" ErrorMessage="Bạn chưa nhập họ tên" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtOrderName" ErrorMessage="Họ tên không được chứa ký tự số" ValidationExpression="[^0-9]*$" />
                </div>
                <div class="form-group">
                    <label>Email (*)</label>
                    <asp:TextBox CssClass="form-control" ID="txtOrderEmail" TextMode="Email" runat="server" />
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtOrderEmail" ErrorMessage="Định dạng email không đúng"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOrderEmail" ErrorMessage="Bạn chưa nhập email" />
                </div>
                <div class="form-group">
                    <label>Điện thoại (*)</label>
                    <asp:TextBox CssClass="form-control" ID="txtOrderPhone" runat="server" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOrderPhone" ErrorMessage="Bạn chưa nhập số điện thoại" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtOrderPhone" ErrorMessage="Số điện thoại chỉ được chứa ký tự số" ValidationExpression="[0-9]*$" />
                </div>
                <div class="form-group">
                    <label>Địa chỉ (*)</label>
                    <asp:TextBox CssClass="form-control" ID="txtOrderAddress" runat="server" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOrderAddress" ErrorMessage="Bạn chưa nhập địa chỉ" />
                </div>
                <asp:UpdatePanel ID="udpOrderProvince" runat="server">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>Tỉnh/Thành (*)</label>
                            <asp:DropDownList ID="ddlOrderProvince" AutoPostBack="true" CssClass="form-control" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="ddlOrderProvince_SelectedIndexChanged">
                                <asp:ListItem disabled Selected Value="0" Text="-- Tỉnh/Thành ---" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="0" runat="server" ControlToValidate="ddlOrderProvince" ErrorMessage="Bạn chưa chọn Tỉnh/Thành"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="udpOrderDistrict" runat="server">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>Quận/Huyện (*)</label>
                            <asp:DropDownList ID="ddlOrderDistrict" CssClass="form-control" runat="server">
                                <asp:ListItem disabled Selected Value="0" Text="-- Quận/Huyện ---" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="0" runat="server" ControlToValidate="ddlOrderDistrict" ErrorMessage="Bạn chưa chọn Quận/Huyện"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="checkbox">
                    <asp:CheckBox ID="ckbShow" ClientIDMode="Static" Checked="true" Text="Địa chỉ thanh toán và địa chỉ giao hàng giống nhau (Tắt mục này nếu bạn không phải là người nhận hàng)" runat="server" />
                </div>
            </div>
            <div id="ship-info" class="col-lg-6 col-md-12">
                <h3 class="page-header">Thông tin giao hàng</h3>
                <div class="form-group">
                    <label>Họ tên (*)</label>
                    <asp:TextBox ID="txtShipName" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvShipName" runat="server" ControlToValidate="txtShipName" ErrorMessage="Bạn chưa nhập họ tên" />
                    <asp:RegularExpressionValidator ID="rfvShipNameFormat" runat="server" ControlToValidate="txtShipName" ErrorMessage="Họ tên không được chứa ký tự số" ValidationExpression="[^0-9]*$" />
                </div>
                <div class="form-group">
                    <label>Email (*)</label>
                    <asp:TextBox CssClass="form-control" ID="txtShipEmail" TextMode="Email" runat="server" />
                    <asp:RegularExpressionValidator ID="rfvShipEmail" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtShipEmail" ErrorMessage="Định dạng email không đúng"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvShipEmailFormat" runat="server" ControlToValidate="txtShipEmail" ErrorMessage="Bạn chưa nhập email" />
                </div>
                <div class="form-group">
                    <label>Điện thoại (*)</label>
                    <asp:TextBox CssClass="form-control" ID="txtShipPhone" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvShipPhone" runat="server" ControlToValidate="txtShipPhone" ErrorMessage="Bạn chưa nhập số điện thoại" />
                    <asp:RegularExpressionValidator ID="rfvShipPhoneFormat" runat="server" ControlToValidate="txtShipPhone" ErrorMessage="Số điện thoại chỉ được chứa ký tự số" ValidationExpression="[0-9]*$" />
                </div>
                <div class="form-group">
                    <label>Địa chỉ (*)</label>
                    <asp:TextBox CssClass="form-control" ID="txtShipAddress" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvShipAddress" runat="server" ControlToValidate="txtShipAddress" ErrorMessage="Bạn chưa nhập địa chỉ" />
                </div>
                <div class="form-group">
                    <label>Tỉnh/Thành (*)</label>
                    <asp:UpdatePanel ID="udpShipProvince" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlShipProvince" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlShipProvince_SelectedIndexChanged">
                                <asp:ListItem disabled Selected Value="0" Text="-- Tỉnh/Thành ---" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvShipProvince" InitialValue="0" runat="server" ControlToValidate="ddlShipProvince" ErrorMessage="Bạn chưa chọn Tỉnh/Thành"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="form-group">
                    <label>Quận/Huyện (*)</label>
                    <asp:UpdatePanel ID="udpShipDisctict" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlShipDistrict" CssClass="form-control" runat="server">
                                <asp:ListItem disabled Selected Value="0" Text="-- Quận/Huyện ---" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvShipDistrict" InitialValue="0" runat="server" ControlToValidate="ddlShipDistrict" ErrorMessage="Bạn chưa chọn Tỉnh/Thành"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <asp:Button ID="btnSendOrder" CssClass="send-order btn btn-info" Text="Gửi đơn hàng" runat="server" OnClick="btnSendOrder_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
