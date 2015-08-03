using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_CoinCatalogue : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // CoinsListing.Visible = (Page.IsPostBack) ? true : false;
        // hide Conins Lising Grid if counry is not selected
        CoinsListing.Visible = (Countries.SelectedValue.Length > 0) ? true : false;
    }

    protected void FilterByCountry(object sender, EventArgs e)
    {
        string SelectedCountry = Countries.SelectedValue;
       // Response.Write(SelectedCountry);
    }

    protected void AddtoProfile(object sender, EventArgs e)
    {
        string SelectedCountry = Countries.SelectedValue;
        Response.Write("test");
    }


}