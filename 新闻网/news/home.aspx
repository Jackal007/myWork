<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="news.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" media="all" href="./css/topbar1.css" />
    <link rel="stylesheet" media="all" href="./css/topbar2.css" />
    <link rel="stylesheet" media="all" href="./css/topbar3.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">

        <div class="recommended">
            <!-- aside -->
            <div class="span3 left-aside">
                <div class="cover-img" style="background-image: url(./css/homeBackground.png)"></div>

            </div>

            <div class="span7 offset3">
                <div class="page-title" style="width: 749px;">
                    <ul id="catagory" runat="server" class="recommened-nav navigation clearfix" data-container="#list-container" data-loader=".loader-tiny" data-user-slug="">
                        <li class="active">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#">主页</asp:HyperLink>
                        </li>
                    </ul>
                </div>
                <div id="list-container">
                    <div style="height: 30px;"></div>
                    <ul class="article-list thumbnails" id="topNews" runat="server">
                    </ul>
                </div>
            </div>
        </div>

        <div id="time-machine-modal" class="modal hide fade share-weixin-modal time-machine-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-stats2015-url="http://localhost/stats2015">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
        </div>

    </div>
</asp:Content>
