using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class NewslettersCateBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<NewsletterCategory> GetAllNewsCate()
        {
            return db.NewsletterCategories.Where(n => n.Status == true).ToList();
        }

        public NewsletterCategory GetCateInfo(int cid)
        {
            return db.NewsletterCategories.SingleOrDefault(n => n.CateID == cid);
        }

        public List<NewsletterCategory> GetAvailableNewsCate()
        {
            return db.NewsletterCategories.Where(n => n.Status == true).ToList();
        }
    }
}
