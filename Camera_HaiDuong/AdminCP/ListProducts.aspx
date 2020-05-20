<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListProducts.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListProducts" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="ctListProducts" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý sản phẩm</h1>
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
                                <legend>Danh sách sản phẩm</legend>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label>Tìm kiếm sản phẩm</label>
                                            <div class="input-group custom-search-form">
                                                <asp:TextBox ID="txtKeyword" CssClass="form-control" runat="server" placeholder="Nhập từ khóa có trong serial, mã hoặc tên sản phẩm ..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton ID="btnSearchProduct" CssClass="btn btn-default" Text="<i class='fa fa-search'></i>" runat="server" OnClick="btnSearchProduct_Click" />
                                                </span>
                                            </div>
                                        </div>
                                        <!-- /input-group -->
                                    </div>
                                </div>
                                <div class="dataTable_wrapper">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTables no-footer" ID="grvProducts" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="Serial" OnPageIndexChanging="grvProducts_PageIndexChanging" OnRowDeleting="grvProducts_RowDeleting" OnSelectedIndexChanging="grvProducts_SelectedIndexChanging">
                                        <Columns>
                                            <asp:BoundField HeaderText="STT" DataField="Serial" />
                                            <asp:TemplateField HeaderText="Hãng SX">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbSupplier" Text='<%# supBLL.GetSupplierBySupplerID(int.Parse(Eval("SupplierID").ToString())).SupplierName %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Loại SP">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbCategory" Text='<%# pcateBLL.GetCateInfoByCateID(int.Parse(Eval("CateID").ToString())).CateName %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Mã SP" DataField="ProductID" />
                                            <asp:BoundField HeaderText="Tên sản phẩm" DataField="ProductName" />
                                            <asp:TemplateField HeaderText="Hình ảnh">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgProduct" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Giá (VNĐ)" DataField="UnitPrice" DataFormatString="{0:#,###,###,###}" />
                                            <asp:BoundField HeaderText="Lượt xem" DataField="Viewed" />
                                            <asp:BoundField HeaderText="Lượt mua" DataField="Bought" />
                                            <asp:TemplateField HeaderText="Trạng thái">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbStatus" Text='<%# Eval("Status").ToString()=="True"?"Bán":"Ngừng bán" %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
