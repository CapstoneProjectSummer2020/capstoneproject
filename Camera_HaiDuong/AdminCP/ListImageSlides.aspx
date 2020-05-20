<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListImageSlides.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListImageSlides" %>

<asp:Content ID="ctImages" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý slide ảnh</h1>
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
                                <legend>Danh sách hình ảnh</legend>
                                <div class="dataTable_wrapper">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvSlides" runat="server"
                                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID" PageSize="20"
                                        OnPageIndexChanging="grvSlides_PageIndexChanging" OnRowCommand="grvSlides_RowCommand" OnRowDeleting="grvSlides_RowDeleting" OnSelectedIndexChanging="grvSlides_SelectedIndexChanging">
                                        <Columns>
                                            <asp:BoundField HeaderText="#" DataField="ID" />
                                            <asp:TemplateField HeaderText="Hình ảnh">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgImage" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Hình thu nhỏ">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgThumb" ImageUrl='<%# Eval("ThumbnailPath") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Liên kết">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hplLink" Text='<%# Eval("Link") %>' NavigateUrl='<%# Eval("Link") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Trạng thái">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtStatus" runat="server" CausesValidation="False" CommandName="UpdateStatus" Text='<%# Eval("Status").ToString()=="True"?"Hiển thị":"Ẩn" %>'></asp:LinkButton>
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
