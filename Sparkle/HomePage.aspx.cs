using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Sparkle
{
    public partial class HomePage : System.Web.UI.Page
    {
        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string[] GetCompletionList(string prefixText, int count, string contextKey)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["SparkleConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select title from [Table_Post] where " +
                    "tags like '%"+prefixText+"%'";
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> customers = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(sdr.GetString(0));
                        }
                    }
                    conn.Close();
                    string[] cust = customers.ToArray();
                    return cust;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string uid = Session["uid"].ToString();
            Details info = fetchDetails(uid);
            nameu.Text = "Hello, "+info.Name;
            try
            {
                if (Request.QueryString["from"].Length > 0)
                {
                    int from = Convert.ToInt32(Request.QueryString["from"]);
                    if (from == 2)
                    {
                        post.Attributes.Add("src", "notify.aspx");
                    }
                    else
                    {
                        post.Src = "PostPage.aspx?bch=" + info.Branch;
                    }
                }
            }
            catch(Exception ne)
            {
                Response.Write(ne);
            }
        }

        protected int getCount(int bname)
        {
            int count = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("SELECT Count(*) from Table_Post Where status=3 and branch="+bname, conn);
                count=(Int32) myCommand.ExecuteScalar();
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return count;
        }

        protected int getFCount()
        {
            int count = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("SELECT Count(*) from Reg_Details_Table Where role=2", conn);
                count = (Int32)myCommand.ExecuteScalar();
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return count;
        }

        protected  Details fetchDetails(string uid)
        {
            Details list=null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("select * from Reg_Details_Table WHERE uid=@uid", conn);
                myCommand.Parameters.AddWithValue("@uid", uid);
                SqlDataReader dataReader = myCommand.ExecuteReader();
                if (dataReader.Read())
                {
                   
                    int role = dataReader.GetInt32(3);
                    if (role == 2)
                    {
                        notifybt.Visible = true;
                        ncount.Visible = true;
                        ncount.Text = getCount(dataReader.GetInt32(2)) + "";
                        if (getCount(dataReader.GetInt32(2)) == 0)
                        {
                            ncount.Visible = false;
                        }
                        else
                        {
                            ncount.Visible = true;
                            ncount.Text = getCount(dataReader.GetInt32(2)) + "";
                        }
                       
                    }
                    else
                    {
                        notifybt.Visible = false;
                        ncount.Visible = false;
                    }
                   list= new Details(dataReader.GetString(1),dataReader.GetInt32(2),dataReader.GetInt32(3));
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

        protected void search_TextChanged(object sender, EventArgs e)
        {
            string search_text = search.Text;
            Session["search"] = 1;
            post.Attributes.Add("src", "PostPage.aspx?search=" + search_text);
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginScreen.aspx");
        }

        protected void name_Click(object sender, EventArgs e)
        {

        }

        protected void upload_Click(object sender, EventArgs e)
        {
            post.Attributes.Add("src", "upload.aspx");
        }

        protected void notify_Click(object sender, ImageClickEventArgs e)
        {
            post.Attributes.Add("src", "notify.aspx");
        }

        protected void name_Click(object sender, ImageClickEventArgs e)
        {
            post.Attributes.Add("src", "profile.aspx");
        }
    }

    public class Details
    {
        static string name;
        static int branch,role;
        public Details(string name,int branch,int role)
        {
            this.Name = name;
            this.Branch = branch;
            this.Role = role;
        }
        public string Name
        {
            set{ name = value; }
            get{ return name;}
        }
        public int Branch
        {
            set { branch = value; }
            get { return branch; }
        }

        public int Role
        {
            set { role = value; }
            get { return role; }
        }
    }
}