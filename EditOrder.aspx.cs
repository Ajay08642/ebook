using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class EditOrder : System.Web.UI.Page
    {
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
           if (IsPostBack)
            {

            }
            else
            {

                //Session["buyitems"] = txtsno.ToString();
                if (Request.QueryString["SNo"] != null)
                {
                    dt = (DataTable)Session["buyitems"];
                    for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    {
                        int sr;
                        int sr1;
                        sr = Convert.ToInt32(dt.Rows[i]["SNo"].ToString());
                        Label6.Text = Request.QueryString["SNo"];
                        Label1.Text = sr.ToString();
                        sr1 = Convert.ToInt32(Label6.Text);

                        if (sr == sr1)
                        {
                            Label6.Text = dt.Rows[i]["SNo"].ToString();
                            Label1.Text = dt.Rows[i]["ProductID"].ToString();
                            Label2.Text = dt.Rows[i]["Name"].ToString();
                            Label3.Text = dt.Rows[i]["Description"].ToString();
                            Label4.Text = dt.Rows[i]["Price"].ToString();
                            DropDownList1.Text = dt.Rows[i]["StockQuantity"].ToString();
                            Label5.Text = dt.Rows[i]["TotalPrice"].ToString();
                            break;
                        }

                    }
                }
                else
                {
                }

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int q;
            q = Convert.ToInt32(DropDownList1.Text);
            int cost;
            cost = Convert.ToInt32(Label4.Text);
            int TotalPrice;
            TotalPrice = cost * q;
            Label5.Text = TotalPrice.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["buyitems"];
            for (int i = 0; i < dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                sr = Convert.ToInt32(dt.Rows[i]["SNo"].ToString());
                sr1 = Convert.ToInt32(Label6.Text);
                if (sr == sr1)
                {
                    dt.Rows[i]["SNo"] = Label6.Text;
                    dt.Rows[i]["ProductID"] = Label1.Text;
                    dt.Rows[i]["Name"] = Label2.Text;
                    dt.Rows[i]["Description"] = Label3.Text;
                    dt.Rows[i]["Price"] = Label4.Text;
                    dt.Rows[i]["StockQuantity"] = DropDownList1.Text;
                    dt.Rows[i]["TotalPrice"] = Label5.Text;
                    dt.AcceptChanges();
                    break;

                }
            }
            Response.Redirect("addtocart.aspx");
        }
    }
}
