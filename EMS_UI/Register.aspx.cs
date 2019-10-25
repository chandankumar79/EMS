﻿using EMS_DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_UI
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            bool result = DAL.RegisterUser(UserName.Text, Password.Text);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "displayalert", "alert('Registration Successful'); window.location='Login.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('Registration failed');", true);
            }

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}