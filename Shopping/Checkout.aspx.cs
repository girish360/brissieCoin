using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopping_Checkout : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.IsAuthenticated)
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

    protected void Page_LoadComplete(object sender, EventArgs e)
    {

        if (!Request.IsAuthenticated)
        {
            if (Wizard1.ActiveStepIndex > 0)
            {
                Wizard1.ActiveStepIndex = 0;
                Response.Redirect("~/Shopping/Checkout.aspx");
            }
        }

    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        CartItem CartItem;
        CartItem.clearItems();
    }
}