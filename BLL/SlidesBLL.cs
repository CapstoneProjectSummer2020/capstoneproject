using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class SlidesBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<Slideshow> GetAllSlides()
        {
            return db.Slideshows.OrderByDescending(s => s.ID).ToList();
        }

        public List<Slideshow> GetAvailableSlides()
        {
            return db.Slideshows.Where(s => s.Status == true).OrderByDescending(s => s.ID).ToList();
        }

        public void UpdateStatus(int sid)
        {
            var obj = db.Slideshows.SingleOrDefault(s => s.ID == sid);
            obj.Status = !obj.Status;
            db.SubmitChanges();
        }

        public void DeleteSlide(int id)
        {
            var obj = db.Slideshows.SingleOrDefault(s => s.ID == id);
            db.Slideshows.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public Slideshow GetSlideInfo(int sid)
        {
            return db.Slideshows.SingleOrDefault(s => s.ID == sid);
        }

        public void Insert(Slideshow s)
        {
            db.Slideshows.InsertOnSubmit(s);
            db.SubmitChanges();
        }

        public void Update(Slideshow s)
        {
            var slide = db.Slideshows.SingleOrDefault(ss => ss.ID == s.ID);
            slide.ImagePath = s.ImagePath;
            slide.ThumbnailPath = s.ThumbnailPath;
            slide.Link = s.Link;
            slide.Status = s.Status;
            db.SubmitChanges();
        }
    }
}
