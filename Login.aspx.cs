using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class logins : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                string decryptedText = Decrypt();
                if (decryptedText == TextBox6.Text)
                {
                    Response.Redirect("WebForm4.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "LoginFailed", "alert('Login Failed');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        public string Decrypt()
        {
            try
            {
                string cipherText = string.Empty;
                string constr = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_book", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Email", TextBox5.Text);
                        cmd.Parameters.AddWithValue("@Action", "checkPwd");
                        con.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                cipherText = dr["Password"].ToString();
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "LoginFailed", "alert('Login Failed');", true);
                                return null;
                            }
                        }
                    }
                }

                string publicKey = "santhosh";
                string privateKey = "engineer";
                byte[] privateKeyBytes = Encoding.UTF8.GetBytes(privateKey);
                byte[] publicKeyBytes = Encoding.UTF8.GetBytes(publicKey);
                byte[] inputByteArray = Convert.FromBase64String(cipherText.Replace(" ", "+"));

                using (DESCryptoServiceProvider des = new DESCryptoServiceProvider())
                using (MemoryStream ms = new MemoryStream())
                using (CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(publicKeyBytes, privateKeyBytes), CryptoStreamMode.Write))
                {
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    return Encoding.UTF8.GetString(ms.ToArray());
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error decrypting data", ex);
            }
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            if (!CheckEmail())
            {
                try
                {
                    string constr = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand("sp_book", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Username", TextBox2.Text);
                            cmd.Parameters.AddWithValue("@Password", Encrypt(TextBox6.Text));
                            cmd.Parameters.AddWithValue("@FirstName", TextBox3.Text);
                            cmd.Parameters.AddWithValue("@LastName", TextBox4.Text);
                            cmd.Parameters.AddWithValue("@Email", TextBox5.Text);
                            cmd.Parameters.AddWithValue("@Address", TextBox7.Text);
                            cmd.Parameters.AddWithValue("@Action", "Insert");

                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Registration successful.');", true);
                    ClearTextBoxes();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Error", $"alert('Error: {ex.Message}');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Error: Email is already registered.');", true);
            }
        }

        private bool CheckEmail()
        {
            string constr = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_book", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@Action", "count");

                    con.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        public string Encrypt(string plainText)
        {
            try
            {
                string publicKey = "santhosh";
                string secretKey = "engineer";
                byte[] secretKeyBytes = Encoding.UTF8.GetBytes(secretKey);
                byte[] publicKeyBytes = Encoding.UTF8.GetBytes(publicKey);
                byte[] inputByteArray = Encoding.UTF8.GetBytes(plainText);

                using (DESCryptoServiceProvider des = new DESCryptoServiceProvider())
                using (MemoryStream ms = new MemoryStream())
                using (CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(publicKeyBytes, secretKeyBytes), CryptoStreamMode.Write))
                {
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    return Convert.ToBase64String(ms.ToArray());
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error encrypting data", ex);
            }
        }

        public static class InfoSec
        {
            public static string GenerateKey()
            {
                using (Aes aes = Aes.Create())
                {
                    aes.KeySize = 256;
                    aes.GenerateKey();
                    return Convert.ToBase64String(aes.Key);
                }
            }
        }

        private void ClearTextBoxes()
        {
            TextBox2.Text = string.Empty;
            TextBox6.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox7.Text = string.Empty;
        }
    }
}
