<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.NewsDetail" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="ctNewsDetail" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý bài viết</h1>
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
                                <legend>Thông tin bài viết</legend>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Chuyên mục</label>
                                            <asp:DropDownList CssClass="form-control" ID="ddlCategories" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Hình ảnh</label>
                                    <asp:Image ID="imgNews" ImageUrl="#" runat="server" />
                                    <asp:FileUpload ID="uploadImage" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Tiêu đề</label>
                                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Phụ đề</label>
                                    <asp:TextBox ID="txtSubtitle" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Nội dung</label>
                                    <CKEditor:CKEditorControl ID="ckeContent" FilebrowserBrowseUrl="../../ckfinder/ckfinder.html" runat="server"></CKEditor:CKEditorControl>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Trạng thái</label>
                                            <asp:DropDownList CssClass="form-control" ID="ddlStatus" runat="server">
                                                <asp:ListItem Value="1" Text="Hiển thị" />
                                                <asp:ListItem Value="0" Text="Ẩn" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <asp:Button ID="btnAdd" class="btn btn-primary" Text="Thêm mới" runat="server" OnClick="btnAdd_Click" />
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
