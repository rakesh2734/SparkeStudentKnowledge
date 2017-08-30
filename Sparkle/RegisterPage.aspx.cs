using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Globalization;

namespace Sparkle
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        bool invalid = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            sign.Enabled = true;
        }

        public bool IsValidEmail(string strIn)
        {
            invalid = false;
            if (String.IsNullOrEmpty(strIn))
                return false;

            // Use IdnMapping class to convert Unicode domain names. 
            try
            {
                strIn = Regex.Replace(strIn, @"(@)(.+)$", this.DomainMapper,
                                      RegexOptions.None, TimeSpan.FromMilliseconds(200));
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
            }

            if (invalid)
                return false;

            // Return true if strIn is in valid e-mail format. 
            try
            {
                return Regex.IsMatch(strIn,
                      @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                      @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$",
                      RegexOptions.IgnoreCase, TimeSpan.FromMilliseconds(250));
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
            }
        }

        private string DomainMapper(Match match)
        {
            // IdnMapping class with default property values.
            IdnMapping idn = new IdnMapping();
            string domainName = match.Groups[2].Value;
            try
            {
                domainName = idn.GetAscii(domainName);
            }
            catch (ArgumentException)
            {
                invalid = true;
            }
            return match.Groups[1].Value + domainName;
        }

        protected void sign_button(object sender,EventArgs e)
        {
            sign.Enabled = false;
            string name = uname.Text;
            string p = pass.Text;
            string cp = cpass.Text;
            string em = emailid.Text;
            bool isFaculty=checkit.Checked;
            string bh = bch.SelectedValue;
            if (IsValidEmail(em))
            {
                if (p.Equals(cp))
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
                    try
                    {
                        string _query = "INSERT INTO [Login_Table](uid,email,password,active) values (@id,@email,@password,3);INSERT INTO [Reg_Details_Table](uid,username,branch,role) values (@id,@username,@branch,@role)";
                        conn.Open();
                        string gid = Guid.NewGuid().ToString();
                        SqlCommand comm = new SqlCommand(_query, conn);
                        comm.Parameters.AddWithValue("@id", gid);
                        comm.Parameters.AddWithValue("@email", em);
                        comm.Parameters.AddWithValue("@password", p);
                        comm.Parameters.AddWithValue("@username", name);
                        comm.Parameters.AddWithValue("@active", 3);
                        comm.Parameters.AddWithValue("@branch", bh);
                        if (isFaculty)
                        {
                            comm.Parameters.AddWithValue("@role", 2);
                        }
                        else
                        {
                            comm.Parameters.AddWithValue("@role", 3);
                        }
                        if(checkit.Checked)
                        {
                            if (isAdmin(adminpwd.Text))
                            {
                                comm.ExecuteNonQuery();
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('successfully registered')", true);
                                Response.Redirect("LoginScreen.aspx");
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid admin password')", true);
                            }
                        }
                        else{
                            comm.ExecuteNonQuery();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('successfully registered')", true);
                            Response.Redirect("LoginScreen.aspx");
                        }
                    }
                    catch (SqlException ex)
                    {
                        Console.Write("" + ex.ToString());
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error ! try again Later')", true);
                    }
                    conn.Close();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password Mismatch')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid email')", true);
            }
        }

        public bool isAdmin(string pwd)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("SELECT * from Login_Table Where uid = (select uid from Reg_Details_Table where role=1) and password = '"+pwd+"'", conn);
                SqlDataReader sdl = myCommand.ExecuteReader();
                if(sdl.Read())
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

        protected void checkit_CheckedChanged(object sender, EventArgs e)
        {
            if (checkit.Checked)
            {
                adminpwd.Visible = true;
            }
            else
            {
                adminpwd.Visible = false;
            }
        }

  
    }
}