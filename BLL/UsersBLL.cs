using System;
using System.Collections.Generic;
using System.Linq;
using DAL;

namespace BLL
{
    public class UsersBLL
    {
        ModelDataContext db = new ModelDataContext();
        public byte[] encryptData(string data)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] hashedBytes;
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
            return hashedBytes;
        }
        public string md5(string data)
        {
            return BitConverter.ToString(encryptData(data)).Replace("-", "").ToLower();
        }

        public User GetUserByUsername(string username)
        {
            return db.Users.SingleOrDefault(u => u.Username == username);
        }

        public User GetUserByLogin(string username, string password)
        {
            return db.Users.SingleOrDefault(u => u.Username == username && u.Password == md5(password) && u.Status == true);
        }

        public List<User> GetAllUsers()
        {
            return db.Users.ToList();
        }

        public void Insert(User u)
        {
            db.Users.InsertOnSubmit(u);
            db.SubmitChanges();
        }

        public void Update(User u)
        {
            var obj = db.Users.SingleOrDefault(uu => uu.UserID == u.UserID);
            obj.RoleID = u.RoleID;
            obj.FullName = u.FullName;
            obj.Username = u.Username;
            obj.Password = u.Password;
            obj.Address = u.Address;
            obj.Phone = u.Phone;
            obj.Status = u.Status;
            db.SubmitChanges();
        }

        public void ChangeStatus(int id)
        {
            var obj = db.Users.SingleOrDefault(uu => uu.UserID == id);
            obj.Status = !obj.Status;
            db.SubmitChanges();
        }

        public User GetUserById(int id)
        {
            return db.Users.SingleOrDefault(uu => uu.UserID == id);
        }
    }
}
