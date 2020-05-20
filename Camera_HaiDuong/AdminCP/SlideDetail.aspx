<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="SlideDetail.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.SlideDetail" %>

<asp:Content ID="ctSlideDetail" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý slide ảnh</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <fieldset>
                                <legend>Chi tiết hình ảnh</legend>
                                <div class="form-group">
                                    <label>Hình ảnh</label>
                                    <asp:Image ID="imgPreview" ImageUrl="#" runat="server" Visible="false" ClientIDMode="Static" />
                                    <asp:FileUpload ID="uploadImage" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Hình ảnh</label>
                                    <asp:Image ID="imgThumbnail" ImageUrl="#" runat="server" Visible="false" ClientIDMode="Static" />
                                    <asp:FileUpload ID="uploadThumbail" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Liên kết</label>
                                    <asp:TextBox ID="txtLink" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Trạng thái</label>
                                    <asp:DropDownList ID="ddlStatus" CssClass="form-control input-sm" runat="server">
                                        <asp:ListItem Value="1" Text="Hiển thị" />
                                        <asp:ListItem Value="0" Text="Ẩn" />
                                    </asp:DropDownList>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <asp:Button ID="btnCreate" class="btn btn-primary" Text="Thêm mới" runat="server" OnClick="btnCreate_Click" />
                                        <asp:Button ID="btnUpdate" class="btn btn-primary" Text="Cập nhật" runat="server" OnClick="btnUpdate_Click" />
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
