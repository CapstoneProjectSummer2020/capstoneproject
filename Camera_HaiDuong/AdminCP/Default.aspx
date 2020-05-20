<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.Default" %>

<asp:Content ID="ctAdmin" ContentPlaceHolderID="pgAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Trang chủ</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-file-video-o fa-fw"></i>&nbsp;Video hướng dẫn sử dụng
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="list-group">
                        <a href="/upload/files/BaiViet/BaiViet.html" target="_blank" class="list-group-item">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý bài viết
                        </a>
                        <a href="/upload/files/Products/Products.html" target="_blank" class="list-group-item">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý sản phẩm
                        </a>
                        <a href="/upload/files/LoaiSP/LoaiSP.html" class="list-group-item" target="_blank">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý loại sản phẩm
                        </a>
                        <a href="/upload/files/HP_KM/HP_KM.html" target="_blank" class="list-group-item">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý sản phẩm khuyến mại
                        </a>
                        <a href="/upload/files/Slides/Slides.html" class="list-group-item" target="_blank">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý slide ảnh
                        </a>
                        <a href="/upload/files/Pages/Pages.html" target="_blank" class="list-group-item">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý các trang HTML
                        </a>
                        <a href="/upload/files/Orders/Orders.html" target="_blank"  class="list-group-item">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý đơn hàng
                        </a>
                        <a href="/upload/files/Addresses/Addresses.html" target="_blank" class="list-group-item">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý địa chỉ
                        </a>
                        <a href="/upload/files/Users/Users.html" target="_blank" class="list-group-item">
                            <i class="fa fa-check-square-o fa-fw"></i>&nbsp;Hướng dẫn Quản lý người dùng
                        </a>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
    </div>
</asp:Content>
