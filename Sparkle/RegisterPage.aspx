<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="Sparkle.RegisterPage" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->  <!--<![endif]-->
<html LANG="en">
<head runat="server">
    <title>Sparkle</title>
    <script>
        function login()
        {
            window.location = "LoginScreen.aspx";
        }
    </script>
    <style>
        a:hover{
            cursor:pointer;
        }

        body{

        }

    </style>
     <link rel="stylesheet" type="text/css" href="RegisterStyle.css" />
</head>
<body>
      <div class="auto-style1">
       <a href="home.aspx" style="color:#fff; font-size:25px;  text-decoration:none; font-weight:normal; ">Sparkle</a>
       <p style="color:#fff; font-size:12px; font-weight:normal;">Online Knowledge Sharing Site</p>
    </div>
<div class="container">
	<section id="content">
		<form name="reg" runat="server" id="asdf">
             <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
			<h1>Register</h1>
			<div>
				<asp:TextBox runat="server"  placeholder="Username" required="" id="uname" ></asp:TextBox>
			</div>
            <div>
				<asp:TextBox  runat="server" placeholder="email" required="" id="emailid" ></asp:TextBox>
			</div>
			<div>
				<asp:TextBox TextMode="Password" runat="server" placeholder="Password" required="" id="pass"></asp:TextBox>
			</div>
            <div>
				<asp:TextBox TextMode="Password" runat="server" placeholder="Confirm Password" required="" id="cpass" />
            </div>
            <div>
                 <asp:DropDownList  id="bch" runat="server" title="Select  Branch" required=""><asp:ListItem Text="ECM" Value="0"/>
                  <asp:ListItem Text="IT" Value="1"/>
                  <asp:ListItem Text="ECE" Value="2"/>
                  <asp:ListItem Text="CSE" Value="3"/>
                  <asp:ListItem Text="EEE" Value="4"/>
                  <asp:ListItem Text="MEC" Value="5"/>
                  <asp:ListItem Text="CIV" Value="6"/>
                  <asp:ListItem Text="BT" Value="7"/>
                  <asp:ListItem Text="EIE" Value="8"/>
              </asp:DropDownList>
            </div>
            <div>
              <asp:CheckBox  runat="server"  OnCheckedChanged="checkit_CheckedChanged"  AutoPostBack="true" id="checkit" Text="Click here to Register as Faculty" />
			</div>
            <div>
				<asp:TextBox TextMode="Password" Visible="false" runat="server" placeholder="Admin Password" required="" id="adminpwd" />
            </div>
             <div>
				<asp:Button id="sign" runat="server" Text="Sign Up" value="Sign Up" OnClick="sign_button" />
			</div>
              </ContentTemplate>
         </asp:UpdatePanel>
		</form><!-- form -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>