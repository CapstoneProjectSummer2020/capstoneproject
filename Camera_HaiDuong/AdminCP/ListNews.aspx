<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListNews.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListNews" %>

<asp:Content ID="ctListNews" ContentPlaceHolderID="pgAdmin" runat="server">
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
                                <legend>Danh sách bài viết</legend>
                                <div class="dataTable_wrapper">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvNews" runat="server"
                                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="NewsID" PageSize="20"
                                        OnPageIndexChanging="grvNews_PageIndexChanging" OnRowDeleting="grvNews_RowDeleting" OnSelectedIndexChanging="grvNews_SelectedIndexChanging">
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="NewsID" />
                                             <asp:TemplateField HeaderText="Chuyên mục">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# ncateBLL.GetCateInfo(int.Parse(Eval("CateID").ToString())).CateName %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Hình ảnh">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgImage" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Tiêu đề" DataField="Title" />
                                            <asp:BoundField HeaderText="Ngày đăng" DataField="CreatedDate" />
                                            <asp:TemplateField HeaderText="Trạng thái">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbtStatus" runat="server" Text='<%# Eval("Status").ToString()=="True"?"Hiển thị":"Ẩn" %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Sửa" SelectText="Sửa" ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="Xóa">
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
