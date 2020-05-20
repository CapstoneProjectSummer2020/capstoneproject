using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data.Linq.SqlClient;

namespace BLL
{
    public class ProductsBLL
    {
        ModelDataContext db = new ModelDataContext();
        PromotionProductsBLL pprodBLL = new PromotionProductsBLL();
        ProductCategoriesBLL pcateBLL = new ProductCategoriesBLL();

        public void UpdateStockAndBought(int serial, int number)
        {
            var obj = db.Products.SingleOrDefault(p => p.Serial == serial);
            obj.UnitInStock -= number;
            obj.Bought += number;
            db.SubmitChanges();
        }

        public void IncreaseView(int serial)
        {
            var obj = db.Products.SingleOrDefault(p => p.Serial == serial);
            obj.Viewed++;
            db.SubmitChanges();
        }

        public string GetSupplierName(int cateID)
        {
            var obj = db.ProductCategories.SingleOrDefault(p => p.CateID == cateID);
            var parents = db.ProductCategories.SingleOrDefault(p => p.CateID == obj.CateParentsID);
            return db.ProductCategories.SingleOrDefault(p => p.CateID == parents.CateParentsID).CateName;
        }

        public List<Product> GetTopNewProduct(int takeNumber)
        {
            return db.Products.OrderByDescending(p => p.Serial).Take(takeNumber).ToList();
        }

        public List<Product> GetTopHotProduct(int takeNumber)
        {
            return db.Products.OrderByDescending(p => p.Viewed).Take(takeNumber).ToList();
        }

        public List<Product> GetTopPromotionProduct(int takeNumber)
        {
            var obj = pprodBLL.GetTopPromotionProduct(takeNumber);
            return db.Products.Where(p => obj.Contains(p.Serial)).ToList();
        }

        public List<Product> GetProductsByCateID(int id)
        {
            return db.Products.Where(p => p.CateID == id).OrderByDescending(p => p.ProductID).ToList();
        }

        public Product GetProductBySerial(int serial)
        {
            var obj = db.Products.SingleOrDefault(p => p.Serial == serial);
            return obj;
        }

        public List<Product> SearchProductBySerial(int serial)
        {
            var obj = db.Products.Where(p => p.Serial == serial).ToList();
            return obj;
        }

        public List<Product> GetAllProducts()
        {
            return db.Products.OrderByDescending(p => p.CreatedDate).ToList();
        }

        public List<Product> GetAvailableProducts()
        {
            return db.Products.Where(p => p.Status == true).ToList();
        }

        public List<Product> Search(List<string> keywords, bool replace)
        {
            List<Product> result = new List<Product>();
            foreach (string keyword in keywords)
            {
                var cateList = db.Products.Join(db.ProductCategories, p => p.CateID, c => c.CateID,
                   (p, c) => new { p, c }).Where(o => o.c.CateName.Contains(keyword)).Select(o => o.p.ProductID);
                var supList = db.Products.Join(db.Suppliers, p => p.SupplierID, s => s.SupplierID,
                       (p, s) => new { p, s }).Where(o => o.s.SupplierName.Contains(keyword)).Select(o => o.p.ProductID);
                foreach (Product n in db.Products.Where(p => cateList.Contains(p.ProductID) || supList.Contains(p.ProductID) ||
                    p.Information.Contains(keyword) || p.UnitPrice.ToString().Contains(keyword) || p.ProductName.Contains(keyword)).ToList())
                {
                    result.Add(n);
                }
            }
            if (replace)
            {
                foreach (string keyItems in keywords)
                {
                    foreach (Product items in result)
                    {
                        if (items.Information != null)
                        {
                            items.Information = items.Information.Replace(keyItems, "<span class=\"keyHightLight\">" + keyItems + "</span>");
                            if (items.ProductName.ToLower().IndexOf(keyItems.ToLower()) > 0)
                            {
                                items.ProductName = items.ProductName.Replace(items.ProductName.Substring(items.ProductName.ToLower().
                                    IndexOf(keyItems.ToLower()), keyItems.Trim().Length), "<span class=\"keyHightLight\">" +
                                    items.ProductName.Substring(items.ProductName.ToLower().
                                    IndexOf(keyItems.ToLower()), keyItems.Trim().Length) + "</span>");
                            }
                        }
                    }
                }
            }
            return result;
        }

        public bool isNew(int serial)
        {
            var obj = db.Products.SingleOrDefault(p => p.Serial == serial);
            if (SqlMethods.DateDiffDay(obj.CreatedDate, DateTime.Now) <= 7) return true;
            return false;
        }

        public void Delete(int serial)
        {
            var obj = db.Products.SingleOrDefault(p => p.Serial == serial);
            db.Products.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public void Insert(Product p)
        {
            db.Products.InsertOnSubmit(p);
            db.SubmitChanges();
        }

        public void Update(Product pr)
        {
            var obj = db.Products.SingleOrDefault(p => p.Serial == pr.Serial);
            obj.CateID = pr.CateID;
            obj.SupplierID = pr.SupplierID;
            obj.ProductID = pr.ProductID;
            obj.ProductName = pr.ProductName;
            obj.ImagePath = pr.ImagePath;
            obj.Information = pr.Information;
            obj.UnitPrice = pr.UnitPrice;
            obj.UnitInStock = pr.UnitInStock;
            obj.Status = pr.Status;
            db.SubmitChanges();
        }

        public List<Product> GetProductsByParentsCateID(int parentsID)
        {
            var obj = pcateBLL.GetCateChildByParentsID(parentsID).Select(p => p.CateID);
            return db.Products.Where(p => obj.Contains(p.CateID.Value)).Take(16).ToList();
        }

        public List<Product> GetProductsByGrandParentsCateID(int grandParentsID)
        {
            List<int> parents = db.ProductCategories.Where(p => p.CateParentsID == grandParentsID).Select(p => p.CateID).ToList();
            List<int> childs = db.ProductCategories.Where(p => parents.Contains(p.CateParentsID.Value)).Select(p => p.CateID).ToList();
            return db.Products.Where(p => childs.Contains(p.CateID.Value)).ToList();
        }

        public List<Product> GetAllPromotionProducts()
        {
            var obj = pprodBLL.GetAvailablePromotionProducts().Select(a => a.ProductID);
            return db.Products.Where(p => obj.Contains(p.Serial)).ToList();
        }
    }
}
