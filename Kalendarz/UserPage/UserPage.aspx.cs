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

namespace Kalendarz.UserPage
{
    public partial class UserPage : System.Web.UI.Page
    {
        DataView schedule = new DataView();

        void Page_Load()
        {
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
                e.Cell.BackColor = System.Drawing.Color.Red;
        }

        protected void bTydzien_Click(object sender, EventArgs e)
        {
            bltResults.DataSource= calSchedule.SelectedDates;
            bltResults.DataBind();
        }

        

        
        
    }
}