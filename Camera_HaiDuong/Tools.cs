using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Camera_HaiDuong
{
    public static class Tools
    {
        public static string convertToUnSign(string unicode)
        {
            unicode = Regex.Replace(unicode, "[áàảãạăắằẳẵặâấầẩẫậ]", "a");
            unicode = Regex.Replace(unicode, "[óòỏõọôồốổỗộơớờởỡợ]", "o");
            unicode = Regex.Replace(unicode, "[éèẻẽẹêếềểễệ]", "e");
            unicode = Regex.Replace(unicode, "[íìỉĩị]", "i");
            unicode = Regex.Replace(unicode, "[úùủũụưứừửữự]", "u");
            unicode = Regex.Replace(unicode, "[ýỳỷỹỵ]", "y");
            unicode = Regex.Replace(unicode, "[đ]", "d");
            unicode = Regex.Replace(unicode, "\\W+", "-");
            return unicode;
        }

        public static List<string> HandleInput(string keyword)
        {
            string[] keywords = keyword.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
            List<string> result = new List<string>();
            for (int i = 0; i < keywords.Length; i++)
                result.Add(keywords[i]);
            return result;
        }

        public static string SendMail(string send, string pass, string to, string subject, int port, string host,
            string orderName, DateTime orderTime, string orderEmail, string orderPhone, string orderAddress, string orderP, string orderD,
            string shipName, string shipEmail, string shipPhone, string shipAddress, string shipP, string shipD, List<OrdersDetail> list)
        {
            SmtpClient client = new SmtpClient();
            client.EnableSsl = true;
            client.Port = port;
            client.Host = host;
            client.Credentials = new NetworkCredential(send, pass);
            MailAddress from = new MailAddress(send, subject);
            MailAddress toAddress = new MailAddress(to);
            MailMessage message = new MailMessage(from, toAddress);
            message.IsBodyHtml = true;
            message.BodyEncoding = Encoding.UTF8;
            message.Body += "<h1 style='display:inline-block; text-align:center; width: 1000px; margin:0 auto'>ĐƠN ĐẶT HÀNG</h1><br /><br />";
            message.Body += "<div style='width: 1000px; text-align: justify'>";
            message.Body += "Xin chào, " + orderName + "<br /><br />";
            message.Body += "Email của bạn vừa thực hiện đặt hàng tại website của Công ty Cổ phần Thương mại và Dịch vụ Hưng Phát vào lúc <strong>" + orderTime + "</strong>. Chi tiết đơn hàng như sau:";
            message.Body += "</div>";
            message.Body += "<div style='width: 480px; padding: 10px; line-height: 1.5em; float: left'>";
            message.Body += "    <h3>THÔNG TIN THANH TOÁN</h3>";
            message.Body += "    <hr />";
            message.Body += "    Họ tên: <strong>" + orderName + "</strong><br />";
            message.Body += "    Email: <strong>" + orderEmail + "</strong><br />";
            message.Body += "    Số điện thoại: <strong>" + orderPhone + "</strong><br />";
            message.Body += "    Địa chỉ: <strong>" + orderAddress + "</strong><br />";
            message.Body += "    Tỉnh/Thành: <strong>" + orderP + "</strong><br />";
            message.Body += "    Quận/Huyện: <strong>" + orderD + "</strong><br />";
            message.Body += "</div>";
            message.Body += "<div style='width: 480px; padding: 10px; line-height: 1.5em; float: left'>";
            message.Body += "    <h3>THÔNG TIN GIAO HÀNG</h3>";
            message.Body += "    <hr />";
            message.Body += "    Họ tên: <strong>" + shipName + "</strong><br />";
            message.Body += "    Email: <strong>" + shipEmail + "</strong><br />";
            message.Body += "    Số điện thoại: <strong>" + shipPhone + "</strong><br />";
            message.Body += "    Địa chỉ: <strong>" + shipAddress + "</strong><br />";
            message.Body += "    Tỉnh/Thành: <strong>" + shipP + "</strong><br />";
            message.Body += "    Quận/Huyện: <strong>" + shipD + "</strong><br />";
            message.Body += "</div>";
            message.Body += "<table style='width: 1000px; overflow: scroll' cellspacing='0' border='1' cellpadding='0'>";
            message.Body += "    <thead>";
            message.Body += "        <tr>";
            message.Body += "            <th style='width: 50%' colspan='2'>Sản phẩm</th>";
            message.Body += "            <th style='width: 15%'>Đơn giá (VNĐ)</th>";
            message.Body += "            <th style='width: 10%'>Số lượng</th>";
            message.Body += "            <th style='width: 10%'>Giảm giá (%)</th>";
            message.Body += "            <th style='width: 15%'>Thành tiền (VNĐ)</th>";
            message.Body += "        </tr>";
            message.Body += "    </thead>";
            message.Body += "    <tbody>";
            foreach (OrdersDetail item in list)
            {
                message.Body += "<tr>";
                message.Body += "    <td style='padding: 5px;'>";
                message.Body += "        <img style='max-width: 100px; max-height: 100px' src='" + item.Product.ImagePath + "' alt='" + item.Product.ProductName + "' />";
                message.Body += "    </td>";
                message.Body += "    <td style='font-size: 15px; font-weight: 700; padding: 5px'>";
                message.Body += item.Product.ProductName;
                message.Body += "    </td>";
                message.Body += "    <td style='padding: 5px; text-align: center'>" + item.Product.UnitPrice.Value.ToString("#,###,###,###").Replace(',', '.') + "</td>";
                message.Body += "    <td style='padding: 5px; text-align: center'>" + item.Quantity + "</td>";
                message.Body += "    <td style='padding: 5px; text-align: center'>" + item.Discount + "</td>";
                message.Body += "    <td style='padding: 5px; text-align: center'>" + item.Amount.Value.ToString("#,###,###,###").Replace(',', '.') + "</td>";
                message.Body += "</tr>";
            }
            message.Body += "    </tbody>";
            message.Body += "</table>";
            message.Body += "<div style='width: 1000px; padding: 10px; text-align: right'>";
            message.Body += "    <h3>Tổng hóa đơn: <strong><span style='color: red; font-size: 40px;'>" + list.Sum(i => i.Amount).Value.ToString("#,###,###,###").Replace(',', '.') + "</span> VNĐ</strong></h3>";
            message.Body += "    <hr />";
            message.Body += "    HƯNG PHÁT CO.";
            message.Body += "</div>";
            message.Subject = subject;
            try
            {
                client.Send(message);
                return "Send mail sucessfully!!!";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public static string CutString(string str)
        {
            string s = str.Trim();
            while (s.IndexOf("  ") >= 0) s = s.Remove(s.IndexOf("  "), 1);
            return s;
        }
        public static string Standardized(string str)
        {
            string result = "";
            if (str == "") return result;
            else
            {
                string s = CutString(str);
                string[] a = s.Split(' ');
                for (int i = 0; i < a.Length; i++)
                    result = result + " " + char.ToUpper(a[i][0]) + a[i].Substring(1).ToLower();
                return result.Trim();
            }
        }
    }
}