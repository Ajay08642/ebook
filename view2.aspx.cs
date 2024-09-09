using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class view2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                // Retrieve order details from query string
                lblName.Text = Request.QueryString["name"];
                lblAddress.Text = Request.QueryString["address"];
                lblItem.Text = Request.QueryString["item"];
                lblQuantity.Text = Request.QueryString["quantity"];
            }
        }

        protected void btnFinalize_Click(object sender, EventArgs e)
        {
            // Code to finalize the purchase
            Response.Write("Order finalized successfully!");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Redirect back to order details for editing
            Response.Redirect("OrderDetails.aspx");
        }
    }
    }
   


       