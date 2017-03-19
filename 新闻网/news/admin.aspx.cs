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
    public partial class admin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("server=120.24.61.225;database=stuDB15;uid=stuDB15;pwd=stuDB15;MultipleActiveResultSets=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            string sqlStatement = "select * from [News]";
            SqlCommand sqlComm = new SqlCommand(sqlStatement, conn);
            SqlDataReader dataReader = sqlComm.ExecuteReader();
            while (dataReader.Read())
            {
                HtmlGenericControl title = new HtmlGenericControl("td");
                title.InnerHtml = dataReader["NewsTitle"].ToString();

                HtmlGenericControl author = new HtmlGenericControl("td");
                author.InnerHtml = dataReader["NewsAuthor"].ToString();

                HtmlGenericControl publishTime = new HtmlGenericControl("td");
                publishTime.InnerHtml = dataReader["publishTime"].ToString();

                HtmlGenericControl edit = new HtmlGenericControl("a");
                edit.Attributes.Add("href", "./news.aspx?NewsID=" + dataReader["NewsID"]);
                edit.InnerHtml = "查看";

                HtmlGenericControl depart = new HtmlGenericControl("span");
                depart.InnerHtml = " | ";

                HtmlGenericControl delete = new HtmlGenericControl("a");
                delete.Attributes.Add("href", "./admin.aspx?NewsID=" + dataReader["NewsID"]);
                delete.InnerHtml = " 删除";

                HtmlGenericControl operation = new HtmlGenericControl("td");
                operation.Controls.Add(edit);
                operation.Controls.Add(depart);
                operation.Controls.Add(delete);

                HtmlGenericControl row = new HtmlGenericControl("tr");
                row.Controls.Add(title);
                row.Controls.Add(author);
                row.Controls.Add(publishTime);
                row.Controls.Add(operation);

                newsList.Controls.Add(row);
            }


            try
            {
                string NewsID = Request.QueryString["NewsID"];
                sqlStatement = "delete from [News] where NewsID='" + NewsID + "'";
                sqlComm = new SqlCommand(sqlStatement, conn);
                int f = sqlComm.ExecuteNonQuery();
            }
            catch (Exception ee)
            {

            }
            finally { }

            conn.Close();
        }
    }
}