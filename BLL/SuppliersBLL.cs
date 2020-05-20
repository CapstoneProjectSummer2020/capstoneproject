using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class SuppliersBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<Supplier> GetAllSuppliers()
        {
            return db.Suppliers.ToList();
        }

        public List<Supplier> GetAvailableSuppliers()
        {
            return db.Suppliers.Where(s => s.Status == true).ToList();
        }

        public Supplier GetSupplierBySupplerID(int supplierId)
        {
            return db.Suppliers.SingleOrDefault(s => s.SupplierID == supplierId);
        }

    }
}
