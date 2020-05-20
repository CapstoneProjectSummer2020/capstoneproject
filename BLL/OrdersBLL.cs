using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;
using System.Transactions;

namespace BLL
{
    public class OrdersBLL
    {
        ModelDataContext db = new ModelDataContext();

        public void InsertOrder(string shipName, string shipEmail, string shipPhone, string shipAddress, string shipProvince, string shipDistrict, List<OrdersDetail> orderDetails)
        {
            using (var transaction = new TransactionScope())
            {
                Order ord = new Order();
                ord.OrderName = shipName;
                ord.OrderEmail = shipEmail;
                ord.OrderPhone = shipPhone;
                ord.OrderAddress = shipAddress;
                ord.OrderProvince = shipProvince;
                ord.OrderDistinct = shipDistrict;
                ord.ShipName = shipName;
                ord.ShipEmail = shipEmail;
                ord.ShipPhone = shipPhone;
                ord.ShipAddress = shipAddress;
                ord.ShipProvince = shipProvince;
                ord.ShipDisctrict = shipDistrict;
                ord.OrderDate = DateTime.Now;
                ord.Status = 0;
                double sum = 0;
                foreach (var item in orderDetails)
                {
                    sum += (double)item.Amount;
                }
                ord.TotalAmount = sum;
                db.Orders.InsertOnSubmit(ord);

                foreach (var item in orderDetails)
                {
                    ord.OrdersDetails.Add(item);
                    var prod = db.Products.SingleOrDefault(p => p.Serial == item.ProductID);
                    prod.UnitOnOrder += item.Quantity;
                    db.SubmitChanges();
                }

                db.SubmitChanges();

                transaction.Complete();
            }
        }
        public void InsertOrder(string orderName, string orderEmail, string orderPhone, string orderAddress, string orderProvince, string orderDistrict, string shipName, string shipEmail, string shipPhone, string shipAddress, string shipProvince, string shipDistrict, List<OrdersDetail> orderDetails)
        {
            using (var transaction = new TransactionScope())
            {
                Order ord = new Order();
                ord.OrderName = orderName;
                ord.OrderEmail = orderEmail;
                ord.OrderPhone = orderPhone;
                ord.OrderAddress = orderAddress;
                ord.OrderProvince = orderProvince;
                ord.OrderDistinct = orderDistrict;
                ord.ShipName = shipName;
                ord.ShipEmail = shipEmail;
                ord.ShipPhone = shipPhone;
                ord.ShipAddress = shipAddress;
                ord.ShipProvince = shipProvince;
                ord.ShipDisctrict = shipDistrict;
                ord.OrderDate = DateTime.Now;
                ord.Status = 0;

                double sum = 0;
                foreach (var item in orderDetails)
                {
                    sum += (double)item.Amount;
                }
                ord.TotalAmount = sum;

                db.Orders.InsertOnSubmit(ord);

                foreach (var item in orderDetails)
                {
                    ord.OrdersDetails.Add(item);
                    var prod = db.Products.SingleOrDefault(p => p.Serial == item.ProductID);
                    prod.UnitOnOrder += item.Quantity;
                    db.SubmitChanges();
                }

                db.SubmitChanges();

                transaction.Complete();
            }
        }

        public List<Order> GetAllOrders()
        {
            return db.Orders.ToList();
        }

        public void Delete(int id)
        {
            var details = db.OrdersDetails.Where(od => od.OrderID == id);
            foreach (var item in details)
            {
                db.OrdersDetails.DeleteOnSubmit(item);
                db.SubmitChanges();
            }
            db.Orders.DeleteOnSubmit(db.Orders.SingleOrDefault(o => o.OrderID == id));
            db.SubmitChanges();
        }

        public void UpdateStatus(int id, int uid)
        {
            var obj = db.Orders.SingleOrDefault(a => a.OrderID == id);
            obj.EmployeeID = uid;
            obj.Status++;
            if (obj.Status == 3) return;
            else if (obj.Status == 2)
            {
                obj.ShipDate = DateTime.Now;
                foreach (var item in obj.OrdersDetails)
                {
                    var prod = db.Products.SingleOrDefault(p => p.Serial == item.ProductID);
                    prod.UnitOnOrder -= item.Quantity;
                    prod.UnitInStock -= item.Quantity;
                    prod.Bought += item.Quantity;
                    db.SubmitChanges();
                }
            }
            db.SubmitChanges();
        }

        public List<OrdersDetail> GetOrderDetail(int oid)
        {
            return db.OrdersDetails.Where(o => o.OrderID == oid).ToList();
        }

        public Order GetOrderInfo(int oid)
        {
            return db.Orders.SingleOrDefault(o => o.OrderID == oid);
        }
    }
}
