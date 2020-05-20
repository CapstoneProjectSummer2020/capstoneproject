<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListCateProducts.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListCateProducts" %>

<asp:Content ID="ctListCateProducts" ContentPlaceHolderID="pgAdmin" runat="server">
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
                        <div class="col-lg-12">
                            <fieldset>
                                <legend>Danh sách loại sản phẩm</legend>
                                <div class="dataTable_wrapper">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvCateProducts" runat="server"
                                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="CateID"
                                        OnPageIndexChanging="grvCateProducts_PageIndexChanging" OnRowDeleting="grvCateProducts_RowDeleting"
                                         OnSelectedIndexChanging="grvCateProducts_SelectedIndexChanging" OnRowDataBound="grvCateProducts_RowDataBound">
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="CateID" />
                                            <asp:TemplateField HeaderText="Cấp cha">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbParents" Text='<%# Eval("CateParentsID")==null?"Cấp cha":pcateBLL.GetCateInfoByCateID((int)Eval("CateParentsID")).CateName %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Tên loại" DataField="CateName" />
                                            <asp:TemplateField HeaderText="Trạng thái">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbStatus" Text='<%# Eval("Status").ToString()=="True"?"Sử dụng":"Không sử dụng" %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Sửa" SelectText="Sửa" ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hdDelete" Value='<%# Eval("CateID") %>' runat="server" />
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
