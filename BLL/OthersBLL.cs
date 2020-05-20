using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class OthersBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<Other> GetAllPage()
        {
            return db.Others.OrderByDescending(o => o.ID).ToList();
        }

        public Other GetPage(int pid)
        {
            return db.Others.SingleOrDefault(o => o.ID == pid);
        }

        public string GetParentsName(int parentsId)
        {
            return db.Others.SingleOrDefault(p => p.ID == parentsId).Name;
        }

        public List<Other> GetCateParents()
        {
            return db.Others.Where(o => o.ParentsID == 0 && o.Name.Trim() != "Giới thiệu" && o.Name.Trim() != "Liên hệ").ToList();
        }

        public List<Other> GetPagesByParentsID(int id)
        {
            return db.Others.Where(o => o.ParentsID == id).ToList();
        }

        public void Update(Other o)
        {
            var obj = db.Others.SingleOrDefault(ob => ob.ID == o.ID);
            obj.Name = o.Name;
            obj.Content = o.Content;
            obj.ParentsID = o.ParentsID;
            db.SubmitChanges();
        }

        public void Insert(Other o)
        {
            db.Others.InsertOnSubmit(o);
            db.SubmitChanges();
        }

        public void DeletePage(int pid)
        {
            var obj = db.Others.SingleOrDefault(o => o.ID == pid);
            db.Others.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }
    }
}
