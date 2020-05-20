using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class NewslettersBLL
    {
        ModelDataContext db = new ModelDataContext();
        public List<Newsletter> GetTopNew(int takeNumber)
        {
            return db.Newsletters.Where(n => n.Status == true).OrderByDescending(n => n.CreatedDate).Take(takeNumber).ToList();
        }
        public List<Newsletter> GetTopHot(int takeNumber)
        {
            return db.Newsletters.Where(n => n.Status == true).OrderByDescending(n => n.Viewed).Take(takeNumber).ToList();
        }
        public List<Newsletter> GetAllNews()
        {
            return db.Newsletters.OrderByDescending(n => n.CreatedDate).ToList();
        }

        public Newsletter GetNewsDetail(int nid)
        {
            return db.Newsletters.SingleOrDefault(n => n.NewsID == nid);
        }

        public List<Newsletter> GetTopNewsByCateID(int cid, int takeNumber)
        {
            return db.Newsletters.Where(n => n.CateID == cid && n.Status == true).OrderByDescending(n => n.NewsID).Take(takeNumber).ToList();
        }

        public List<Newsletter> GetNewsByCateID(int cid)
        {
            return db.Newsletters.Where(n => n.CateID == cid).OrderByDescending(n => n.NewsID).ToList();
        }

        public void Delete(int nid)
        {
            var obj = db.Newsletters.SingleOrDefault(n => n.NewsID == nid);
            db.Newsletters.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public void Insert(Newsletter n)
        {
            db.Newsletters.InsertOnSubmit(n);
            db.SubmitChanges();
        }

        public void Update(Newsletter n)
        {
            var obj = db.Newsletters.SingleOrDefault(nn => nn.NewsID == n.NewsID);
            obj.Title = n.Title;
            obj.CateID = n.CateID;
            obj.Subtitle = n.Subtitle;
            obj.ImagePath = n.ImagePath;
            obj.Content = n.Content;
            obj.Status = n.Status;
            db.SubmitChanges();
        }

        public void IncreaseView(int nid)
        {
            var obj = db.Newsletters.SingleOrDefault(n => n.NewsID == nid);
            obj.Viewed++;
            db.SubmitChanges();
        }
    }
}
