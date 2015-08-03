using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageCatalogue : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Visible = (Countries.SelectedValue.Length > 0) ? true : false;
    }

    protected void FilterByCountry(object sender, EventArgs e)
    {
        string SelectedCountry = Countries.SelectedValue;
        ((TextBox)FormView1.FindControl("CountryTextBox")).Text = SelectedCountry;

    }

    protected void CoinsListing_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        //Countries.DataBind();
        Response.Redirect("~/Admin/ManageCatalogue.aspx");
    }

    protected void FormView1_ItemCreated(object sender, EventArgs e)
    {
        // Response.Redirect("~/Admin/ManageCatalogue.aspx");
        GridView1.DataBind();
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
    }
}