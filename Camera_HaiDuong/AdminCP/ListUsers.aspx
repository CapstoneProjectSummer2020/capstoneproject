<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListUsers.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListUsers" %>

<asp:Content ID="ctListUsers" ContentPlaceHolderID="pgAdmin" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
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
                        <div class="col-lg-12">
                            <fieldset>
                                <legend>Danh sách người dùng</legend>
                                <asp:UpdatePanel ID="udpUser" runat="server">
                                    <ContentTemplate>
                                        <div class="dataTable_wrapper">
                                            <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvUsers" runat="server"
                                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="UserID"
                                                OnPageIndexChanging="grvUsers_PageIndexChanging" OnSelectedIndexChanging="grvUsers_SelectedIndexChanging">
                                                <Columns>
                                                    <asp:BoundField HeaderText="#" DataField="UserID" />
                                                    <asp:TemplateField HeaderText="Vai trò">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbParents" Text='<%# rBLL.GetRoleByID((int)Eval("RoleID")).RoleName %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Họ tên" DataField="FullName" />
                                                    <asp:BoundField HeaderText="Tên TK" DataField="Username" />
                                                    <asp:BoundField HeaderText="Ngày tạo" DataField="CreatedDate" />
                                                    <asp:TemplateField HeaderText="Trạng thái">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtDelete" runat="server" CausesValidation="False" CommandName="Select"
                                                                Text='<%# Eval("Status").ToString()=="True"?"Hoạt động":"Không hoạt động" %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cập nhật">
                                                        <ItemTemplate>
                                                            <a href='/AdminCP/UserDetail.aspx?id=<%# Eval("UserID") %>'>Sửa</a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
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
