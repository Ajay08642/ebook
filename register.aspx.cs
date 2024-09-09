//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data;
//using System.Data.SqlClient;
//using System.Runtime.Remoting.Messaging;

//namespace Loginform
//{
//    public partial class register : System.Web.UI.Page
//    {
//        string cs = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            checkemail();
//        }

//        protected void Button1_Click(object sender, EventArgs e)
//        {
//            if (checkemail() == true)
//            {
//                Label1.Text = "your Email already Registered with us";
//            }
//            else
//            {
//                SqlConnection con = new SqlConnection(cs);
//                string query = "insert into Registers(firstname,lastname,emailid,gender,address,phone,password,confirmpass,userType) values(@firstname,@lastname,@emailid,@gender,@address,@phone,@password,@confirmpass,@userType)";
//                SqlCommand cmd = new SqlCommand(query, con);


//                cmd.Parameters.AddWithValue("@firstname", txtfirst.Text);
//                cmd.Parameters.AddWithValue("@lastname", txtlast.Text);
//                cmd.Parameters.AddWithValue("@emailid", txtemail.Text);
//                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
//                cmd.Parameters.AddWithValue("@address", txtadd.Text);
//                cmd.Parameters.AddWithValue("@phone", txtphone.Text);
//                cmd.Parameters.AddWithValue("@password", txtpass.Text);
//                cmd.Parameters.AddWithValue("@confirmpass", txtrepass.Text);
//                cmd.Parameters.AddWithValue("@userType", DropDownList2.SelectedItem.Value);

//                con.Open();
//                cmd.ExecuteNonQuery();
//                Label1.Text = "Registerd data sucessfully";
//                con.Close();
//        }
//    }

//        private Boolean checkemail()
//        {
//            Boolean emailavilable = false;
//            string cs = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
//            SqlConnection con = new SqlConnection(cs);
//            string query = "select * from Registers where emailid =@emailid";
//            SqlCommand cmd = new SqlCommand(query, con);
//            cmd.Parameters.AddWithValue("@emailid", txtemail.Text);
//            con.Open();
//            SqlDataAdapter da = new SqlDataAdapter();
//            da.SelectCommand = cmd;
//            DataSet ds = new DataSet();
//            da.Fill(ds);
//            if (ds.Tables[0].Rows.Count > 0)
//            {
//                emailavilable = true;
//            }
//            con.Close();
//            ReturnMessage emailavailable;
//        }
//    } 
//}

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Loginform
{
    public partial class register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // You don't need to call checkemail() on Page_Load
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!checkemail())
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "INSERT INTO Registers(firstname, lastname, emailid, gender, address, phone, password, confirmpass, userType) " +
                                   "VALUES(@firstname, @lastname, @emailid, @gender, @address, @phone, @password, @confirmpass, @userType)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@firstname", txtfirst.Text);
                        cmd.Parameters.AddWithValue("@lastname", txtlast.Text);
                        cmd.Parameters.AddWithValue("@emailid", txtemail.Text);
                        cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@address", txtadd.Text);
                        cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                        // Hash the password before storing it
                        string hashedPassword = HashPassword(txtpass.Text);
                        cmd.Parameters.AddWithValue("@password", hashedPassword);
                        cmd.Parameters.AddWithValue("@confirmpass", txtrepass.Text);
                        cmd.Parameters.AddWithValue("@userType", DropDownList2.SelectedItem.Value);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        Label1.Text = "Registered successfully";
                    }
                }
            }
            else
            {
                Label1.Text = "Your email is already registered with us.";
            }
        }

        private bool checkemail()
        {
            bool emailAvailable = false;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT COUNT(*) FROM Registers WHERE emailid = @emailid";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@emailid", txtemail.Text);
                    con.Open();
                    int count = (int)cmd.ExecuteScalar();
                    emailAvailable = count > 0;
                }
            }
            return emailAvailable;
        }

        // Hashing password using SHA256
        private string HashPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                var hashedBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }
    }
}
