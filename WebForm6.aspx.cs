using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection.Emit;

namespace Loginform
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindGridView1();
            }


        }
        protected void BindGridView()
        {
            string Dj = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
            {
                using (SqlConnection con = new SqlConnection(Dj)) 
                {
                    using(SqlCommand cmd=new SqlCommand("select * from Registers",con))
                    {
                        con.Open();
                        GridView1.DataSource = cmd.ExecuteReader();
                        GridView1.DataBind();
                        con.Close();
                    }
                }
            }

        }
        private void BindGridView1()
        {
            string Dj = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
            using (SqlConnection con = new SqlConnection(Dj))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Registers WHERE userType = 'user'", con)) 
                {
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                } 

            }

        }

        
    }
}