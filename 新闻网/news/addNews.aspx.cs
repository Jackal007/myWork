using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace news
{
    public partial class addNews : System.Web.UI.Page
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
                this.catagoryID.Items.Add(dataReader["catagoryName"].ToString() + dataReader["catagoryID"].ToString());
            }

            conn.Close();
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            conn.Close();
        }

        protected void send_click(object sender, EventArgs e)
        {
            conn.Open();
            string title = this.title.Text.Trim();
            string author = "me";
            string catagoryID = this.catagoryID.Text.Trim();
            catagoryID = catagoryID.Substring(catagoryID.Length - 3);
            string content = this.content.Text;
            System.Guid guid = System.Guid.NewGuid();
            string newsID = System.Guid.NewGuid().ToString();
            newsID = newsID.Remove(0, newsID.Length - 10);

            string sqlStatement = "insert into News (NewsID,NewsTitle,PublishTime,CatagoryID,NewsAuthor,NewsContent,KeyWords,State) values('" + newsID + "','" + title + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + catagoryID + "','" + author + "','" + content + "','1',1)";
            //Response.Write(sqlStatement);
            SqlCommand sqlComm = new SqlCommand(sqlStatement, conn);
            sqlComm.ExecuteNonQuery();
            Response.Redirect("admin.aspx");
            conn.Close();
        }
    }
}