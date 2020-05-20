<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.UserDetail" %>

<asp:Content ID="ctUserDetail" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý người dùng</h1>
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
                                <legend>Thông tin người dùng</legend>
                                <asp:HiddenField ID="hdUserID" runat="server" />
                                <div class="form-group">
                                    <label>Vai trò</label>
                                    <asp:DropDownList CssClass="form-control input-sm" ID="ddlRoles" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Họ tên</label>
                                    <asp:TextBox ID="txtFullName" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Tên tài khoản</label>
                                    <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Mật khẩu</label>
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <asp:TextBox ID="txtPhone" CssClass="form-control" TextMode="Phone" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Trạng thái</label>
                                    <asp:DropDownList ID="ddlStatus" CssClass="form-control input-sm" runat="server">
                                        <asp:ListItem Value="1" Text="Hoạt động" />
                                        <asp:ListItem Value="0" Text="Không hoạt động" />
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
