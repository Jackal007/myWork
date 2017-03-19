<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="news.news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>点内特</title>
    <link rel="stylesheet" media="all" href="./css/topbar1.css" />
    <link rel="stylesheet" media="all" href="./css/topbar2.css" />
    <link rel="stylesheet" media="all" href="./css/topbar3.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
            <div class="related-avatar-group activities"></div>
            <div class="article">
                <div class="preview">
                    <div class="author-info">
                        <div class="btn btn-small btn-success follow">
                            <a data-signin-link="true" data-toggle="modal" href="home.aspx"><span>回到首页</span></a>
                        </div>

                        <div class="show-content" id="passage" runat="server">
                            
                        </div>
                    </div>
                </div>


            </div>
</asp:Content>
