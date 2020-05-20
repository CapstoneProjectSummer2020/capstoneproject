<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="Camera_HaiDuong.Pages" %>

<asp:Content ID="ctPages" ContentPlaceHolderID="phMain" runat="server">
    <div class="row hp-lprod-main">
        <h3 class="page-header"><asp:Label ID="lbTitle" Text="Tiêu đề trang" runat="server" /></h3>
        <asp:Literal ID="litPageContent" Text="" runat="server" />
    </div>
    <br />
</asp:Content>
