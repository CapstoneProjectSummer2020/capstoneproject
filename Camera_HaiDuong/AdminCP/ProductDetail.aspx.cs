using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace Camera_HaiDuong.AdminCP
{
    public partial class CreateProduct : System.Web.UI.Page
    {
        SuppliersBLL supBLL = new SuppliersBLL();
        ProductsBLL prodBLL = new ProductsBLL();
        ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlSuppliers.DataSource = supBLL.GetAvailableSuppliers();
                ddlSuppliers.DataTextField = "SupplierName";
                ddlSuppliers.DataValueField = "SupplierID";
                ddlSuppliers.DataBind();

                ddlCategories.DataSource = pcateBLL.GetCateGrandChildByGrandParentsID(int.Parse(ddlSuppliers.SelectedValue));
                ddlCategories.DataTextField = "CateName";
                ddlCategories.DataValueField = "CateID";
                ddlCategories.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    imgPreview.Visible = true;
                    btnUpdate.Visible = true;
                    btnCancel.Visible = true;
                    btnCreate.Visible = false;
                    var obj = prodBLL.GetProductBySerial(int.Parse(Request.QueryString["id"].ToString()));
                    hdSerial.Value = obj.Serial.ToString();
                    txtProductID.Text = obj.ProductID;
                    txtProductName.Text = obj.ProductName;
                    ckeInformation.Text = obj.Information;
                    ckeIntroduction.Text = obj.Introduction;
                    ckeParameters.Text = obj.Parameters;
                    imgPreview.ImageUrl = obj.ImagePath;
                    txtUnitPrice.Text = obj.UnitPrice.ToString();
                    txtQuantity.Text = obj.UnitInStock.ToString();
                    ddlSuppliers.SelectedValue = obj.SupplierID.ToString();
                    ddlStatus.SelectedValue = obj.Status == true ? "1" : "0";
                }
                else
                {
                    imgPreview.Visible = false;
                    btnUpdate.Visible = false;
                    btnCancel.Visible = false;
                    btnCreate.Visible = true;
                }
            }
        }

        protected void ddlSuppliers_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCategories.DataSource = pcateBLL.GetCateGrandChildByGrandParentsID(int.Parse(ddlSuppliers.SelectedValue));
            ddlCategories.DataTextField = "CateName";
            ddlCategories.DataValueField = "CateID";
            ddlCategories.DataBind();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string path = "";
            if (uploadImage.HasFile)
            {
                switch (ddlSuppliers.SelectedValue)
                {
                    case "1":
                        {
                            path = "/upload/images/vantech/" + uploadImage.FileName;
                            break;
                        }
                    case "2":
                        {
                            path = "/upload/images/hikvision/" + uploadImage.FileName;
                            break;
                        }
                    case "3":
                        {
                            path = "/upload/images/sony/" + uploadImage.FileName;
                            break;
                        }
                    case "4":
                        {
                            path = "/upload/images/wd/" + uploadImage.FileName;
                            break;
                        }
                    default:
                        {
                            path = "/upload/images/" + uploadImage.FileName;
                            break;
                        }
                }
                uploadImage.SaveAs(Server.MapPath(path));
            }
            prodBLL.Insert(new Product
            {
                CateID = int.Parse(ddlCategories.SelectedValue),
                SupplierID = int.Parse(ddlSuppliers.SelectedValue),
                ProductID = txtProductID.Text,
                ProductName = txtProductName.Text,
                ImagePath = path,
                Information = ckeInformation.Text,
                Introduction = ckeIntroduction.Text,
                Parameters = ckeParameters.Text,
                UnitPrice = double.Parse(txtUnitPrice.Text),
                UnitInStock = int.Parse(txtQuantity.Text),
                Viewed = 0,
                Bought = 0,
                CreatedDate = DateTime.Now,
                Status = ddlStatus.SelectedValue == "1" ? true : false
            });
            string message = "Thêm sản phẩm thành công!";
            string url = "/AdminCP/ListProducts.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string path = prodBLL.GetProductBySerial(int.Parse(hdSerial.Value)).ImagePath;
            if (uploadImage.HasFile)
            {
                switch (ddlSuppliers.SelectedValue)
                {
                    case "1":
                        {
                            path = "/upload/images/vantech/" + uploadImage.FileName;
                            break;
                        }
                    case "2":
                        {
                            path = "/upload/images/hikvision/" + uploadImage.FileName;
                            break;
                        }
                    case "3":
                        {
                            path = "/upload/images/sony/" + uploadImage.FileName;
                            break;
                        }
                    case "4":
                        {
                            path = "/upload/images/wd/" + uploadImage.FileName;
                            break;
                        }
                    default:
                        {
                            path = "/upload/images/" + uploadImage.FileName;
                            break;
                        }
                }
                uploadImage.SaveAs(Server.MapPath(path));
            }
            prodBLL.Update(new Product
            {
                Serial = int.Parse(hdSerial.Value),
                CateID = int.Parse(ddlCategories.SelectedValue),
                SupplierID = int.Parse(ddlSuppliers.SelectedValue),
                ProductID = txtProductID.Text,
                ProductName = txtProductName.Text,
                ImagePath = path,
                Information = ckeInformation.Text,
                Introduction = ckeIntroduction.Text,
                Parameters = ckeParameters.Text,
                UnitPrice = double.Parse(txtUnitPrice.Text),
                UnitInStock = int.Parse(txtQuantity.Text),
                CreatedDate = DateTime.Now,
                Status = ddlStatus.SelectedValue == "1" ? true : false
            });
            string message = "Cập nhật sản phẩm thành công!";
            string url = "/AdminCP/ListProducts.aspx";
            string script = "$(document).ready(function (e) {";
            script += "    bootbox.alert('" + message + "', function () {";
            script += "        window.location = '" + url + "';";
            script += "    });";
            script += "});";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdminCP/ListProducts.aspx");
        }
    }
}