using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Sparkle
{
    public partial class upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            uploadb.Enabled = true;
        }

        protected void uploadb_Click(object sender, EventArgs e)
        {
            string path = string.Empty;
            bool isPosted = false;
            string ipath =string.Empty;
            if (url.Text.Length > 0)
            {
                isPosted = true;
                path = "https://youtube.com/embed/"+url.Text.ToString().Split('?')[1].Substring(2);
                ipath= "http://img.youtube.com/vi/" + url.Text.ToString().Split('?')[1].Substring(2) + "/hqdefault.jpg";
            }
            else
            {
                uploadb.Enabled = false;
                ipath = "images/portfolio-2.jpg";
                int count = 0;
                if (uploadfile.PostedFile != null)
                {
                    string ext = System.IO.Path.GetExtension(uploadfile.FileName);
                    string[] allowedExtenstions = new string[] { ".mp4", ".wmv", ".avi" };
                    if (allowedExtenstions.Contains(ext))
                    {
                        DirectoryInfo obj = new DirectoryInfo(Server.MapPath("~/videos/"));
                        count = obj.GetFiles().Count() + 1;
                        path = "~/videos/sparkle" + count + ext;
                        uploadfile.SaveAs(Server.MapPath(path));
                    }
                    else
                    {
                        Response.Write("Unsupported format");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Unsupported File Format\rTry uploading .mp4,.avi')", true);
                    }
                }
                else
                {
                    Response.Write("no such file");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('please choose video file to upload')", true);
                }

                if (new DirectoryInfo(Server.MapPath("~/videos/")).GetFiles().Count() == count)
                {
                    isPosted = true;
                }
            }
            if (isPosted)
            {
                DateTime dt = DateTime.Now;
                string title_s = title.Text;
                string desc_s = desc.Text;
                string vid = "video" + Guid.NewGuid();
                string uid = Session["uid"].ToString();
                int branch = bch.SelectedIndex;
                string final_tags = tags.Text;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
                try
                {
                    string _query = "INSERT INTO [Table_Post](uid,vid,aid,title,des,branch,url,date,status,tags,dimage) values (@uid,@vid,@aid,@title,@des,@branch,@url,@date,3,@tagst,@ipath)";
                    conn.Open();
                    string gid = Guid.NewGuid().ToString();
                    SqlCommand comm = new SqlCommand(_query, conn);
                    comm.Parameters.AddWithValue("@uid", uid);
                    comm.Parameters.AddWithValue("@vid", vid);
                    comm.Parameters.AddWithValue("@aid", "");
                    comm.Parameters.AddWithValue("@title", title_s);
                    comm.Parameters.AddWithValue("@des", desc_s);
                    comm.Parameters.AddWithValue("@branch", branch);
                    comm.Parameters.AddWithValue("@url", path);
                    comm.Parameters.AddWithValue("@ipath",ipath);
                    comm.Parameters.AddWithValue("@date", dt);
                    comm.Parameters.AddWithValue("@tagst", final_tags);
                    comm.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"alertMessage","alert('successfully uploaded ')", true);
                }
                catch (SqlException ex)
                {
                    Response.Write("" + ex.ToString());
                    ScriptManager.RegisterClientScriptBlock(this,this.GetType(), "alertMessage", "alert('Error ! try again Later')", true);
                }
                conn.Close();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Problem Uploading,Maximum Length Exceeded')", true);

            }
            uploadb.Enabled = true;
        }

    }
}