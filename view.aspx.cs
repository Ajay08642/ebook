using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        

     
                if (!IsPostBack)
                {
                    if (Session["buyitems"] != null)
                    {
                        // Retrieve cart items and bind to GridView
                        DataTable dt = (DataTable)Session["buyitems"];
                        GridViewOrderSummary.DataSource = dt;
                        GridViewOrderSummary.DataBind();

                        // Display total amount
                        LabelTotalAmount.Text = CalculateTotal(dt).ToString();
                    }
                }
            }

            // Calculate the grand total of the cart
            private int CalculateTotal(DataTable dt)
            {
                int total = 0;
                foreach (DataRow row in dt.Rows)
                {
                    total += Convert.ToInt32(row["TotalPrice"]);
                }
                return total;
            }

            // Proceed to finalize order
            protected void BtnConfirmOrder_Click(object sender, EventArgs e)
            {
                // Redirect to order placement page
                Response.Redirect("WebFormplace.aspx?action=confirm");
            }

            // Cancel the order and clear the session
            protected void BtnCancelOrder_Click(object sender, EventArgs e)
            {
                // Clear session
                Session["buyitems"] = null;

                // Redirect to homepage or cart page
                Response.Redirect("addtocart.aspx");
            }
        }
    }
