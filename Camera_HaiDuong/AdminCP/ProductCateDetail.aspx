<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ProductCateDetail.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ProductCateDetail" %>

<asp:Content ID="ctCreateProductCategories" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý loại sản phẩm</h1>
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
                                <legend>Thông tin loại sản phẩm</legend>
                                <asp:HiddenField ID="hdCateID" runat="server" />
                                <div class="form-group">
                                    <label>Loại cấp cha</label>
                                    <asp:DropDownList CssClass="form-control input-sm" ID="ddlCateParents" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Tên loại</label>
                                    <asp:TextBox ID="txtCateName" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Trạng thái</label>
                                    <asp:DropDownList ID="ddlStatus" CssClass="form-control input-sm" runat="server">
                                        <asp:ListItem Value="1" Text="Sử dụng" />
                                        <asp:ListItem Value="0" Text="Không sử dụng" />
                                    </asp:DropDownList>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <asp:Button ID="btnCreate" class="btn btn-primary" Text="Thêm mới" runat="server" OnClick="btnCreate_Click"/>
                                        <asp:Button ID="btnUpdate" class="btn btn-primary" Text="Cập nhật" runat="server" OnClick="btnUpdate_Click"/>
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
