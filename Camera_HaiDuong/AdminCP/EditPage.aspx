<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="EditPage.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.EditPage" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="ctEditIntroduction" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý các trang</h1>
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
                                <legend>Chỉnh sửa nội dung trang</legend>
                                <div class="form-group">
                                    <label>Chuyên mục</label>
                                    <asp:DropDownList CssClass="form-control" ID="ddlParents" AppendDataBoundItems="true" runat="server">
                                        <asp:ListItem Value="0" Text="-- Cấp cha ---" />
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Tiêu đề trang</label>
                                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Nội dung</label>
                                    <CKEditor:CKEditorControl ID="ckeContent" runat="server" FilebrowserBrowseUrl="../../ckfinder/ckfinder.html"></CKEditor:CKEditorControl>
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
