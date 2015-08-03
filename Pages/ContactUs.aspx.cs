using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ContactUs : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('Thank you');</script>");
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/");
    }
}