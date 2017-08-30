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
    public partial class PostPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int ch = int.Parse(Session["search"].ToString());
                all2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                all2.BackColor = System.Drawing.ColorTranslator.FromHtml("#39f");
                if (ch != 1)
                {
                    SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b where a.status=1 and a.uid=b.uid ORDER BY date DESC";
                }
                else
                {
                    Session["search"] = 2;
                    try
                    {
                        string search_text_input = Request.QueryString["search"];
                        if (search_text_input.Length > 0)
                        {
                            string[] parts = search_text_input.Split(' ');
                            String query = string.Empty;
                            for (int i = 0; i < parts.Length; i++)
                            {
                                if (i == parts.Length - 1)
                                {
                                    query += "SELECT vid,title,date,dimage FROM [Table_Post] where status=1 and tags LIKE '%" + parts[i] + "%'";
                                }
                                else
                                {
                                    query += "SELECT vid,title,date,dimage FROM [Table_Post] where status=1 and tags LIKE '%" + parts[i] + "%' union ";
                                }
                            }
                            SqlDataSource.SelectCommand = query + " ORDER BY date DESC";
                        }
                        else
                        {
                            SqlDataSource.SelectCommand = "SELECT des,username,vid,title,date,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b where a.uid=b.uid and status=1 ORDER BY date DESC";
                        }
                    }
                    catch (NullReferenceException ne)
                    {
                        Response.Write(ne);
                    }
                }
            }
            catch(NullReferenceException)
            {
                Response.Redirect("LoginScreen.aspx");
            }
        }
        public int getCount(string stext)
        {
            int x = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("SELECT count(*) FROM [Table_Post] WHERE title LIKE '%" + stext + "%' OR des LIKE '%"+stext+"%'", conn);
                x = (int) myCommand.ExecuteScalar();
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
            return x;
        }

        protected void it_Click(object sender, EventArgs e)
        {
            clear(it);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE a.uid=b.uid and status=1 and a.branch=" + 1 + " ORDER BY date DESC";   
        }

        protected void ecm_Click(object sender, EventArgs e)
        {
            clear(ecm);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE a.uid=b.uid and status=1 and a.branch=" + 0 + " ORDER BY date DESC";  
        }

        protected void cse_Click(object sender, EventArgs e)
        {
            clear(cse);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE a.uid=b.uid and status=1 and a.branch=" + 3 + " ORDER BY date DESC";  
        }

        protected void eie_Click(object sender, EventArgs e)
        {
            clear(eie);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE a.uid=b.uid and status=1 and a.branch=" + 8 + " ORDER BY date DESC";
        }

        protected void eee_Click(object sender, EventArgs e)
        {
            clear(eee);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE  a.uid=b.uid and status=1 and a.branch=" + 4 + " ORDER BY date DESC";  
        }

        protected void civil_Click(object sender, EventArgs e)
        {
            clear(civil);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE a.uid=b.uid and status=1 and a.branch=" + 6 + " ORDER BY date DESC";  
        }

        protected void mech_Click(object sender, EventArgs e)
        {
            clear(mech);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE a.uid=b.uid and status=1 and a.branch=" + 5 + " ORDER BY date DESC";  
        }

        protected void bio_Click(object sender, EventArgs e)
        {
            clear(bio);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE a.uid=b.uid and status=1 and a.branch=" + 7 + " ORDER BY date DESC"; 
        }

        protected void ece_Click(object sender, EventArgs e)
        {
            clear(ece);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b WHERE a.uid=b.uid and status=1 and a.branch=" + 2 + " ORDER BY date DESC"; 
        }

        public void clear(Button b)
        {
            ecm.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            it.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            ece.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            bio.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            mech.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            civil.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            cse.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            eie.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            eee.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            ecm.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            it.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            ece.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            bio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            mech.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            civil.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            cse.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            eie.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            eee.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            all2.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            all2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#888");
            b.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            b.BackColor = System.Drawing.ColorTranslator.FromHtml("#39f");
        }

        protected void all_Click(object sender, EventArgs e)
        {
            clear(all2);
            SqlDataSource.SelectCommand = "SELECT username,vid,title,date,des,url,dimage FROM [Table_Post] a,[Reg_Details_Table] b where a.uid=b.uid and a.status=1 ORDER by date DESC";  
        }
    }
}