using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Loginform
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["emailid"] != null)
            {
                Response.Write("welcome to my page" + Session["emailid"].ToString());
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            if (Session["emailid"] != null)
            {

                Session["emailid"] = null;
                Response.Redirect("Login.aspx");

            }
        }
    }
}