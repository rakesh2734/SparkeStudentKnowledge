<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginScreen.aspx.cs" Inherits="Sparkle.LoginScreen" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->  <!--<![endif]-->
<html LANG="en">
<head runat="server">
<meta charset="utf-8">
    <title>Sparkle | Online knowledge sharing site</title>
    <link rel="stylesheet" type="text/css" href="LoginScreenStyle.css" />
    <script>
        window.history.forward(1);
    </script>
    <style>
        a:hover
        {
            cursor:pointer;
        }
    </style>
</head>
<body>
    <div class="auto-style1">
       <a href="home.aspx" style="color:#fff; font-size:25px;  text-decoration:none; font-weight:normal; ">Sparkle</a>
       <p style="color:#fff; font-size:12px; font-weight:normal;">Online Knowledge Sharing Site</p>
    </div>
<div class="container">
	<section id="content">
		<form  runat="server">
			<h1>Login</h1>
			<div>
				<asp:TextBox runat="server"  AutoCompleteType="Email" placeholder="Email" required="" id="username" />
			</div>
			<div>
				<asp:TextBox runat="server"  AutoCompleteType="Disabled" TextMode="password" OnTextChanged="password_TextChanged" placeholder="Password" required="" id="password" />
			</div>
			<div>
				<asp:Button runat="server" Text="Log in" ID="submit" OnClick="Button1_Click" />
				<a href="SendEmail.aspx">Lost your password?</a>
			</div>
		</form><!-- form -->
		<div class="button">
			<a href="RegisterPage.aspx">New to Sparkle? Register Here</a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>