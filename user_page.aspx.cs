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
    public partial class user_page : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label11.Text = Session["firstname"].ToString();
                Image3.ImageUrl = Session["images"].ToString();
                ShowData();
                userdata();
            }
        }



        protected void ShowData()
        {
            try
            {
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlDataAdapter adapt = new SqlDataAdapter("SELECT * FROM Registers WHERE userType = 'User'", con);
                    con.Open();
                    adapt.Fill(dt);
                }

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle the exception appropriately, e.g., log it or display an error message.
            }
        }

        protected void userdata()
        {
            if (Session["id"] != null)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT * FROM Registers WHERE id=@id", con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@id", Session["id"]);
                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
                                txtfirst.Text = dr["firstname"].ToString();
                                txtlast.Text = dr["lastname"].ToString();
                                txtemail.Text = dr["emailid"].ToString();
                                txtgender.Text = dr["gender"].ToString();
                                txtaddress.Text = dr["address"].ToString();
                                txtphone.Text = dr["phone"].ToString();
                                txtpass.Text = dr["password"].ToString();
                                txtconfirm.Text = dr["confirmpass"].ToString();
                                txtuser.Text = dr["userType"].ToString();
                            }
                            dr.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception appropriately, e.g., log it or display an error message.
                }
            }
        }

        protected void button_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE Registers SET firstname=@firstname, lastname=@lastname, emailid=@email, gender=@gender, address=@address, phone=@phone, password=@password, confirmpass=@confirmpass, userType=@userType WHERE id=@id", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@id", Session["id"]);
                        cmd.Parameters.AddWithValue("@firstname", txtfirst.Text);
                        cmd.Parameters.AddWithValue("@lastname", txtlast.Text);
                        cmd.Parameters.AddWithValue("@email", txtemail.Text);
                        cmd.Parameters.AddWithValue("@gender", txtgender.Text);
                        cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                        cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                        cmd.Parameters.AddWithValue("@password", txtpass.Text);
                        cmd.Parameters.AddWithValue("@confirmpass", txtconfirm.Text);
                        cmd.Parameters.AddWithValue("@userType", txtuser.Text);

                        cmd.ExecuteNonQuery();
                    }
                }

                ShowData();
            }
            catch (Exception ex)
            {
                // Handle the exception appropriately, e.g., log it or display an error message.
            }
        }
    }
}












