<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="news.adminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">

            <div class="login-page">
                <div id="pjax-container">
                    <div class="sign-in">

                        <div class="input-prepend domestic " style="margin-left: 280px">
                            <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="15px" ForeColor="#333333" Height="224px" Width="275px" OnAuthenticate="Login1_Authenticate" OnLoggedIn="loginSuccess" OnLoginError="loginFailed">
                                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                                <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="15px" ForeColor="#284E98" />
                                <TextBoxStyle Font-Size="15px" />
                                <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="15px" ForeColor="White" />
                            </asp:Login>
                        </div>

                        <input type="hidden" name="sign_in[is_foreign]" id="sign_in_is_foreign" value="false">
                    </div>

                </div>

            </div>

        </div>
</asp:Content>
