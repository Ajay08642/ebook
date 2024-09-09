using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class lo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {

            try
            {
                string dcryptText = Decrypt();
                if (dcryptText == TextBox6.Text)
                {
                    Response.Redirect("WebForm4.aspx");
                }
                else
                {
                    Response.Write("<script> alert('Login Failed')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
            }
        }

        public string Decrypt()
        {
            try
            {
                string cipherText = "";
                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_book", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Email", TextBox5.Text);
                        // Decrypting the password before checking

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
                                Response.Write("<script> alert('Login Failed')</script>");
                            }
                        }
                    }
                }

                //string textToDecrypt = "VtbM/yjSA2Q=";
                string ToReturn = "";
                string publickey = "santhosh";
                string privatekey = "engineer";
                byte[] privatekeyByte = System.Text.Encoding.UTF8.GetBytes(privatekey);
                byte[] publickeybyte = System.Text.Encoding.UTF8.GetBytes(publickey);
                MemoryStream ms = null;
                CryptoStream cs = null;
                byte[] inputbyteArray = new byte[cipherText.Replace(" ", "+").Length];
                inputbyteArray = Convert.FromBase64String(cipherText.Replace(" ", "+"));
                using (DESCryptoServiceProvider des = new DESCryptoServiceProvider())
                {
                    ms = new MemoryStream();
                    cs = new CryptoStream(ms, des.CreateDecryptor(publickeybyte, privatekeyByte), CryptoStreamMode.Write);
                    cs.Write(inputbyteArray, 0, inputbyteArray.Length);
                    cs.FlushFinalBlock();
                    Encoding encoding = Encoding.UTF8;
                    ToReturn = encoding.GetString(ms.ToArray());
                }
                return ToReturn;



            }

            catch (Exception ae)
            {
                throw new Exception(ae.Message, ae.InnerException);
            }
        }






    }
}
