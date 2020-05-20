<%@ Page Title="" Language="C#" MasterPageFile="~/AdminCP/Admin.Master" AutoEventWireup="true" CodeBehind="AddPromotionProduct.aspx.cs" Inherits="Camera_HaiDuong.AdminCP.AddPromotionProduct" %>

<asp:Content ID="ctListPromotionProducts" ContentPlaceHolderID="pgAdmin" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>

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
                                <legend>Thêm sản phẩm khuyến mại</legend>
                                <asp:Panel ID="pnSelectProducts" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div id="selectProducts" class="panel panel-default">
                                                <div class="panel-heading">
                                                    Chọn sản phẩm cần khuyến mại
                                                </div>
                                                <div class="panel-body">
                                                    <asp:UpdatePanel ID="udpModel" runat="server">
                                                        <ContentTemplate>
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtSearchSerial" placeholder="Nhập serial sản phẩm cần tìm ở đây..." runat="server" CssClass="form-control input-sm" />
                                                                    <span class="input-group-btn">
                                                                        <asp:LinkButton ID="lbtSearchSerial" CssClass="btn btn-primary btn-sm" Text="Tìm" runat="server" OnClick="lbtSearchSerial_Click" />
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="dataTable_wrapper">
                                                                <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable no-footer"
                                                                     AllowPaging="true" ID="grvProducts" runat="server" ShowHeaderWhenEmpty="True" 
                                                                    AutoGenerateColumns="False" DataKeyNames="Serial" OnSelectedIndexChanging="grvProducts_SelectedIndexChanging"
                                                                    OnPageIndexChanging="grvProducts_PageIndexChanging">
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Serial" DataField="Serial" />
                                                                        <asp:TemplateField HeaderText="Hãng SX">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbSupplier" Text='<%# supBLL.GetSupplierBySupplerID(int.Parse(Eval("SupplierID").ToString())).SupplierName %>' runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Loại SP">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbCategory" Text='<%# pcateBLL.GetCateInfoByCateID(int.Parse(Eval("CateID").ToString())).CateName %>' runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="Mã SP" DataField="ProductID" />
                                                                        <asp:BoundField HeaderText="Tên sản phẩm" DataField="ProductName" />
                                                                        <asp:TemplateField HeaderText="Hình ảnh">
                                                                            <ItemTemplate>
                                                                                <asp:Image ID="imgProduct" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="Giá" DataField="UnitPrice" DataFormatString="{0:#,###,###,###}" />
                                                                        <asp:TemplateField HeaderText="Trạng thái">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbStatus" Text='<%# Eval("Status").ToString()=="True"?"Bán":"Ngừng bán" %>' runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Chọn" ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton CssClass="closeSelectProducts" ID="lbtSelect" runat="server" CausesValidation="False" CommandName="Select" Text="Chọn"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div class="panel-footer"></div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnInfo" runat="server">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Serial</label>
                                                <asp:TextBox ID="txtSerial" runat="server" CssClass="form-control" ReadOnly="true" />
                                            </div>
                                            <div class="form-group">
                                                <label>Tên sản phẩm</label>
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
                                                <asp:Button ID="btnAdd" CssClass="btn btn-primary"  Text="Thêm mới" runat="server" OnClick="btnAdd_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
