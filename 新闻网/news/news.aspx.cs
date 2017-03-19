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
    public partial class news : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("server=120.24.61.225;database=stuDB15;uid=stuDB15;pwd=stuDB15;MultipleActiveResultSets=true;");

        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            string NewsID = Request.QueryString["NewsID"];
            string sqlStatement = "select * from [News] where NewsID ='" + NewsID + "'";
            SqlCommand sqlComm = new SqlCommand(sqlStatement, conn);
            SqlDataReader dataReader = sqlComm.ExecuteReader();
            while (dataReader.Read())
            {

                HtmlGenericControl title = new HtmlGenericControl("p");
                title.InnerHtml = dataReader["NewsTitle"].ToString() + "<br/>";

                HtmlGenericControl author = new HtmlGenericControl("p");
                author.InnerHtml = dataReader["NewsAuthor"].ToString() + "<br/>";

                HtmlGenericControl publishTime = new HtmlGenericControl("p");
                publishTime.InnerHtml = dataReader["PublishTime"].ToString() + "<br/>";

                HtmlGenericControl content = new HtmlGenericControl("p");
                content.InnerHtml = dataReader["NewsContent"].ToString();

                passage.Controls.Add(title);
                passage.Controls.Add(author);
                passage.Controls.Add(publishTime);
                passage.Controls.Add(content);
            }
            conn.Close();
        }

    }
}