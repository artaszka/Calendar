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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TbUser.Focus();
           // string CS = "data source=.; database = Sample; integrated security=SSPI";
           // SqlConnection con = new SqlConnection(CS);
           // SqlCommand cmd = new SqlCommand("Select * from ");

        }

        protected void Bloguj_Click(object sender, EventArgs e)
        {
          if (AuthenticateUser(TbUser.Text, TbPass.Text))
          {
              FormsAuthentication.RedirectFromLoginPage(TbUser.Text, CbRemember.Checked);
          }
          else
          {
              LbMessage.Text = "Błędna nazwa użytkownika lub hasło";
          }
        }
        
        private bool AuthenticateUser(string username, string password)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;

                string encryptedpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
                SqlParameter paramUsername = new SqlParameter("@UserName", username);
                SqlParameter paramPassword = new SqlParameter("@Password", encryptedpassword);

                cmd.Parameters.Add(paramUsername);
                cmd.Parameters.Add(paramPassword);

                con.Open();
                int ReturnCode = (int)cmd.ExecuteScalar();
                return ReturnCode == 1;
            
            }
        }

    }


}