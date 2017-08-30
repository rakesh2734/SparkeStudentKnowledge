<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendEmail.aspx.cs" Inherits="Sparkle.SendEmail" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
<title>Forgot Password</title>
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, font, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td 
{
margin: 0;
padding: 0;
border: 0;
outline: 0;
overflow-x:hidden;
font-size: 100%;
vertical-align: baseline;
background: transparent;
}

body{
background:url("/images/bg.jpg") no-repeat center fixed;	
color: #000;
font: 14px Arial;
margin: 0;
padding: 0;
overflow-x:hidden;
-webkit-background-size: cover; 
-moz-background-size: cover;    
-o-background-size: cover;      
background-size: cover;
position: relative;
}

.mail{
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
-ms-border-radius: 3px;
-o-border-radius: 3px;
border-radius: 3px;
-webkit-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
-moz-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
-ms-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
-o-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
-webkit-transition: all 0.5s ease;
-moz-transition: all 0.5s ease;
-ms-transition: all 0.5s ease;
-o-transition: all 0.5s ease;
transition: all 0.5s ease;
background-color: #fff;
border: 1px solid #c8c8c8;
color: #777;
text-align:left;
font: 13px Helvetica, Arial, sans-serif;
margin:0 auto;
padding: 9px 10px 9px 10px;
width:30%;
}

.auto-style1 {
        font-size: medium;
        font-family: Cambria;
        vertical-align:middle;
        width:100%;
        height:60px;
        padding-left:40px;
        padding-top:15px;
        background-color:#000;
}

.auto-atyle1:hover{
    cursor:pointer;
}

.mail:focus {
-webkit-box-shadow: 0 0 2px #39f inset;
-moz-box-shadow: 0 0 2px #39f inset;
-ms-box-shadow: 0 0 2px #39f inset;
-o-box-shadow: 0 0 2px #39f inset;
box-shadow: 0 0 2px #39f inset;
background-color: #fff;
border: 1px solid #39f;
outline: none;
}
</style>
</head>
<body>
   <div class="auto-style1">
       <a href="LoginScreen.aspx" style="color:#fff; font-size:25px;  text-decoration:none; font-weight:normal; ">Sparkle</a>
       <p style="color:#fff; font-size:12px; font-weight:normal;">Online Knowledge Sharing Site</p>
    </div>
    <form id="form1" runat="server">
        <div style="text-align: center; width: 100%; height: 100%; vertical-align: middle;">
            <h2 style="margin-left: auto; margin-right: auto; font-size: 30px; text-shadow: 1px 1px 10px 2px #333; color: #fff; margin-top: 250px">Password will be sent to your registered email id</h2>
            <br />
            <asp:TextBox runat="server" CssClass="mail" AutoCompleteType="Email" placeholder="Enter Email Address" ID="email" OnTextChanged="Send_EMail" />
            <asp:Button runat="server" OnClick="Send_EMail" Style="background-color: #39f; border: none; border-radius: 3px; color: #fff; font-weight: bold; width: 100px; height: 40px;" Text="send" />
        </div>
    </form>
</body>
</html>