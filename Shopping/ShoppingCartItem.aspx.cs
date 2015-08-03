using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopping_ShoppingCartItem : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // profile test

        Profile.FirstName = "Sanil";
        Profile.LastName = "Shrestha";

        if (Request.QueryString["coin_id"] != null)
        {
            CoinId.Value = Request.QueryString["coin_id"];
            Name.Value = Request.QueryString["name"];
            Price.Value = Request.QueryString["price"];
            Picture.Value = Request.QueryString["picture"];
        }


    }

    protected void Page_PreInit(object sender, EventArgs e)
    {

    }


    protected void AddToCart(object sender, EventArgs e)
    {
      
        CartItem item = new CartItem(Convert.ToInt32(CoinId.Value), Name.Value, double.Parse(Price.Value), Picture.Value, 1);
        item.add();
        Response.Redirect("~/Shopping/ShoppingCartPage.aspx");
    }
}