using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sparkle
{
    public partial class SendEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public void sendMail(string toUser,string password)
        {
            var message = new StringBuilder();
            message.AppendFormat("Hello,\nYour password is :" + password + "\nclick here to login http://localhost:53420/LoginScreen.aspx \n\n\n regards,\nSparkle Team");
          
            SmtpClient smtpClient = new SmtpClient();
            MailMessage m = new MailMessage(
                "sparklethetool@gmail.com", // From
                toUser, // To
                "Password to your Sparkle Account", // Subject
                message.ToString()); // Body
            smtpClient.EnableSsl = true;
            smtpClient.Send(m);
        }

        protected void Send_EMail(object sender, EventArgs e)
        {
            perform();
        }

        protected void perform()
        {
            string emailid = email.Text;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SparkleConnectionString"].ConnectionString);
            conn.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand("select * from Login_Table WHERE email=@email", conn);
                myCommand.Parameters.AddWithValue("@email", emailid);
                SqlDataReader dataReader = myCommand.ExecuteReader();
                if (dataReader.Read())
                {
                    sendMail(emailid,dataReader.GetString(2));
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Email Id')", true);
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password Succesfully Sent to your Mail')", true);
                Response.Redirect("LoginScreen.aspx");
            }
            catch (Exception ec)
            {
                Response.Write(ec.ToString());
            }
            conn.Close();
        }
    }
}