using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace news
{
    public partial class adminLogin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("server=120.24.61.225;database=stuDB15;uid=stuDB15;pwd=stuDB15;MultipleActiveResultSets=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
        }
        protected void loginSuccess(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }
        protected void loginFailed(object sender, EventArgs e)
        {
            Response.Redirect("loginFail.html");
        }
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select count(*) from Admin where AdminID = @u and AdminPw = @p";
            SqlParameter param;
            param = new SqlParameter("@u", Login1.UserName);
            cmd.Parameters.Add(param);
            param = new SqlParameter("@p", Login1.Password);
            cmd.Parameters.Add(param);
            int n = (int)cmd.ExecuteScalar();
            conn.Close();
            if (n > 0)
                e.Authenticated = true;
            else
                e.Authenticated = false;
        }
    }
}