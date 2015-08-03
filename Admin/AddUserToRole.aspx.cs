using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddUserToRole : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Roles.IsUserInRole(UserList.SelectedValue, RolesList.SelectedValue))
        {
            MessageLabel.Text = "User " + UserList.SelectedValue + " is already in Role " + RolesList.SelectedValue;
        }
        else
        {
            Roles.AddUserToRole(UserList.SelectedValue, RolesList.SelectedValue);
            MessageLabel.Text = "User " + UserList.SelectedValue + " added to Role " + RolesList.SelectedValue;
        }
    }
}