using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class BannersBLL
    {
        ModelDataContext db = new ModelDataContext();

        public Banner RandomTopBanner()
        {
            Random rd = new Random();
            var obj = db.Banners.Where(b => b.Type == 1 && b.Status == true).ToList();
            return obj[rd.Next(0, obj.Count)];
        }

        public List<Banner> GetInsideBanner()
        {
            return db.Banners.Where(b => b.Type == 2).ToList();
        }

        public Banner RandomInsideBanner()
        {
            Random rd = new Random();
            var obj = db.Banners.Where(b => b.Type == 2 && b.Status == true).ToList();
            return obj[rd.Next(0, obj.Count)];
        }

        public Banner GetBannerByID(int bid)
        {
            return db.Banners.SingleOrDefault(b => b.ID == bid);
        }

        public List<Banner> GetAllBanners()
        {
            return db.Banners.OrderByDescending(b => b.ID).ToList();
        }

        public void UpdateStatus(int bid)
        {
            var obj = db.Banners.SingleOrDefault(b => b.ID == bid);
            obj.Status = !obj.Status;
            db.SubmitChanges();
        }

        public void Insert(Banner b)
        {
            db.Banners.InsertOnSubmit(b);
            db.SubmitChanges();
        }

        public void Update(Banner bn)
        {
            var obj = db.Banners.SingleOrDefault(b => b.ID == bn.ID);
            obj.BannerPath = bn.BannerPath;
            obj.Status = bn.Status;
            obj.Url = bn.Url;
            obj.Type = bn.Type;
            db.SubmitChanges();
        }

        public void Delete(int bid)
        {
            var obj = db.Banners.SingleOrDefault(b => b.ID == bid);
            db.Banners.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }
    }
}
