using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sparkle
{
    public partial class home : System.Web.UI.Page
    {
        public String email = String.Empty, pass = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["search"] = 2;
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            //Response.Cache.SetNoStore();
        }

        //----contact us--------

        protected void Send_EMail(object sender, EventArgs e)
        {
            string fromu = fromuser.Text;
            string frome = frommail.Text;
            string messbody = messagebody.Text+" \nRegards\n"+fromu+"("+frome+")";
            //var message = new StringBuilder();
            // message.AppendFormat("Hello,\nYour password is :" + password + "\nclick here to login http://localhost:53420/LoginScreen.aspx \n\n\n regards,\nSparkle Team");
            SmtpClient smtpClient = new SmtpClient();
            MailMessage m = new MailMessage(
               frome, // From
                 "sparklethetool@gmail.com", // To
                "Feedback Regarding ", // Subject
                messbody); // Body
            smtpClient.EnableSsl = true;
            smtpClient.Send(m);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thanks,We Succesfully Received your Mail,We get back to you Shortly')", true);
        }

    }
}