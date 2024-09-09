//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Security.Cryptography.X509Certificates;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace BookStore
//{
//    public partial class AddToCart : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                DataTable dt = new DataTable();
//                DataRow dr;

//                dt.Columns.Add("ProductID");
//                dt.Columns.Add("Name");
//                dt.Columns.Add("Description");
//                dt.Columns.Add("Price");
//                dt.Columns.Add("CategoryID");
//                dt.Columns.Add("ImageURL");
//                dt.Columns.Add("StockQuantity");
//                dt.Columns.Add("totalprice");

//                if (Request.QueryString["id"] != null)
//                {
//                    if (Session["Buyitems"] == null)
//                    {
//                        dr = dt.NewRow();
//                        string mycon = "Data Source=DESKTOP-T6G9GPP;Initial Catalog=AJAY;Integrated Security=True";
//                        SqlConnection scon = new SqlConnection();
//                        String myquery = "select * from product where ProductId=" + Request.QueryString["id"];
//                        SqlCommand cmd = new SqlCommand();
//                        cmd.CommandText = myquery;
//                        cmd.Connection = scon;
//                        SqlDataAdapter da = new SqlDataAdapter();
//                        da.SelectCommand = cmd;
//                        DataSet ds = new DataSet();
//                        da.Fill(ds);

//                        dr["ProductID"] = ds.Tables[0].Rows[0]["ProductID"].ToString();
//                        dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
//                        dr["Description"] = ds.Tables[0].Rows[0]["Description"].ToString();
//                        dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
//                        dr["CategoryID"] = ds.Tables[0].Rows[0]["CategoryID"].ToString();
//                        dr["ImageURL"] = ds.Tables[0].Rows[0]["ImageURL"].ToString();
//                        int Price = Convert.ToInt16(ds.Tables[0].Rows[0]["Price"].ToString());
//                        int StockQuantity = Convert.ToInt16(Request.QueryString["StockQuantity"].ToString());
//                        int totalprice = Price * StockQuantity;
//                        dr["totalprice"] = totalprice;

//                        dt.Rows.Add(dr);
//                        GridView1.DataSource = dt;
//                        GridView1.DataBind();

//                        Session["buyitems"] = dt;
//                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
//                        GridView1.FooterRow.Cells[6].Text = grandTotal().ToString();
//                        Response.Redirect("AddToCart.aspx");
//                    }
//                    else
//                    {
//                        dr = dt.NewRow();
//                        string mycon = "Data Source=DESKTOP-T6G9GPP;Initial Catalog=AJAY;Integrated Security=True";
//                        SqlConnection scon = new SqlConnection();
//                        String myquery = "select * from product where ProductId=" + Request.QueryString["id"];
//                        SqlCommand cmd = new SqlCommand();
//                        cmd.CommandText = myquery;
//                        cmd.Connection = scon;
//                        SqlDataAdapter da = new SqlDataAdapter();
//                        da.SelectCommand = cmd;
//                        DataSet ds = new DataSet();
//                        da.Fill(ds);

//                        dr["ProductID"] = ds.Tables[0].Rows[0]["ProductID"].ToString();
//                        dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
//                        dr["Description"] = ds.Tables[0].Rows[0]["Description"].ToString();
//                        dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
//                        dr["CategoryID"] = ds.Tables[0].Rows[0]["CategoryID"].ToString();
//                        dr["ImageURL"] = ds.Tables[0].Rows[0]["ImageURL"].ToString();
//                        int Price = Convert.ToInt16(ds.Tables[0].Rows[0]["Price"].ToString());
//                        int StockQuantity = Convert.ToInt16(Request.QueryString["StockQuantity"].ToString());
//                        int totalprice = Price * StockQuantity;
//                        dr["totalprice"] = totalprice;

//                        dt.Rows.Add(dr);
//                        GridView1.DataSource = dt;
//                        GridView1.DataBind();

//                        Session["buyitems"] = dt;
//                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
//                        GridView1.FooterRow.Cells[6].Text = grandTotal().ToString();
//                        Response.Redirect("AddToCart.aspx");
//                    }
//                }

