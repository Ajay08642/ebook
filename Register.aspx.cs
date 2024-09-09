


using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace BookStore
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    string constr = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
        //    if (!CheckEmail())
        //    {
        //        using (SqlConnection con = new SqlConnection(constr))
        //        {
        //            using (SqlCommand cmd = new SqlCommand("sp_book", con))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@Username", TextBox2.Text);
        //                cmd.Parameters.AddWithValue("@Password", EncryptPassword(TextBox6.Text));
        //                cmd.Parameters.AddWithValue("@Email", TextBox5.Text);
        //                cmd.Parameters.AddWithValue("@FirstName", TextBox3.Text);
        //                cmd.Parameters.AddWithValue("@LastName", TextBox4.Text);
        //                cmd.Parameters.AddWithValue("@Address", TextBox7.Text);
        //                cmd.Parameters.AddWithValue("@Action", "Insert");

        //                try
        //                {
        //                    con.Open();
        //                    cmd.ExecuteNonQuery();
        //                    ScriptManager.RegisterStartupScript(this, GetType(), "LoginAlert", "alert('Registered Successfully');", true);
        //                    //ClearFields();
        //                }
        //                catch (Exception ex)
        //                {
        //                    Label1.Text = "An error occurred: " + ex.Message;
        //                }
        //            }
        //        }
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "LoginAlert", "alert('Your email is already registered with us.');", true);
        //    }
        //}

        //private bool CheckEmail()
        //{
        //    bool emailAvailable = false;
        //    string constr = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("sp_book", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Email", TextBox5.Text);
        //            cmd.Parameters.AddWithValue("@Username", "");
        //            cmd.Parameters.AddWithValue("@Password", TextBox6.Text); // Removed quotes here

        //            cmd.Parameters.AddWithValue("@FirstName", "");
        //            cmd.Parameters.AddWithValue("@LastName", "");
        //            cmd.Parameters.AddWithValue("@Address", "");
        //            cmd.Parameters.AddWithValue("@Action", "count");

        //            con.Open();
        //            int count = (int)cmd.ExecuteScalar();
        //            emailAvailable = count > 0;
        //        }
        //    }
        //    return emailAvailable;
        //}

        ////private void ClearFields()
        ////{
        ////    TextBox2.Text = "";
        ////    TextBox3.Text = "";
        ////    TextBox4.Text = "";
        ////    TextBox5.Text = "";
        ////    TextBox6.Text = "";
        ////    TextBox7.Text = "";
        ////}
        //private string EncryptPassword(string Password)
        //{

        //    using (MD5 md5 = MD5.Create())
        //    {
        //        byte[] inputBytes = Encoding.ASCII.GetBytes(Password);
        //        byte[] hashBytes = md5.ComputeHash(inputBytes);

        //        StringBuilder sb = new StringBuilder();
        //        for (int i = 0; i < hashBytes.Length; i++)
        //        {
        //            sb.Append(hashBytes[i].ToString("X2"));
        //        }
        //        return sb.ToString();
        //    }
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!checkEmail())
            {
                try
                {
                    string constr = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        SqlCommand cmd = new SqlCommand("sp_book", con);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Username", TextBox2.Text);
                        string key = infoSec.Generatekey();
                        string ivKey;
                        cmd.Parameters.AddWithValue("@Password", Encrypt(TextBox6.Text));
                        
                        cmd.Parameters.AddWithValue("@FirstName", TextBox3.Text);
                        cmd.Parameters.AddWithValue("@LastName", TextBox4.Text);
                        cmd.Parameters.AddWithValue("@Email", TextBox5.Text);
                        cmd.Parameters.AddWithValue("@Address", TextBox7.Text);
                        cmd.Parameters.AddWithValue("@Action", "Insert");

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Registration Data successfully.');", true);


                        TextBox2.Text = "";
                        TextBox6.Text = "";
                        TextBox3.Text = "";
                        TextBox4.Text = "";
                        TextBox7.Text = "";
                        TextBox5.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Error", $"alert('Error: {ex.Message}');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Error: Your Created Email is Already Registered. Please Enter a New Email.');", true);
            }
        }

        private bool checkEmail()
        {
            bool emailAvailable = false;
            string constr = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("sp_book", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", TextBox5.Text);

                cmd.Parameters.AddWithValue("@Username", "");
                cmd.Parameters.AddWithValue("@Password", TextBox6.Text);
                cmd.Parameters.AddWithValue("@FirstName", "");
                cmd.Parameters.AddWithValue("@LastName", "");
                cmd.Parameters.AddWithValue("@Address", "");
                cmd.Parameters.AddWithValue("@Action", "count");
                con.Open();
                int count = (int)cmd.ExecuteScalar();
                emailAvailable = count > 0;
            }
            return emailAvailable;
        }


        public string Encrypt(string plainText)
        {
            try
            {
                //string textToEncrypt = "Water";
                string ToReturn = "";
                string publickey = "santhosh";
                string secretkey = "engineer";
                byte[] secretkeyByte = { };
                secretkeyByte = System.Text.Encoding.UTF8.GetBytes(secretkey);
                byte[] publickeybyte = { };
                publickeybyte = System.Text.Encoding.UTF8.GetBytes(publickey);
                MemoryStream ms = null;
                CryptoStream cs = null;
                byte[] inputbyteArray = System.Text.Encoding.UTF8.GetBytes(plainText);
                using (DESCryptoServiceProvider des = new DESCryptoServiceProvider())
                {
                    ms = new MemoryStream();
                    cs = new CryptoStream(ms, des.CreateEncryptor(publickeybyte, secretkeyByte), CryptoStreamMode.Write);
                    cs.Write(inputbyteArray, 0, inputbyteArray.Length);
                    cs.FlushFinalBlock();
                    ToReturn = Convert.ToBase64String(ms.ToArray());
                }
                return ToReturn;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }



        //public static string Encrypt(string plainText, string key, out string ivKey)
        //{
        //    using (Aes aes = Aes.Create())
        //    {
        //        aes.Padding = PaddingMode.Zeros;
        //        aes.Key = Convert.FromBase64String(key);
        //        aes.GenerateIV();
        //        ivKey = Convert.ToBase64String(aes.IV);
        //        ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);
        //        byte[] encryptedData;
        //        using (MemoryStream ms = new MemoryStream())
        //        {
        //            using (CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
        //            {
        //                using (StreamWriter sw = new StreamWriter(cs))
        //                {
        //                    sw.Write(plainText);
        //                }
        //                encryptedData = ms.ToArray();
        //            }
        //        }
        //        return Convert.ToBase64String(encryptedData);
        //    }
        //}

        public static class infoSec
        {
            public static string Generatekey()
            {
                string keyBase64 = "";
                using (Aes aes = Aes.Create())
                {
                    aes.KeySize = 256;
                    aes.GenerateKey();
                    keyBase64 = Convert.ToBase64String(aes.Key);

                   
                    
                }
                return keyBase64;
            }
        }
    }
}


