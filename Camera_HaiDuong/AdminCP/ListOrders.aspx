<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListOrders.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListOrders" EnableEventValidation="false" %>

<asp:Content ID="ctListOrders" ContentPlaceHolderID="pgAdmin" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý đơn đặt hàng</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <fieldset>
                                <legend style="margin-bottom: 0">Danh sách đơn hàng</legend>
                                <asp:UpdatePanel ID="udpOrder" runat="server">
                                    <ContentTemplate>
                                        <%--<h5 class="text-danger"><em>* Nhấn chọn 1 hàng ở bảng dưới đây để hiển thị chi tiết hóa đơn</em></h5>--%>
                                        <div class="dataTable_wrapper">
                                            <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvOrders" runat="server"
                                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="OrderID"
                                                OnPageIndexChanging="grvOrders_PageIndexChanging" OnRowCommand="grvOrders_RowCommand" OnSelectedIndexChanging="grvOrders_SelectedIndexChanging"
                                                OnRowDeleting="grvOrders_RowDeleting">
                                                <Columns>
                                                    <asp:BoundField HeaderText="#" DataField="OrderID" />
                                                    <asp:BoundField HeaderText="Người đặt hàng" DataField="OrderName" />
                                                    <asp:BoundField HeaderText="Người nhận" DataField="ShipName" />
                                                    <asp:BoundField HeaderText="Nơi nhận" DataField="ShipAddress" />
                                                    <asp:BoundField HeaderText="Tỉnh" DataField="ShipProvince" />
                                                    <asp:BoundField HeaderText="Huyện" DataField="ShipDisctrict" />
                                                    <asp:BoundField HeaderText="Ngày đặt hàng" DataField="OrderDate" />
                                                    <asp:TemplateField HeaderText="Trạng thái">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtStatus" runat="server" CausesValidation="False" CommandName="UpdateStatus" Text='<%# Eval("Status").ToString()=="0"?"Chưa duyệt":(Eval("Status").ToString()=="1"?"Đã duyệt":"Đã giao") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Chi tiết" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtDetail" runat="server" CausesValidation="False" CommandName="Select" Text="Chi tiết"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtDelete" OnClientClick="return confirmDelete(this);" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h2 class="modal-title" id="myModalLabel">Chi tiết đơn hàng</h2>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <h4>Tình trạng: <span class="text-danger">
                                                                    <asp:Label ID="lbStatus" Text="Đã giao hàng" runat="server" /></span></h4>
                                                                <h4>Người duyệt: <span class="text-danger">
                                                                    <asp:Label ID="lbEmployee" Text="Nguyễn Hoàng Phúc" runat="server" /></span></h4>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h4>Tổng hóa đơn: <span class="text-danger">
                                                                    <asp:Label ID="lbTotalAmount" Text="300.000.000 VNĐ" runat="server" /></span></h4>
                                                                <h4>Ngày giao hàng: <span class="text-danger">
                                                                    <asp:Label ID="lbShipDate" Text="22-12-2012 20:00 AM" runat="server" /></span></h4>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <h4 class="page-header">THÔNG TIN ĐẶT HÀNG</h4>
                                                                Họ tên: <strong>
                                                                    <asp:Label ID="lbOrderName" runat="server" /></strong><br />
                                                                Email: <strong>
                                                                    <asp:Label ID="lbOrderEmail" runat="server" /></strong><br />
                                                                Số điện thoại: <strong>
                                                                    <asp:Label ID="lbOrderPhone" runat="server" /></strong><br />
                                                                Địa chỉ: <strong>
                                                                    <asp:Label ID="lbOrderAddress" runat="server" /></strong><br />
                                                                Tỉnh/Thành: <strong>
                                                                    <asp:Label ID="lbOrderProv" runat="server" /></strong><br />
                                                                Quận/Huyện: <strong>
                                                                    <asp:Label ID="lbOrderDisc" runat="server" /></strong><br />
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h4 class="page-header">THÔNG TIN GIAO HÀNG</h4>
                                                                Họ tên: <strong>
                                                                    <asp:Label ID="lbShipName" runat="server" /></strong><br />
                                                                Email: <strong>
                                                                    <asp:Label ID="lbShipEmail" runat="server" /></strong><br />
                                                                Số điện thoại: <strong>
                                                                    <asp:Label ID="lbShipPhone" runat="server" /></strong><br />
                                                                Địa chỉ: <strong>
                                                                    <asp:Label ID="lbShipAddress" runat="server" /></strong><br />
                                                                Tỉnh/Thành: <strong>
                                                                    <asp:Label ID="lbShipProv" runat="server" /></strong><br />
                                                                Quận/Huyện: <strong>
                                                                    <asp:Label ID="lbShipDisc" runat="server" /></strong><br />
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer"
                                                                    ID="grvOrderDetail" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                                                    AllowPaging="True" DataKeyNames="Serial">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sản phẩm">
                                                                            <ItemTemplate>
                                                                                <asp:Image ID="imgProd" ImageUrl='<%# prodBLL.GetProductBySerial(int.Parse(Eval("ProductID").ToString())).ImagePath %>' runat="server" />
                                                                                <asp:Label ID="lbProductName" Text='<%# prodBLL.GetProductBySerial(int.Parse(Eval("ProductID").ToString())).ProductName %>' runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="Đơn giá (VNĐ)" DataField="UnitPrice" DataFormatString="{0:#,###,###,###}" />
                                                                        <asp:BoundField HeaderText="Số lượng" DataField="Quantity" />
                                                                        <asp:BoundField HeaderText="Giảm giá (%)" DataField="Discount" />
                                                                        <asp:BoundField HeaderText="Thành tiền (VNĐ)" DataField="Amount" DataFormatString="{0:#,###,###,###}" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
