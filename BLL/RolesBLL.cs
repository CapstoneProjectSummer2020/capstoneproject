using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class RolesBLL
    {
        ModelDataContext db = new ModelDataContext();

        public Role GetRoleByID(int id)
        {
            return db.Roles.SingleOrDefault(r => r.RoleID == id);
        }

        public List<Role> GetAvailableRoles()
        {
            return db.Roles.Where(r => r.Status == true).ToList();
        }
    }
}
