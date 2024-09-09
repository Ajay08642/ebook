using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;
using System.Reflection;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Security.Policy;
using static System.Net.Mime.MediaTypeNames;
using System.Drawing;

namespace Loginform
{
    public partial class admin_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Image3.ImageUrl = Session["images"].ToString();
                Label11.Text = Session["firstname"].ToString();

                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();

            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            Label15.Text = "edit sucessfuull";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.White;

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            Label15.Text = "";
        }



        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox id = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox firstname = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox lastname = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            TextBox emailid = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
            TextBox gender = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
            TextBox address = GridView1.Rows[e.RowIndex].FindControl("TextBox6") as TextBox;
            TextBox phone = GridView1.Rows[e.RowIndex].FindControl("TextBox7") as TextBox;
            TextBox password = GridView1.Rows[e.RowIndex].FindControl("TextBox8") as TextBox;
            TextBox confirmpass = GridView1.Rows[e.RowIndex].FindControl("TextBox9") as TextBox;
            TextBox userType = GridView1.Rows[e.RowIndex].FindControl("TextBox10") as TextBox;

            FileUpload FileUpload = GridView1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
            string path = "~/images/";

            if (FileUpload.HasFile)
            {
                path += FileUpload.FileName;
                FileUpload.SaveAs(Server.MapPath(path));
            }

            string mycon = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(mycon))
                {
                    string query = "UPDATE Registers SET firstname=@firstname, lastname=@lastname, emailid=@emailid, " +
                                   "gender=@gender, address=@address, phone=@phone, password=@password, " +
                                   "confirmpass=@confirmpass, userType=@userType, images=@images WHERE id=@id";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id.Text);
                        cmd.Parameters.AddWithValue("@firstname", firstname.Text);
                        cmd.Parameters.AddWithValue("@lastname", lastname.Text);
                        cmd.Parameters.AddWithValue("@emailid", emailid.Text);
                        cmd.Parameters.AddWithValue("@gender", gender.Text);
                        cmd.Parameters.AddWithValue("@address", address.Text);
                        cmd.Parameters.AddWithValue("@phone", phone.Text);
                        cmd.Parameters.AddWithValue("@password", password.Text);
                        cmd.Parameters.AddWithValue("@confirmpass", confirmpass.Text);
                        cmd.Parameters.AddWithValue("@userType", userType.Text);
                        cmd.Parameters.AddWithValue("@images", path);
                        con.Open();

                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        if (rowsAffected > 0)
                        {
                            GridView1.EditIndex = -1;
                            GridView1.DataSource = SqlDataSource1;
                            GridView1.DataBind();
                        }
                        else
                        {
                            // Handle if no rows were affected
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
        }



        protected void LinkButton5_Click(object sender, EventArgs e)
        {

            TextBox  firstname = GridView1.FooterRow.FindControl("TextBox12") as TextBox;
            TextBox lastname = GridView1.FooterRow.FindControl("TextBox13") as TextBox;
            TextBox emailid = GridView1.FooterRow.FindControl("TextBox14") as TextBox;
            TextBox gender = GridView1.FooterRow.FindControl("TextBox15") as TextBox;
            TextBox address = GridView1.FooterRow.FindControl("TextBox16") as TextBox;
            TextBox phone = GridView1.FooterRow.FindControl("TextBox17") as TextBox;
            TextBox password = GridView1.FooterRow.FindControl("TextBox18") as TextBox;
            TextBox confirmpass = GridView1.FooterRow.FindControl("TextBox19") as TextBox;
            TextBox userType = GridView1.FooterRow.FindControl("TextBox20") as TextBox;
            FileUpload FileUpload = GridView1.FooterRow.FindControl("FileUpload2") as FileUpload;

            string path = "~/images/";

            if (FileUpload.HasFile)
            {
                path += FileUpload.FileName;
                FileUpload.SaveAs(Server.MapPath(path));
            }


            string mycon = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
            using (SqlConnection con = new SqlConnection(mycon))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Registers(firstname, lastname, emailid, gender, address, phone, password, confirmpass, userType,images) VALUES (@firstname, @lastname, @emailid, @gender, @address, @phone, @password, @confirmpass, @userType,@images)", con))
                {

                    cmd.Parameters.AddWithValue("@firstname", firstname.Text);
                    cmd.Parameters.AddWithValue("@lastname", lastname.Text);
                    cmd.Parameters.AddWithValue("@emailid", emailid.Text);
                    cmd.Parameters.AddWithValue("@gender", gender.Text);
                    cmd.Parameters.AddWithValue("@address", address.Text);
                    cmd.Parameters.AddWithValue("@phone", phone.Text);
                    cmd.Parameters.AddWithValue("@password", password.Text);
                    cmd.Parameters.AddWithValue("@confirmpass", confirmpass.Text);
                    cmd.Parameters.AddWithValue("@userType", userType.Text);
                    cmd.Parameters.AddWithValue("@images", path);




                    con.Open();

                    cmd.ExecuteNonQuery();
                    SqlDataSource1.DataBind();
                    GridView1.DataSource = SqlDataSource1;
                    GridView1.DataBind();
                    con.Close();




                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            string mycon = ConfigurationManager.ConnectionStrings["dj"].ConnectionString;
            using (SqlConnection con = new SqlConnection(mycon))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Registers WHERE id=@id", con))
                {
                    cmd.Parameters.AddWithValue("id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1; // Optional: You might want to reset the edit index after deletion.
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            if (Session["emailid"] != null)
            {
                Session["emailid"] = null;
                Response.Redirect("Login.aspx");
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkstatus = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chkstatus.NamingContainer;
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkheader = (CheckBox)GridView1.HeaderRow.FindControl("chkheader");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkrow = (CheckBox)row.FindControl("chkEmpty");
                if (chkheader.Checked == true)
                {
                    chkrow.Checked = true;
                }
                else
                {
                    chkrow.Checked = false;
                }
            }
        }

        protected void btndelete_Click(object sender, ImageClickEventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chkdelete = (CheckBox)GridView1.Rows[i].FindControl("chkEmpty");
                if (chkdelete.Checked)
                {
                    int id = Convert.ToInt32(GridView1.DataKeys[i].Value); // Corrected to use index i

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dj"].ConnectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("DELETE FROM Registers WHERE id=@id", con);
                        
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.ExecuteNonQuery(); Label15.Text = "delete sucessfuull";
                    }
                }
            }
            // After deletion, you might want to rebind your GridView to reflect the changes
           
        }
    }
    }











 