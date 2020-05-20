using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class SupportsBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<Support> GetOnlineSupport()
        {
            return db.Supports.Where(s => s.Type == "Hỗ trợ trực tuyến").ToList();
        }

        public List<Support> GetOnlineSupportTech()
        {
            return db.Supports.Where(s => s.Type == "Hỗ trợ kỹ thuật").ToList();
        }

        public List<Support> GetAllSupport()
        {
            return db.Supports.ToList();
        }

        public void Insert(Support s)
        {
            db.Supports.InsertOnSubmit(s);
            db.SubmitChanges();
        }

        public void Update(Support s)
        {
            var sp = db.Supports.SingleOrDefault(o => o.ID == s.ID);
            sp.Type = s.Type;
            sp.Name = s.Type;
            sp.SkypeNumber = s.SkypeNumber;
            sp.SkypeUrl = s.SkypeUrl;
            sp.AvatarPath = s.AvatarPath;
            db.SubmitChanges();
        }

        public void Delete(int id)
        {
            var obj = db.Supports.SingleOrDefault(o => o.ID == id);
            db.Supports.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }
    }
}
