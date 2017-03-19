<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="addNews.aspx.cs" Inherits="news.addNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="30" align="center">添加文章</td>
            </tr>
            <tr>
                <td height="30">文章分类:
                        <asp:DropDownList ID="catagoryID" runat="server">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="30">文章标题:
      <asp:TextBox ID="title" runat="server" />
                    <asp:RequiredFieldValidator ID="v1" ControlToValidate="title" runat="server" Text="标题不能为空" />
                </td>
            </tr>
            <tr>
                <td height="30">文章内容:
      <asp:TextBox TextMode="multiline" ID="content" Columns="70" Rows="15" runat="server" />
                    <asp:RequiredFieldValidator ID="v2" ControlToValidate="content" runat="server" Text="内容不能为空" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="publish" Text="发表" runat="server" OnClick="send_click" />
                </td>
            </tr>
        </table>
</asp:Content>
