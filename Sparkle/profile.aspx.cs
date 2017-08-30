using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sparkle
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource.SelectCommand = "SELECT * FROM [Table_Post] where status=1 and vid in(select vid from Table_Likes a where a.status=1 and a.uid='"+Session["uid"].ToString()+"') ORDER BY date DESC";
            SqlDataSource1.SelectCommand = "Select * from [Table_Post] where status=1 and uid='"+Session["uid"].ToString()+"'";
        }

        protected void cpwd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePwd.aspx");
        }
    }
}