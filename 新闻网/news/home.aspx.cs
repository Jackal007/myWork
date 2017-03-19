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
    public partial class home : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("server=120.24.61.225;database=stuDB15;uid=stuDB15;pwd=stuDB15;MultipleActiveResultSets=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            //show the catagory
            string sqlStatement = "select * from [Catagory]";
            SqlCommand sqlComm = new SqlCommand(sqlStatement, conn);
            SqlDataReader dataReader = sqlComm.ExecuteReader();
            while (dataReader.Read())
            {
                HtmlGenericControl link = new HtmlGenericControl("a");
                link.Attributes.Add("href", "./newsList.aspx?catagoryID=" + dataReader["catagoryID"]);
                link.InnerHtml = dataReader["catagoryName"].ToString();

                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes.Add("class", "bonus");
                li.Controls.Add(link);

                catagory.Controls.Add(li);
            }

            //show the top news
            sqlStatement = "select * from News";
            sqlComm = new SqlCommand(sqlStatement, conn);
            dataReader = sqlComm.ExecuteReader();
            while (dataReader.Read())
            {
                HtmlGenericControl link = new HtmlGenericControl("a");
                link.Attributes.Add("class", "author-name blue-link");
                link.Attributes.Add("href", "./news.aspx?NewsID=" + dataReader["NewsID"]);
                link.InnerHtml = dataReader["NewsTitle"].ToString();

                //title
                HtmlGenericControl Title = new HtmlGenericControl("h4");
                Title.Attributes.Add("class", "title");
                Title.Controls.Add(link);

                //author
                HtmlGenericControl author = new HtmlGenericControl("a");
                author.Attributes.Add("class", "author-name blue-link");
                author.InnerHtml = dataReader["NewsAuthor"].ToString();

                //publishTime
                HtmlGenericControl publishTime = new HtmlGenericControl("span");
                publishTime.Attributes.Add("class", "time");
                publishTime.InnerHtml = dataReader["PublishTime"].ToString();

                HtmlGenericControl p = new HtmlGenericControl("p");
                p.Attributes.Add("class", "list-top");
                p.Controls.Add(author);
                p.Controls.Add(publishTime);
                p.Controls.Add(Title);

                HtmlGenericControl news = new HtmlGenericControl("div");
                news.Controls.Add(p);

                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes.Add("class", "have-img");
                li.Controls.Add(news);

                topNews.Controls.Add(li);
            }
            conn.Close();
        }
    }
}