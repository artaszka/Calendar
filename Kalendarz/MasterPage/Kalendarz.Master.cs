using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Configuration;
using System.Data;

namespace Kalendarz.MasterPage
{
    public partial class Kalendarz : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bBack_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/Login.aspx");
        }

        protected void bShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserPage/UserPage.aspx");
        }

        protected void bManager_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Manager.aspx");
        }

        protected void bEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }

        protected void bRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration/Register.aspx");
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}