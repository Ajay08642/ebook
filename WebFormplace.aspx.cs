using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Policy;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class WebFormplace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int stockQuantity;
                    if (int.TryParse(Request.QueryString["StockQuantity"], out stockQuantity))
                    {
                        AddItemToCart(Request.QueryString["id"], stockQuantity);
                        Response.Redirect("addtocart.aspx");
                    }
                }
                else if (Session["buyitems"] != null)
                {
                    DataTable dt = (DataTable)Session["buyitems"];
                    BindGrid(dt);
                }

                Label1.Text = GridView1.Rows.Count.ToString();
            }

            Label2.Text = DateTime.Now.ToShortDateString();
            findorderid();
        }

        private void AddItemToCart(string productId, int stockQuantity)
        {
            DataTable dt = Session["buyitems"] as DataTable ?? CreateCartDataTable();

            using (SqlConnection scon = new SqlConnection("Data Source=DESKTOP-T6G9GPP;Initial Catalog=AJAY;Integrated Security=True"))
            {
                string myquery = "SELECT * FROM product WHERE ProductId=@ProductId";
                using (SqlCommand cmd = new SqlCommand(myquery, scon))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow dr = dt.NewRow();
                        dr["SNo"] = dt.Rows.Count + 1;
                        dr["ProductID"] = ds.Tables[0].Rows[0]["ProductID"].ToString();
                        dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                        dr["Description"] = ds.Tables[0].Rows[0]["Description"].ToString();
                        dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["CategoryID"] = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                        dr["ImageURL"] = ds.Tables[0].Rows[0]["ImageURL"].ToString();
                        dr["StockQuantity"] = stockQuantity;
                        dr["TotalPrice"] = Convert.ToInt16(dr["Price"]) * stockQuantity;

                        dt.Rows.Add(dr);
                    }
                }
            }

            Session["buyitems"] = dt;
            BindGrid(dt);
        }

        private DataTable CreateCartDataTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SNo");
            dt.Columns.Add("ProductID");
            dt.Columns.Add("Name");
            dt.Columns.Add("Description");
            dt.Columns.Add("Price");
            dt.Columns.Add("CategoryID");
            dt.Columns.Add("ImageURL");
            dt.Columns.Add("TotalPrice");
            dt.Columns.Add("StockQuantity");

            return dt;
        }

        private void BindGrid(DataTable dt)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (GridView1.Rows.Count > 0)
            {
                GridView1.FooterRow.Cells[5].Text = "Total Amount";
                GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
            }
        }

        public int grandtotal()
        {
            int gtotal = 0;

            if (Session["buyitems"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                foreach (DataRow row in dt.Rows)
                {
                    gtotal += Convert.ToInt32(row["TotalPrice"]);
                }
            }

            return gtotal;
        }

        public void findorderid()
        {
            String pass = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)(35 * r.NextDouble())];
            }

            string OrderId = "Orders"
                             + DateTime.Now.Hour.ToString()
                             + DateTime.Now.Minute.ToString()
                             + DateTime.Now.Second.ToString()
                             + DateTime.Now.Day.ToString()
                             + DateTime.Now.Month.ToString()
                             + DateTime.Now.Year.ToString()
                             + new string(mypass);

            Label1.Text = OrderId;
        }

        public void saveaddress()
        {
            string mycon = "Data Source=DESKTOP-T6G9GPP;Initial Catalog=AJAY;Integrated Security=True";
            using (SqlConnection scon = new SqlConnection(mycon))
            {
                string insertOrder = "INSERT INTO orders(OrderId,ShippingAddress,OrderDate,TotalAmount,PaymentStatus) VALUES(@OrderId,@ShippingAddress,@OrderDate,@TotalAmount,@PaymentStatus)";
                using (SqlCommand cmd = new SqlCommand(insertOrder, scon))
                {
                    cmd.Parameters.AddWithValue("@OrderId", Label1.Text);
                    cmd.Parameters.AddWithValue("@TotalAmount", grandtotal());
                    cmd.Parameters.AddWithValue("@OrderDate",DateTime.Now);
                    cmd.Parameters.AddWithValue("@ShippingAddress", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@PaymentStatus", "successful");
                    //cmd.Parameters.AddWithValue("@UserId", 1);
                    scon.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["buyitems"] != null)
            {
                // Save order information first
                saveaddress();

                DataTable dt = (DataTable)Session["buyitems"];
                foreach (DataRow row in dt.Rows)
                {
                    string mycon = "Data Source=DESKTOP-T6G9GPP;Initial Catalog=AJAY;Integrated Security=True";
                    using (SqlConnection scon = new SqlConnection(mycon))
                    {
                        string updatepass = "INSERT INTO orderitem(OrderID, ProductID, Quantity,Subtotal, TotalPrice) VALUES(@OrderID, @ProductID, @Quantity,@Subtotal, @TotalPrice)";
                        using (SqlCommand cmd = new SqlCommand(updatepass, scon))
                        {
                            cmd.Parameters.AddWithValue("@OrderID", Label1.Text);
                            cmd.Parameters.AddWithValue("@ProductID", row["ProductID"]);
                            cmd.Parameters.AddWithValue("@Quantity", row["StockQuantity"]);
                            cmd.Parameters.AddWithValue("@Subtotal", row["TotalPrice"]);

                            cmd.Parameters.AddWithValue("@TotalPrice", row["TotalPrice"]);

                            scon.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                }

                //Response.Redirect("placedsucessfully.aspx");
                //Your order has been placed successfully.
                ScriptManager.RegisterStartupScript(this, GetType(), "OrderSuccess", "alert('Order placed successfully!'); window.location.href='placedsucessfully.aspx';", true);
            }
        }
    }
}