//                else
//                {
//                    dt = (DataTable)Session["buyitems"];
//                    GridView1.DataSource = dt;
//                    GridView1.DataBind();
//                    if (GridView1.Rows.Count > 0)
//                    {
//                        GridView1.FooterRow.Cells[5].Text = "total amount";
//                        GridView1.FooterRow.Cells[6].Text = grandtotal.ToString();

//                    }
//                }
//                Label1.Text = GridView1.Rows.Count.ToString();

//            }


//                Public int grandtotal()
//                {
//                    DataTable dt = new DataTable();
//                    dt = (DataTable)Session["buyitems"];
//                    int nrow = dt.Rows.Count;
//                    int i = 0;
//                    int gtotal = 0;
//                    while (1 < nrow)
//                    {
//                        gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());
//                        i = i + 1;
//                    }
//                    return gtotal;
//                }

//            }
//        }
//    }


using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("SNo");                                                                                                                                              
                dt.Columns.Add("ProductID");
                dt.Columns.Add("Name");
                dt.Columns.Add("Description"); 
                dt.Columns.Add("Price");
                dt.Columns.Add("CategoryID");
                dt.Columns.Add("ImageURL");
                dt.Columns.Add("TotalPrice");
                dt.Columns.Add("StockQuantity");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["buyitems"] == null)
                    {
                        dr = dt.NewRow();
                        string mycon = "Data Source=DESKTOP-T6G9GPP;Initial Catalog=AJAY;Integrated Security=True";
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from product where ProductId=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["SNo"] = 1;
                        dr["ProductID"] = ds.Tables[0].Rows[0]["ProductID"].ToString();
                        dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                        dr["Description"] = ds.Tables[0].Rows[0]["Description"].ToString();
                        dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["CategoryID"] = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                        dr["ImageURL"] = ds.Tables[0].Rows[0]["ImageURL"].ToString();
                        dr["StockQuantity"] = Request.QueryString["StockQuantity"];
                        int Price = Convert.ToInt16(ds.Tables[0].Rows[0]["Price"].ToString());
                        //int StockQuantity = Convert.ToInt16(ds.Tables[0].Rows[0]["StockQuantity"].ToString());
                        int StockQuantity = Convert.ToInt16(Request.QueryString["StockQuantity"].ToString());
                        int TotalPrice = Price * StockQuantity;
                        dr["TotalPrice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["buyitems"] = dt;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("addtocart.aspx");
                    }
                    else
                    {

                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;
                        dr = dt.NewRow();
                        string mycon = "Data Source=DESKTOP-T6G9GPP;Initial Catalog=AJAY;Integrated Security=True";
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from product where ProductId=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["SNo"] = sr+1;
                        dr["ProductID"] = ds.Tables[0].Rows[0]["ProductID"].ToString();
                        dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                        dr["Description"] = ds.Tables[0].Rows[0]["Description"].ToString();
                        dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["CategoryID"] = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                        dr["ImageURL"] = ds.Tables[0].Rows[0]["ImageURL"].ToString();
                        dr["StockQuantity"] = Request.QueryString["StockQuantity"];
                        int Price = Convert.ToInt16(ds.Tables[0].Rows[0]["Price"].ToString());
                        //int StockQuantity = Convert.ToInt16(ds.Tables[0].Rows[0]["StockQuantity"].ToString());
                        int StockQuantity = Convert.ToInt16(Request.QueryString["StockQuantity"].ToString());
                        int TotalPrice = Price * StockQuantity;
                        dr["TotalPrice"] = TotalPrice;
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        GridView1.FooterRow.Cells[3].Text = "Total Amount";
                        GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();
                        Response.Redirect("addtocart.aspx");

                    }

                    
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[8].Text = "total amount";
                        GridView1.FooterRow.Cells[9].Text = grandtotal().ToString();
                    }
                }
                Label1.Text = GridView1.Rows.Count.ToString();
            }
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["TotalPrice"].ToString());
                i = i + 1;
            }
            return gtotal;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = int.Parse(dt.Rows[i]["SNo"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);
                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;
                }
            }
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["SNo"] = i;
                dt.AcceptChanges();
            }
            Session["buyitems"] = dt;
            Response.Redirect("addtocart.aspx");

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "SNo" + GridView1.SelectedRow.Cells[0].Text;
            Response.Redirect("EditOrder.aspx?SNo" + GridView1.SelectedRow.Cells[0].Text);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebFormplace.aspx");
        }
    }

}




