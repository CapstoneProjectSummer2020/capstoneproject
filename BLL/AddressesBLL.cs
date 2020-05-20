using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class AddressesBLL
    {
        ModelDataContext db = new ModelDataContext();
        public List<Address> GetAvailableProvince()
        {
            return db.Addresses.Where(a => a.ParentsID == null && a.Status == true).ToList();
        }

        public List<Address> GetAllProvince()
        {
            return db.Addresses.Where(a => a.ParentsID == null).ToList();
        }

        public List<Address> GetDistrict(int provinceId)
        {
            return db.Addresses.Where(a => a.ParentsID == provinceId && a.Status == true).ToList();
        }

        public Address GetProvinceById(int parentsId)
        {
            return db.Addresses.SingleOrDefault(a => a.ID == parentsId);
        }

        public List<Address> GetAllAddresses()
        {
            return db.Addresses.ToList();
        }

        public bool isProvince(int id)
        {
            var obj = db.Addresses.SingleOrDefault(a => a.ID == id);
            if (obj.ParentsID == null) return true;
            return false;
        }

        public void Delete(int id)
        {
            var obj = db.Addresses.SingleOrDefault(a => a.ID == id);
            db.Addresses.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public void UpdateStatus(int id)
        {
            var obj = db.Addresses.SingleOrDefault(a => a.ID == id);
            obj.Status = !obj.Status;
            db.SubmitChanges();
        }
    }
}
