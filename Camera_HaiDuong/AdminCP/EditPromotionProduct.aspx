<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="EditPromotionProduct.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.EditPromotionProduct" %>

<asp:Content ID="ctEditPromotionProduct" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Quản lý sản phẩm khuyến mại</h1>
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
                                <legend>Cập nhật thông tin khuyến mại</legend>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:HiddenField ID="hdID" runat="server" />
                                        <asp:HiddenField ID="hdProductID" runat="server" />
                                        <div class="form-group">
                                            <label>Sản phẩm</label>
                                            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" ReadOnly="true" />
                                        </div>
                                        <div class="form-group">
                                            <label>Mức giảm giá</label>
                                            <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label>Bắt đầu</label>
                                            <asp:TextBox ID="txtStartDate" TextMode="Date" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label>Kết thúc</label>
                                            <asp:TextBox ID="txtEndDate" TextMode="Date" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="btnUpdate" CssClass="btn btn-primary" Text="Cập nhật" runat="server" OnClick="btnUpdate_Click" />
                                        </div>
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
