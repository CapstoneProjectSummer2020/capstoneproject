<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập Quản trị website Hưng Phát</title>
    <link href="/AdminCP/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="/AdminCP/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="/AdminCP/dist/css/sb-admin-2.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <link href="/AdminCP/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="/AdminCP/bower_components/jquery/dist/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Đăng nhập</h3>
                    </div>
                    <div class="panel-body">
                        <form id="frmLogin" runat="server">
                            <fieldset>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Tên đăng nhập" name="username" autofocus="true" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Mật khẩu" TextMode="Password" name="password" />
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="btnLogin" class="btn btn-lg btn-success btn-block" Text="Đăng nhập" runat="server" OnClick="btnLogin_Click" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/AdminCP/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/AdminCP/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/AdminCP/dist/js/sb-admin-2.js"></script>
    <script src="/AdminCP/js/bootbox.js"></script>
</body>
</html>
