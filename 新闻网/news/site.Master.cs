using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace news
{
    public partial class site : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection("server=120.24.61.225;database=stuDB15;uid=stuDB15;pwd=stuDB15;MultipleActiveResultSets=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}