<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="ListBanners.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.ListBanners" %>

<asp:Content ID="ctListBanners" ContentPlaceHolderID="pgAdmin" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý banner</h1>
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
                                <legend>Danh sách banner</legend>
                                <asp:UpdatePanel ID="udpBanner" runat="server">
                                    <ContentTemplate>
                                        <div class="dataTable_wrapper">
                                            <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer" ID="grvBanners" runat="server"
                                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID"
                                                OnPageIndexChanging="grvBanners_PageIndexChanging" OnRowDeleting="grvBanners_RowDeleting" OnSelectedIndexChanging="grvBanners_SelectedIndexChanging">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Kiểu banner">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbType" Text='<%# Eval("Type").ToString()=="1"?"Banner ngang":"Banner dọc" %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Banner (Chọn để phóng to)">
                                                        <ItemTemplate>
                                                            <a class="popupBanner" style="cursor: pointer" data-toggle="modal" data-target="#myModal">
                                                                <img src='<%# Eval("BannerPath") %>' alt='<%# Eval("BannerAlt") %>' />
                                                            </a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Url bài viết">
                                                        <ItemTemplate>
                                                            <a href='<%# Eval("Url") %>' target="_blank"><%# Eval("Url") %></a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Trạng thái">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtStatus" runat="server" CausesValidation="False" CommandName="Select"
                                                                Text='<%# Eval("Status").ToString()=="True"?"Hiện":"Ẩn" %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cập nhật">
                                                        <ItemTemplate>
                                                            <a href='/AdminCP/BannerDetail.aspx?id=<%# Eval("ID") %>'>Sửa</a>
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
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <img id="imgBanner" src="#" alt="Alternate Text" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->
                                        <script>
                                            $('.popupBanner').click(function () {
                                                var obj = $(this).find('img');
                                                $('#imgBanner').attr('src', obj.attr('src'));
                                            });
                                        </script>
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
