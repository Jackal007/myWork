<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="news.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>admin</title>
    <link rel="stylesheet" media="all" href="./css/topbar1.css" />
    <link rel="stylesheet" media="all" href="./css/topbar2.css" />
    <link rel="stylesheet" media="all" href="./css/topbar3.css" />
    <script>
        function reurl() {
            url = location.href;
            var times = url.split("?t=");
            if (times[1] != 1) {
                url += "?t=1";
                self.location.replace(url);
            }
        }
        onload = reurl
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="setting">
            <div class="tab-content">
                <div class="tab-pane active" id="sns">
                    <div class="control-group">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>标题</th>
                                    <th>作者</th>
                                    <th>发布时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="newsList" runat="server">
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <a href="addNews.aspx">添加新闻</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
