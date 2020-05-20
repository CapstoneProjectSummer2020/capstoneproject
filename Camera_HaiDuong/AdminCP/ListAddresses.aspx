<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListAddresses.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListAddresses" %>

<asp:Content ID="ctListAddresses" ContentPlaceHolderID="pgAdmin" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý địa chỉ</h1>
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
                                <legend>Danh sách địa chỉ</legend>
                                <asp:UpdatePanel ID="udpUpdateStatus" runat="server">
                                    <ContentTemplate>
                                        <div class="dataTable_wrapper">
                                            <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvAddresses" runat="server"
                                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID" PageSize="20"
                                                OnPageIndexChanging="grvAddresses_PageIndexChanging" OnSelectedIndexChanging="grvAddresses_SelectedIndexChanging">
                                                <Columns>
                                                    <asp:BoundField HeaderText="#" DataField="ID" />
                                                    <asp:TemplateField HeaderText="Trực thuộc">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbLevel" Text='<%# Eval("ParentsID")==null?"Trung Ương":"Tỉnh " + addBLL.GetProvinceById((int)Eval("ParentsID")).Name %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tên">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbCategory" Text='<%# Eval("Name") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Trạng thái (Chọn để thay đổi)">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtStatus" runat="server" CausesValidation="False" CommandName="Select" Text='<%# Eval("Status").ToString()=="True"?"Hỗ trợ":"Ngừng hỗ trợ" %>'></asp:LinkButton>
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
