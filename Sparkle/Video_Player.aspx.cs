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
    public partial class Video_Player : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            Video_Details vd = getDetails(id);
            video_id1.Src = vd.Url+"?autoplay=0;";
            title.Text = vd.Title;
            description.Text = vd.Des;
            user.Text ="Posted by "+getName(id);
            if(!isLiked())
            {
                likebtn.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                likebtn.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                likebtn.Text = "like";
                likescount.Text = getLikes() + " people like this";
            }
            else
            {
                likebtn.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                likebtn.BackColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                likebtn.Text = "liked";
                if (getLikes() == 0)
                {
                    likescount.Text = "Be the first one to like";
                }
                else if(getLikes()==1)
                {
                    likescount.Text = " you like this";
                }
                else
                {
                    likescount.Text = " you and " + (getLikes() - 1) + " other people like this";
                }
            }
            List<string> parts = getTags(id);
            String query = string.Empty;
            for (int i = 0; i < parts.Count; i++)
            {
                if (i == parts.Count - 1)
                {
                    query += "SELECT vid,title,date,dimage FROM [Table_Post] where status=1 and tags LIKE '%" + parts[i] + "%'";
                }
                else
                {
                    query += "SELECT vid,title,date,dimage FROM [Table_Post] where status=1 and tags LIKE '%" + parts[i] + "%' union ";
                }
            }
            SqlDataSource2.SelectCommand = query + "except select vid,title,date,dimage from [Table_Post] where vid='" + id + "' ORDER BY date DESC ";
            CommentsData.SelectCommand = "select [username], [cid], [vid],[timeofpost],[vcomment] FROM [Table_Comments] a,[Reg_Details_Table] b where a.uid=b.uid and a.vid='" + id + "' ORDER BY [timeofpost] DESC";
        }

        protected List<string> getTags(string vid)
        {
            List<string> tags = new List<string>();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("select [tags] from [Table_Post] where vid='" + vid + "'", conn);
                SqlDataReader dataReader = myCommand.ExecuteReader();
                if (dataReader.Read())
                {
                   tags= dataReader.GetString(0).ToString().Split(',').ToList<string>();
                }
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return tags; 
        }

        protected string getName(string vid)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("select [username] from [Reg_Details_Table] where uid in (select uid from [Table_Post] where vid='" + vid + "');", conn);
                SqlDataReader dataReader = myCommand.ExecuteReader();
                if (dataReader.Read())
                {
                    return dataReader.GetString(0).ToString();
                }
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return "Unkown User";
        }

        protected int getLikes()
        {
            int likes = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("select count(*) from Table_Likes WHERE vid=@vid and status=1", conn);
                myCommand.Parameters.AddWithValue("@vid", Request.QueryString["id"]);
                likes =(int) myCommand.ExecuteScalar();
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return likes;
        }

        protected Video_Details getDetails(string id)
        {
            Video_Details vd = null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("SELECT url,title,des FROM [Table_Post] WHERE vid ='" + id + "'", conn);
                SqlDataReader dataReader = myCommand.ExecuteReader();
                if (dataReader.Read())
                {
                    vd = new Video_Details(dataReader.GetString(0), dataReader.GetString(1), dataReader.GetString(2));
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
            return vd;
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            postComment();
        }

        protected void postComment()
        {
            if (comment.Text.ToString().Length > 0)
            {
                string cmt = comment.Text;
                string uid = Session["uid"].ToString();
                string vid = Request.QueryString["id"];
                string cid = Guid.NewGuid().ToString();
                DateTime dt = DateTime.Now;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
                try
                {
                    string _query = "INSERT INTO [Table_Comments](cid,uid,vid,timeofpost,vcomment) values (@cid,@uid,@vid,@t,@cmt);";
                    conn.Open();
                    SqlCommand comm = new SqlCommand(_query, conn);
                    comm.Parameters.AddWithValue("@cid", cid);
                    comm.Parameters.AddWithValue("@vid", vid);
                    comm.Parameters.AddWithValue("@uid", uid);
                    comm.Parameters.AddWithValue("@t", dt);
                    comm.Parameters.AddWithValue("@cmt", cmt);
                    comm.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    Response.Write("" + ex.ToString());
                }
                conn.Close();
                DataList1.DataBind();
                comment.Text = "";
            }
            else
            {
            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
           if(isLiked())
           {
               like(0);
               likebtn.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
               likebtn.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
               likebtn.Text = "like";
               likescount.Text = getLikes() + " people like this";
           }
           else
           {
               like(1);
               likebtn.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
               likebtn.BackColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
               likebtn.Text = "liked";
               if (getLikes() == 0)
               {
                   likescount.Text = "Be the first one to like";
               }
               else if (getLikes() == 1)
               {
                   likescount.Text = " you like this";
               }
               else
               {
                   likescount.Text = " you and " + (getLikes()-1) + " other people like this";
               }
           }
        }

        public void like(int l)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("update Table_Likes set status="+l+" WHERE uid=@uid AND vid=@vid", conn);
                myCommand.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                myCommand.Parameters.AddWithValue("@vid", Request.QueryString["id"]);
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
        }



        protected bool isLiked()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("select status from Table_Likes WHERE uid=@uid AND vid=@vid", conn);
                myCommand.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                myCommand.Parameters.AddWithValue("@vid",Request.QueryString["id"]);

                SqlDataReader dataReader = myCommand.ExecuteReader();
                if (dataReader.Read())
                {
                    int like=dataReader.GetInt32(0);
                    if (like == 1)
                    {
                        conn.Close();
                        return true;
                    }
                    else
                    {
                        conn.Close();
                        return false;
                    }
                }
                else
                {
                    firstlike();
                    conn.Close();
                    return false;
                }
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return false;
        }

        public void firstlike()
        {
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn1.Open();
            try
            {
                string lid = Guid.NewGuid().ToString();
                SqlCommand myCommand1 = new SqlCommand("insert into Table_Likes(lid,uid,vid,status) values(@lid,@uid,@vid,@status)", conn1);
                myCommand1.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                myCommand1.Parameters.AddWithValue("@vid", Request.QueryString["id"]);
                myCommand1.Parameters.AddWithValue("@lid", lid);
                myCommand1.Parameters.AddWithValue("@status", 0);
                myCommand1.ExecuteNonQuery();
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn1.Close();
        }

        protected void comment_TextChanged(object sender, EventArgs e)
        {
        }
    }

  
    public class Video_Details
    {
        public string url, title, des;
        public Video_Details(string url, string title, string des)
        {
            this.Url = url;
            this.Title = title;
            this.Des = des;
        }
        public string Url
        {
            set { url = value; }
            get { return url; }
        }
        public string Title
        {
            set { title = value; }
            get { return title; }
        }
        public string Des
        {
            set { des = value; }
            get { return des; }
        }
    }

}