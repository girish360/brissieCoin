using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopping_ShoppingCartPage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CartItem CartItem;

        List<CartItem> ItemList = new List<CartItem>();

        ItemList = CartItem.getItems();

        if (ItemList != null && ItemList.Count > 0)
        {
            CartMsg.Text = "Total: $ " + CartItem.grandTotal();
        }
        else
        {
            CartMsg.Text = "Your cart is empty !";
        }

    }

    protected void Page_PreLoad(object sender, EventArgs e)
    {
        if (Request.QueryString["remove"] != null)
        {
            int coin_id = Convert.ToInt32(Request.QueryString["remove"]);
            CartItem CartItem;
            CartItem.remove(coin_id);
        }
        
    }

    protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        CartItem CartItem;

        List<CartItem> ItemList = new List<CartItem>();

        ItemList = CartItem.getItems();

        if (ItemList != null && ItemList.Count > 0)
        {
            CartMsg.Text = "Total: $ " + CartItem.grandTotal();
        }
        else
        {
            CartMsg.Text = "Your cart is empty !";
        }
    }
}


