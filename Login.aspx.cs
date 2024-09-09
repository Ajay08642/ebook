
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Loginform
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
       

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            string cs = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Registers WHERE emailid=@emailid AND password=@password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@emailid", txtemail.Text);
                    cmd.Parameters.AddWithValue("@password", txtPass.Text);

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            Session["emailid"] = txtemail.Text;
                            ScriptManager.RegisterStartupScript(this, GetType(), "LoginAlert", "alert('Login Successfully');", true);
                           
                        }
                        else
                        {
                            lblErrorMessage.Text = "Username and password are invalid.";
                            lblErrorMessage.Visible = true;
                            return;
                        }

                        if (reader.Read())
                        {
                            Session["id"] = reader["id"].ToString();
                            Session["emailid"] = reader["emailid"].ToString();
                            Session["firstname"] = reader["firstname"].ToString();
                            Session["images"] = reader["images"].ToString();
                            string userType = reader["userType"].ToString();


                            if (userType == "User")
                            {
                                Response.Redirect("user_page.aspx");
                            }
                            else if (userType == "Admin")
                            {
                                Response.Redirect("admin_page.aspx");
                            }
                            else
                            {
                                // Handle unknown user type
                            }
                        }
                        else
                        {
                            // Handle invalid credentials
                        }
                    }
                }
            }
        }

    }
}