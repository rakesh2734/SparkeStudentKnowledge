using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sparkle
{
    public partial class LoginScreen : System.Web.UI.Page
    {
        public String email = String.Empty, pass = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["search"] = 2;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            perform();
        }

        protected void perform()
        {
            email = username.Text;
            pass = password.Text;
             SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
                conn.Open();
                try
                {
                    SqlCommand myCommand = new SqlCommand("select * from Login_Table WHERE email=@email AND password=@pass", conn);
                    myCommand.Parameters.AddWithValue("@email",email);
                    myCommand.Parameters.AddWithValue("@pass", pass);

                    SqlDataReader dataReader = myCommand.ExecuteReader();
                    if(dataReader.Read())
                    {
                         Session["uid"] = dataReader.GetString(0)+"";
                         Response.Redirect("HomePage.aspx?from=1");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Username or password')", true);
                    }
                }
                catch (Exception ec)
                {
                    Response.Write(ec.ToString());
                }
                conn.Close();
        }

      protected void password_TextChanged(object sender, EventArgs e)
        {
         
        }
    }
}