﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pages_Register : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        Roles.AddUserToRole(CreateUserWizard1.UserName, "member");
    }

    protected void CreateUserWizard1_Continue(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/CurrentSpecials.aspx");
    }


}