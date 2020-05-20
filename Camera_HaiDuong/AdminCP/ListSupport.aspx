<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListSupport.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListSupport" %>

<asp:Content ID="ctListSupport" ContentPlaceHolderID="pgAdmin" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý thông tin hỗ trợ viên</h1>
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
                                <legend>Danh sách hỗ trợ viên</legend>
                                <asp:UpdatePanel ID="udpBanner" runat="server">
                                    <ContentTemplate>
                                        <div class="dataTable_wrapper">
                                            <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvSupporters" runat="server"
                                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID"
                                                OnPageIndexChanging="grvSupporters_PageIndexChanging" OnRowDeleting="grvSupporters_RowDeleting" OnSelectedIndexChanging="grvSupporters_SelectedIndexChanging">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Lĩnh vực">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbType" Text='<%# Eval("Type") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Tên" DataField="Name" />
                                                    <asp:TemplateField HeaderText="Hình đại diện">
                                                        <ItemTemplate>
                                                            <img src='<%# Eval("AvatarPath") %>' alt='<%# Eval("Name") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Số điện thoại Skype">
                                                        <ItemTemplate>
                                                            <a href='<%# Eval("SkypeNumber") %>' style="cursor: pointer" target="_blank">
                                                                <%# Eval("SkypeNumber") %>
                                                            </a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Địa chỉ Skype">
                                                        <ItemTemplate>
                                                            <a href='<%# Eval("SkypeUrl") %>' style="cursor: pointer" target="_blank">
                                                                <%# Eval("SkypeUrl") %>
                                                            </a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cập nhật">
                                                        <ItemTemplate>
                                                            <a href='/AdminCP/SupportDetail.aspx?id=<%# Eval("ID") %>'>Sửa</a>
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
