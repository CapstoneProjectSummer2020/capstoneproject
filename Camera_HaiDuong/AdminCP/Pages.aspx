<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.Pages" %>

<asp:Content ID="ctPages" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý trang HTML</h1>
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
                                <legend>Danh sách trang HTML</legend>
                                <div class="dataTable_wrapper">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvPages" runat="server"
                                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID" PageSize="20"
                                        OnPageIndexChanging="grvPages_PageIndexChanging" OnRowDeleting="grvPages_RowDeleting" OnSelectedIndexChanging="grvPages_SelectedIndexChanging">
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="ID" />
                                            <asp:TemplateField HeaderText="Chỉ mục">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbCate" Text='<%# Eval("ParentsID").ToString()=="0"?"Cấp cha":"-- " + othBLL.GetParentsName((int)Eval("ParentsID")) + " ---" %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Tiêu đề trang">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbTitle" Text='<%# Eval("Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cập nhật" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtUpdate" runat="server" CausesValidation="False" CommandName="Select" Text="Sửa"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtDelete" runat="server" CausesValidation="False" OnClientClick="return confirmDelete(this);" CommandName="Delete" Text="Xóa"></asp:LinkButton>
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
