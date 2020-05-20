using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data.Linq.SqlClient;

namespace BLL
{
    public class PromotionProductsBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<int?> GetTopPromotionProduct(int takeNumber)
        {
            return db.PromotionProducts.Where(pp => SqlMethods.DateDiffDay(pp.BeginDate, DateTime.Now) >= 0 &&
                SqlMethods.DateDiffDay(DateTime.Now, pp.EndDate) >= 0).OrderByDescending(p => p.Discount).Take(takeNumber).Select(p => p.ProductID).ToList();
        }

        public double? GetDiscount(int productID)
        {
            var obj = db.PromotionProducts.Where(pp => SqlMethods.DateDiffDay(pp.BeginDate, DateTime.Now) >= 0 &&
                SqlMethods.DateDiffDay(DateTime.Now, pp.EndDate) >= 0 && pp.ProductID == productID).OrderByDescending(p => p.Discount);
            if (obj.Count() > 0) return obj.First().Discount;
            else return null;
        }

        public List<PromotionProduct> GetAvailablePromotionProducts()
        {
            return db.PromotionProducts.Where(pp => SqlMethods.DateDiffDay(pp.BeginDate, DateTime.Now) >= 0 &&
                SqlMethods.DateDiffDay(DateTime.Now, pp.EndDate) >= 0).OrderByDescending(p => p.Discount).ToList();
        }

        public void Insert(PromotionProduct pp)
        {
            db.PromotionProducts.InsertOnSubmit(pp);
            db.SubmitChanges();
        }

        public List<PromotionProduct> GetAllPromotionProducts()
        {
            return db.PromotionProducts.ToList();
        }

        public void Delete(int id)
        {
            var obj = db.PromotionProducts.SingleOrDefault(pp => pp.ID == id);
            db.PromotionProducts.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public PromotionProduct GetPromotionByID(int id)
        {
            return db.PromotionProducts.SingleOrDefault(pp => pp.ID == id);
        }

        public void Update(PromotionProduct p)
        {
            var obj = db.PromotionProducts.SingleOrDefault(pp => pp.ID == p.ID);
            obj.BeginDate = p.BeginDate;
            obj.Discount = p.Discount;
            obj.EndDate = p.EndDate;
            db.SubmitChanges();
        }
    }
}
