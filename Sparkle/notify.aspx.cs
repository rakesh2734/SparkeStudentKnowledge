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
    public partial class notify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string uid = Session["uid"].ToString();
            Details info = fetchDetails(uid);
            int bname = info.Branch;
            PostApprovals.SelectCommand = "SELECT uid,title,des,vid,date FROM Table_Post Where status=3 and branch="+bname+" ORDER BY [date] DESC";
            string approve = Request.QueryString["approve"];
            string reject = Request.QueryString["reject"];
            if(approve !=null)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
                conn.Open();
                try
                {
                    SqlCommand myCommand = new SqlCommand("update Table_Post set status=1,aid='"+uid+"' where vid = '"+approve+"'", conn);
                    myCommand.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Approved Successfully!')", true);
                    ClientScript.RegisterStartupScript(GetType(), "Load", "<script type='text/javascript'>window.parent.location.href = 'Homepage.aspx?from=2'; </script>");
                }
                catch (Exception ec)
                {
                    Response.Write(ec.ToString());
                }
                conn.Close();
            }

            if(reject!=null)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
                conn.Open();
                try
                {
                    SqlCommand myCommand = new SqlCommand("update Table_Post set status=5 where vid = '" + reject + "'", conn);
                    myCommand.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Rejected Successfully!')", true);
                    ClientScript.RegisterStartupScript(GetType(), "Load", "<script type='text/javascript'>window.parent.location.href = 'Homepage.aspx?from=2'; </script>");
                }
                catch (Exception ec)
                {
                    Response.Write(ec.ToString());
                }
                conn.Close();
            }
            
        }

        protected int getCount(int bname)
        {
            int count = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("SELECT Count(*) from Table_Post Where status=3 and branch=" + bname, conn);
                count = (Int32)myCommand.ExecuteScalar();
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return count;
        }

        protected Details fetchDetails(string uid)
        {
            Details list = null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("select * from Reg_Details_Table WHERE uid=@uid", conn);
                myCommand.Parameters.AddWithValue("@uid", uid);
                SqlDataReader dataReader = myCommand.ExecuteReader();
                if (dataReader.Read())
                {
                    
                    list = new Details(dataReader.GetString(1), dataReader.GetInt32(2), dataReader.GetInt32(3));
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
            return list;
        }
    }
}