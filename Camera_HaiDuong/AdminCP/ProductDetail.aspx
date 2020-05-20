<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.CreateProduct" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="ctCreateProduct" ContentPlaceHolderID="pgAdmin" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
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
                                <legend>Thêm sản phẩm</legend>

                                <asp:HiddenField ID="hdSerial" runat="server" />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <asp:UpdatePanel ID="udpSuppliers" runat="server">
                                                <ContentTemplate>
                                                    <label>Hãng sản xuất</label>
                                                    <asp:DropDownList CssClass="form-control input-sm" ID="ddlSuppliers" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlSuppliers_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="form-group">
                                            <asp:UpdatePanel ID="udpCategories" runat="server">
                                                <ContentTemplate>
                                                    <label>Loại sản phẩm</label>
                                                    <asp:DropDownList CssClass="form-control input-sm" ID="ddlCategories" runat="server">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="form-group">
                                            <label>Mã sản phẩm</label>
                                            <asp:TextBox ID="txtProductID" CssClass="form-control" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <label>Tên sản phẩm</label>
                                            <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <label>Hình ảnh</label>
                                            <asp:Image ID="imgPreview" ImageUrl="#" runat="server" ClientIDMode="Static" />
                                            <asp:FileUpload ID="uploadImage" runat="server" />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Thông tin sản phẩm</label>
                                    <CKEditor:CKEditorControl FilebrowserBrowseUrl="../../ckfinder/ckfinder.html" ID="ckeInformation" CssClass="form-control" runat="server"></CKEditor:CKEditorControl>
                                </div>
                                 <div class="form-group">
                                    <label>Giới thiệu sản phẩm</label>
                                    <CKEditor:CKEditorControl FilebrowserBrowseUrl="../../ckfinder/ckfinder.html" ID="ckeIntroduction" CssClass="form-control" runat="server"></CKEditor:CKEditorControl>
                                </div>
                                 <div class="form-group">
                                    <label>Thông số sản phẩm</label>
                                    <CKEditor:CKEditorControl FilebrowserBrowseUrl="../../ckfinder/ckfinder.html" ID="ckeParameters" CssClass="form-control" runat="server"></CKEditor:CKEditorControl>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Giá sản phẩm (VNĐ)</label>
                                            <asp:TextBox ID="txtUnitPrice" CssClass="form-control" TextMode="Number" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <label>Số lượng</label>
                                            <asp:TextBox ID="txtQuantity" CssClass="form-control" min="0" TextMode="Number" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <label>Trạng thái</label>
                                            <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="1" Text="Bán" />
                                                <asp:ListItem Value="0" Text="Ngừng Bán" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <asp:Button ID="btnCreate" class="btn btn-primary" Text="Thêm mới" runat="server" OnClick="btnCreate_Click" />
                                        <asp:Button ID="btnUpdate" class="btn btn-primary" Text="Cập nhật" runat="server" OnClick="btnUpdate_Click" />
                                        <asp:Button ID="btnCancel" class="btn btn-primary" Text="Hủy bỏ" runat="server" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
