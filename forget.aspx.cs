using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Loginform
{
    public partial class forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void update_Click(object sender, EventArgs e)
        {
            try
            {
                string oldpass = oldpassword.Text;
                string newpass = newpassword.Text;
                string conpass = conpassword.Text;


                string cs = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Registers where password='" + oldpass + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                {
                    if (reader.HasRows == true)
                    {
                        reader.Read();
                        con.Close();

                        if (newpass == conpass)
                        {
                            con.Open();
                            cmd = new SqlCommand("update Registers set password='" + newpass + "' where password='" + oldpass + "'", con);

                            cmd.ExecuteNonQuery();
                            con.Close();
                            Label4.Text = "password hass benn changed sucessfully";
                        }
                    }
                    else
                    {
                        Label4.Text = "Inavlid password plsase enter correct password";
                    }
                }
            }

            catch (Exception ex)
            {


            }
        }
    }
}
            
        
    
