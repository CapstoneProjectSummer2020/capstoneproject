<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Camera_HaiDuong.ProductDetail" EnableEventValidation="false" %>

<asp:Content ID="ctProductDetail" ContentPlaceHolderID="phMain" runat="server">
    <div class="row hp-lprod-main">
        <div class="row" style="position: relative">
            <div class="col-lg-9">
                <div class="row">
                    <div class="col-lg-5 p_detail_img">
                        <asp:Image ID="imgProd" runat="server" />
                    </div>
                    <div class="col-lg-7 p_detail_info">
                        <h1>
                            <asp:Label ID="lbProdName" Text="Camera thân HDTVI VANTECH VP-401SLT" runat="server" />
                        </h1>
                        <p class="model_ppage">
                            Model:
                            <asp:Label ID="lbProductID" Text="VANTECH VP-401SLT" runat="server" />
                            <span>|</span> Thương hiệu:
                            <asp:Label ID="lbSupplier" Text="Camera Vantech" runat="server" />
                            <span>|</span> Lượt xem:
                            <asp:Label ID="lbView" Text="100" runat="server" />
                        </p>
                        <div class="brief_ppage">
                            <div>
                                <asp:Literal ID="litDescription" Text="Description" runat="server" />
                            </div>
                        </div>
                        <div class="promotion_ppage">
                            <dl>
                                <dt><a href="#">
                                    <img src="/img/8281program-3.jpg" /></a></dt>
                                <dd><a href="#">Chính sách vận chuyển nhanh chóng thuận tiện trên Toàn Quốc. <span>Xem chi tiết.</span></a></dd>
                            </dl>
                            <dl>
                                <dt><a href="#">
                                    <img src="/img/9953program-1.png" /></a></dt>
                                <dd><a href="#">Mua các loại camera giám sát, đầu ghi, phụ kiện camera, Đổi mới miễn phí trong 7 ngày. <span>Xem chi tiết.</span></a></dd>
                            </dl>
                            <br class="cll" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-pills">
                            <li class="active">
                                <a href="#1" data-toggle="tab" aria-expanded="true">Giới thiệu</a>
                            </li>
                            <li class="">
                                <a href="#2" data-toggle="tab" aria-expanded="false">Thông số kỹ thuật</a>
                            </li>
                            <li class="">
                                <a href="#3" data-toggle="tab" aria-expanded="false">Chính sách bảo hành</a>
                            </li>
                            <li class="">
                                <a href="#4" data-toggle="tab" aria-expanded="false">Tư vấn</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="1">
                                <div class="row tab-content-detail">
                                    <asp:Literal ID="litIntroduction" Text="Description" runat="server" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="2">
                                <div class="row tab-content-detail">
                                    <asp:Literal ID="litParameter" Text="Description" runat="server" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="3">
                                <div class="row tab-content-detail">
                                    <div style="margin: 0px; padding: 0px; outline: none medium; color: rgb(0, 0, 0); font-family: Arial; font-size: 12px; line-height: normal;">
                                        <div style="margin: 0px; padding: 0px; outline: none medium; color: rgb(0, 0, 0); font-family: Arial; font-size: 12px; line-height: normal;">
                                            Để nhận được thông tin đầy đủ về sản phẩm trước khi mua, quý khách có thể liên hệ:&nbsp;<br />
                                            &nbsp;
                                                        <p>TRUNG TÂM PHÂN PHỐI CAMERA HÀNG ĐẦU VIỆT NAM</p>
                                            <br />
                                            Số điện thoại :&nbsp;<span style="color: rgb(255, 0, 0)">043.9964.111</span>&nbsp;<br />
                                            E-Mail: info@camerahanoi.com.vn<br />
                                            Giờ làm việc: Thứ hai đến Chủ nhật: 8:00 sáng ~ 18h00
                                        </div>

                                        <div style="margin: 0px; padding: 0px; outline: none medium; color: rgb(0, 0, 0); font-family: Arial; font-size: 12px; line-height: normal;">
                                            &nbsp;
                                                        <p>Cam kết:</p>
                                            Cảm ơn quý khách đã mua hàng tại MHG. Để đảm bảo quyền lợi của quý khách, đã nhận đúng, đã nhận đủ. Quý khách vui lòng kiểm tra tình trạng hàng hóa kèm hóa đơn và phiếu bảo hành cùng các phụ kiện đi kèm. MHG cung cấp hàng chính hãng với giá cả cạnh tranh cùng nhiều chính sách &amp; nhiều dịch vụ hỗ trợ sau bán hàng Để biết thêm chi tiế xin vui lòng liên hệ&nbsp;<span style="color: rgb(255, 0, 0)">043.9964.111&nbsp;</span>để mua!
                                        </div>

                                        <div style="margin: 0px; padding: 0px; outline: none medium; font-family: Arial; font-size: 12px; line-height: normal;">
                                            &nbsp;
                                                        <p><span style="color: rgb(0, 0, 0)">Lưu ý:</span></p>
                                            <span style="color: rgb(0, 0, 0)">Trong quá trình sản xuất sản phẩm có thể thay đổi về bao bì hoặc nguồn gốc xuất xứ hay một số phụ kiện mà không được báo trước. MediaMart không thể đảm bảo sản phẩm khách hàng nhận được đúng với bao bì trước đó có sự chính xác như nhau mà chỉ đảm bảo cung cấp hàng chính hãng.&nbsp;</span><br>
                                            &nbsp;
                                                        <p><span style="color: rgb(0, 0, 0)">Trường hợp khách hàng cần thông tin liên hệ với:</span></p>
                                            <br>
                                            <span style="color: rgb(0, 0, 0)">
                                                <strong>TRUNG TÂM CHĂM SÓC KHÁCH HÀNG</strong>&nbsp;<br />
                                                Số điện thoại :&nbsp;
                                            </span>0313.615.955&nbsp;<br />
                                            E-Mail: info@camerahaiphong.com.vn
                                        </div>

                                        <div style="margin: 0px; padding: 0px; outline: none medium; font-family: Arial; font-size: 12px; line-height: normal;">
                                            &nbsp;
                                                        <p><span style="color: rgb(0, 0, 0)">Bản quyền:</span></p>
                                            <span style="color: rgb(0, 0, 0)">MHG cung cấp thông tin về sản phẩm, tư vấn hay thảo luận của người sử dụng là thuộc nguồn tài nguyên của MediaMart. Cấm sao chép dưới mọi hình thức.&nbsp;</span>

                                            <p><span style="color: rgb(0, 0, 0)">Lưu ý:</span></p>
                                            <span style="color: rgb(0, 0, 0)">Trang web này cập nhập các thông tin sản phẩm từ các nhà sản xuất, có tính xác thực, tính chính xác và tính hợp pháp của các chủ sở hữu thông tin là&nbsp;</span>nhà cung cấp&nbsp;. Webstie MediaMart không cung cấp bất kỳ đảm bảo và không chịu bất kỳ trách nhiệm pháp lý.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="4">
                                <div class="row tab-content-detail">
                                    <div style="margin: 0px; padding: 0px; outline: none medium; color: rgb(0, 0, 0); font-family: Arial; font-size: 12px; line-height: normal;">
                                        Để nhận được thông tin đầy đủ về sản phẩm trước khi mua, quý khách có thể liên hệ:&nbsp;<br />
                                        &nbsp;
                                                    <p>TRUNG TÂM PHÂN PHỐI CAMERA HÀNG ĐẦU VIỆT NAM</p>
                                        <br />
                                        Số điện thoại :&nbsp;<span style="color: rgb(255, 0, 0)">043.9964.111</span>&nbsp;<br />
                                        E-Mail: info@camerahanoi.com.vn<br />
                                        Giờ làm việc: Thứ hai đến Chủ nhật: 8:00 sáng ~ 18h00
                                    </div>

                                    <div style="margin: 0px; padding: 0px; outline: none medium; color: rgb(0, 0, 0); font-family: Arial; font-size: 12px; line-height: normal;">
                                        &nbsp;
                                                    <p>Cam kết:</p>
                                        Cảm ơn quý khách đã mua hàng tại MHG. Để đảm bảo quyền lợi của quý khách, đã nhận đúng, đã nhận đủ. Quý khách vui lòng kiểm tra tình trạng hàng hóa kèm hóa đơn và phiếu bảo hành cùng các phụ kiện đi kèm. MHG cung cấp hàng chính hãng với giá cả cạnh tranh cùng nhiều chính sách &amp; nhiều dịch vụ hỗ trợ sau bán hàng Để biết thêm chi tiế xin vui lòng liên hệ&nbsp;<span style="color: rgb(255, 0, 0)">043.9964.111&nbsp;</span>để mua!
                                    </div>

                                    <div style="margin: 0px; padding: 0px; outline: none medium; font-family: Arial; font-size: 12px; line-height: normal;">
                                        &nbsp;
                                                    <p><span style="color: rgb(0, 0, 0)">Lưu ý:</span></p>
                                        <span style="color: rgb(0, 0, 0)">Trong quá trình sản xuất sản phẩm có thể thay đổi về bao bì hoặc nguồn gốc xuất xứ hay một số phụ kiện mà không được báo trước. MediaMart không thể đảm bảo sản phẩm khách hàng nhận được đúng với bao bì trước đó có sự chính xác như nhau mà chỉ đảm bảo cung cấp hàng chính hãng.&nbsp;</span><br>
                                        &nbsp;
                                                    <p><span style="color: rgb(0, 0, 0)">Trường hợp khách hàng cần thông tin liên hệ với:</span></p>
                                        <br>
                                        <span style="color: rgb(0, 0, 0)">
                                            <strong>TRUNG TÂM CHĂM SÓC KHÁCH HÀNG</strong>&nbsp;<br />
                                            Số điện thoại :
                                        </span>0313.615.955&nbsp;<br />
                                        E-Mail: info@camerahaiduong.com.vn
                                    </div>

                                    <div style="margin: 0px; padding: 0px; outline: none medium; font-family: Arial; font-size: 12px; line-height: normal;">
                                        &nbsp;
                                                    <p><span style="color: rgb(0, 0, 0)">Bản quyền:</span></p>
                                        <span style="color: rgb(0, 0, 0)">MHG cung cấp thông tin về sản phẩm, tư vấn hay thảo luận của người sử dụng là thuộc nguồn tài nguyên của MediaMart. Cấm sao chép dưới mọi hình thức.&nbsp;</span>

                                        <p><span style="color: rgb(0, 0, 0)">Lưu ý:</span></p>
                                        <span style="color: rgb(0, 0, 0)">Trang web này cập nhập các thông tin sản phẩm từ các nhà sản xuất, có tính xác thực, tính chính xác và tính hợp pháp của các chủ sở hữu thông tin là </span>nhà cung cấp&nbsp;. Webstie MediaMart không cung cấp bất kỳ đảm bảo và không chịu bất kỳ trách nhiệm pháp lý.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 right_r">
                <img src="/img/79hotline.gif" alt="Hotline trang sản phẩm" />
                <div class="rbox_ppage">
                    <asp:Label CssClass="full_price" ClientIDMode="Static" ID="lbFullPrice" Text="3.500.000" runat="server" />
                    <%--<span class="full_price"><span class="num_price_3"></span><span class="num_price_c"></span><span class="num_price_1"></span><span class="num_price_5"></span><span class="num_price_0"></span><span class="num_price_ct"></span></span>--%>
                    <em>
                        <asp:Label ID="lbPrice" Text="3.500.000" runat="server" /></em>
                    <strong>
                        <asp:Label ID="lbSub" Text="350.000" runat="server" /></strong>
                    <p>
                        Tình trạng sản phẩm: <span style="font-weight: bold; color: #ff8a00;">
                            <asp:Label ID="lbStatus" Text="Còn hàng" runat="server" /></span>
                    </p>
                </div>
                <div class="order_form">
                    <asp:HiddenField ID="hdProdId" runat="server" />
                    <p>
                        <span>Số lượng sản phẩm:</span>
                        <asp:TextBox ID="txtQuantity" TextMode="Number" min="1" Text="1" runat="server" />
                    </p>
                    <asp:Button ID="btnAddToCart" Text="MUA NGAY ƯU ĐÃI HẤP DẪN" runat="server" OnClick="btnAddToCart_Click" />
                </div>
            </div>
        </div>
    </div>
    <script>
        var str = document.getElementById("lbFullPrice").innerHTML;
        var res = str.replace(".000đ", "<span class='num_price_ct'></span>");
        res = res.replace(/0/g, "<span class='num_price_0'></span>");
        res = res.replace(/1/g, "<span class='num_price_1'></span>");
        res = res.replace(/2/g, "<span class='num_price_2'></span>");
        res = res.replace(/3/g, "<span class='num_price_3'></span>");
        res = res.replace(/4/g, "<span class='num_price_4'></span>");
        res = res.replace(/5/g, "<span class='num_price_5'></span>");
        res = res.replace(/6/g, "<span class='num_price_6'></span>");
        res = res.replace(/7/g, "<span class='num_price_7'></span>");
        res = res.replace(/8/g, "<span class='num_price_8'></span>");
        res = res.replace(/9/g, "<span class='num_price_9'></span>");
        res = res.replace(/[.]/g, "<span class='num_price_c'></span>");
        document.getElementById("lbFullPrice").innerHTML = res;
    </script>
</asp:Content>
