<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListPromotionProducts.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListPromotionProducts" %>

<asp:Content ID="ctListPromotionProducts" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý sản phẩm khuyến mại</h1>
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
                                <legend>Danh sách sản phẩm khuyến mại</legend>
                                <div class="dataTable_wrapper">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvPromotionProducts" runat="server"
                                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID"
                                        OnPageIndexChanging="grvPromotionProducts_PageIndexChanging" OnRowDeleting="grvPromotionProducts_RowDeleting" OnSelectedIndexChanging="grvPromotionProducts_SelectedIndexChanging">
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="ID" />
                                            <asp:TemplateField HeaderText="Sản phẩm">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbSupplier" Text='<%# prodBLL.GetProductBySerial((int.Parse(Eval("ProductID").ToString()))).ProductName %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Hình ảnh">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgProduct" ImageUrl='<%# prodBLL.GetProductBySerial((int.Parse(Eval("ProductID").ToString()))).ImagePath %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Giá (VNĐ)">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbUnitPrice" Text='<%# prodBLL.GetProductBySerial((int.Parse(Eval("ProductID").ToString()))).UnitPrice.Value.ToString("#,###,###,###") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Giảm giá (%)" DataField="Discount" />
                                            <asp:BoundField HeaderText="Ngày bắt đầu" DataField="BeginDate" DataFormatString="{0:dd/MM/yyyy}" />
                                            <asp:BoundField HeaderText="Ngày kết thúc" DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" />
                                            <asp:CommandField HeaderText="Sửa" SelectText="Sửa" ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtDelete" OnClientClick="return confirmDelete(this);" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
