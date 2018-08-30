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

namespace Kalendarz
{
    public partial class _default : System.Web.UI.Page
    {
        DataView schedule = new DataView();

        void Page_Load()
        {
            
            aduser.Text = User.Identity.Name;
            Godzina.Text = DateTime.Now.ToString();

            if (calSchedule.SelectedDate == DateTime.MinValue)
                calSchedule.SelectedDate = calSchedule.TodaysDate;
        }
        
        void Page_PreRender()
        {
            schedule = (DataView)srcCalendar.Select(DataSourceSelectArguments.Empty);
            schedule.Sort = "Data";
        }

        protected void calSchedule_DayRender(object sender, DayRenderEventArgs e)
        {
            if (schedule.FindRows(e.Day.Date).Length > 0)
                e.Cell.BackColor = System.Drawing.Color.Black;
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