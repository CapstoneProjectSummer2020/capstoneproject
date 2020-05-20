using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class ProductCategoriesBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<ProductCategory> GetAllCateParents()
        {
            return db.ProductCategories.Where(p => p.CateParentsID == null).ToList();
        }

        public List<ProductCategory> GetCateChildByParentsID(int parentsID)
        {
            return db.ProductCategories.Where(p => p.CateParentsID == parentsID).ToList();
        }

        public ProductCategory GetCateInfoByCateID(int cateID)
        {
            return db.ProductCategories.SingleOrDefault(p => p.CateID == cateID);
        }

        public List<ProductCategory> GetCateGrandChildByGrandParentsID(int grandParentsID)
        {
            var parents = db.ProductCategories.Where(p => p.CateParentsID == grandParentsID).ToList();
            return db.ProductCategories.Where(p => parents.Select(pr => pr.CateID).Contains(p.CateParentsID.Value)).ToList();
        }

        public int[] GetFullParents(int cateID)
        {
            int[] result = new int[3];
            var obj = db.ProductCategories.SingleOrDefault(p => p.CateID == cateID);
            var parents = db.ProductCategories.SingleOrDefault(p => p.CateID == obj.CateParentsID);
            result[0] = obj.CateID;
            if (parents != null)
            {
                result[1] = parents.CateID;
                var grandparents = db.ProductCategories.SingleOrDefault(p => p.CateID == parents.CateParentsID);
                if (grandparents != null) result[2] = grandparents.CateID;
            }
            return result;
        }

        public bool isGrandParentsCate(int cateID)
        {
            var obj = db.ProductCategories.SingleOrDefault(p => p.CateID == cateID);
            if (obj.CateParentsID == null) return true;
            return false;
        }

        public bool isParentsCate(int cateID)
        {
            var obj = db.ProductCategories.SingleOrDefault(p => p.CateID == cateID);
            var parents = db.ProductCategories.SingleOrDefault(p => p.CateID == obj.CateParentsID);
            if (parents.CateParentsID == null) return true;
            return false;
        }

        public bool isChildsCate(int cateID)
        {
            try
            {
                var obj = db.ProductCategories.SingleOrDefault(p => p.CateID == cateID);
                var parents = db.ProductCategories.SingleOrDefault(p => p.CateID == obj.CateParentsID);
                var grandparents = db.ProductCategories.SingleOrDefault(p => p.CateID == parents.CateParentsID);
                if (grandparents.CateParentsID == null) return true;
                return false;
            }
            catch
            {
                return false;
            }
        }

        public List<ProductCategory> GetBrothersCate(int cateID)
        {
            var temp = db.ProductCategories.SingleOrDefault(p => p.CateID == cateID);
            return db.ProductCategories.Where(p => p.CateParentsID == temp.CateParentsID && p.CateID != cateID).ToList();
        }

        public List<ProductCategory> GetAllCate()
        {
            return db.ProductCategories.ToList();
        }

        public void Delete(int id)
        {
            if (isGrandParentsCate(id))
            {
                var parents = GetCateChildByParentsID(id);
                foreach (var item in parents)
                {
                    var childs = GetCateChildByParentsID(item.CateID);
                    foreach (var child in childs)
                    {
                        var obj = db.ProductCategories.SingleOrDefault(p => p.CateID == child.CateID);
                        db.ProductCategories.DeleteOnSubmit(obj);
                        db.SubmitChanges();
                    }
                    db.ProductCategories.DeleteOnSubmit(db.ProductCategories.SingleOrDefault(p => p.CateID == item.CateID));
                    db.SubmitChanges();
                }
                db.ProductCategories.DeleteOnSubmit(db.ProductCategories.SingleOrDefault(p => p.CateID == id));
                db.SubmitChanges();
            }
            else if (isParentsCate(id))
            {
                var childs = GetCateChildByParentsID(id);
                foreach (var child in childs)
                {
                    var obj = db.ProductCategories.SingleOrDefault(p => p.CateID == child.CateID);
                    db.ProductCategories.DeleteOnSubmit(obj);
                    db.SubmitChanges();
                }
                db.ProductCategories.DeleteOnSubmit(db.ProductCategories.SingleOrDefault(p => p.CateID == id));
                db.SubmitChanges();
            }
            else
            {
                db.ProductCategories.DeleteOnSubmit(db.ProductCategories.SingleOrDefault(p => p.CateID == id));
                db.SubmitChanges();
            }
        }

        public List<ProductCategory> GetAvailableCate()
        {
            return db.ProductCategories.Where(p => p.Status == true).ToList();
        }

        public void Insert(ProductCategory p)
        {
            db.ProductCategories.InsertOnSubmit(p);
            db.SubmitChanges();
        }

        public void Update(ProductCategory pc)
        {
            var obj = db.ProductCategories.SingleOrDefault(p => p.CateID == pc.CateID);
            obj.CateParentsID = pc.CateParentsID;
            obj.CateName = pc.CateName;
            obj.Status = pc.Status;
            db.SubmitChanges();
        }
    }
}
