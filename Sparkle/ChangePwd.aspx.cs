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
    public partial class ChangePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void pwdbtn_Click(object sender, EventArgs e)
        {
            if (isCorrect())
            {
                if (isMatch())
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
                    conn.Open();
                    try
                    {
                        SqlCommand myCommand = new SqlCommand("update [Login_Table] set password='" + cpwd.Text.ToString() + "' where uid ='" + Session["uid"].ToString() + "'", conn);
                        myCommand.ExecuteNonQuery();
                    }
                    catch (Exception ec)
                    {
                        Response.Write(ec.ToString());
                    }
                    conn.Close();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password Succesfully changed')", true);
                    Response.Redirect("LoginScreen.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password Mismatch')", true);

                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid old password')", true);

            }
        }

        protected bool isCorrect()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("select * from [Login_Table] where uid ='" + Session["uid"].ToString() + "' and password='"+opwd.Text.ToString()+"'", conn);
                SqlDataReader dataReader = myCommand.ExecuteReader();
                if (dataReader.Read())
                {
                    return true;
                }
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return false;
        }

        protected bool isMatch()
        {
            if(cpwd.Text.ToString().Equals(npwd.Text.ToString()))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}