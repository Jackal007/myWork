<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="newsList.aspx.cs" Inherits="news.newsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>店内特</title>
    <link rel="stylesheet" media="all" href="./css/topbar1.css" />
    <link rel="stylesheet" media="all" href="./css/topbar2.css" />
    <link rel="stylesheet" media="all" href="./css/topbar3.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
            <!-- aside -->
            <div class="user-aside span3">
                <div class="people">
                    <div class="basic-info">
                        <h3>
                            <asp:Label ID="catagory" runat="server"></asp:Label>
                        </h3>
                        <div class="btn-group">
                            <div class="btn btn-small btn-success follow">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/home.aspx"><span>回到首页</span></asp:HyperLink>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
            <!-- content -->
            <div class="span9 offset3 recent-post">
                <div class="tab-content">

                    <div id="list-container" class="tab-pane active">
                        <ul class="article-list latest-notes" id="news" runat="server">
                            <li class="have-img">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
</asp:Content>
