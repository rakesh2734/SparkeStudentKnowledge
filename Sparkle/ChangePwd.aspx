<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="Sparkle.ChangePwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style>
        body {
            text-align: center;
            background-color: #fff;
        }

        .textbox {
            background-color: #fff;
            border: 1px solid #bbb;
            -webkit-transition: all 0.5s ease;
            -moz-transition: all 0.5s ease;
            -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
            transition: all 0.5s ease;
            color: #666;
            font: 13px Helvetica, Arial, sans-serif;
            margin: 0 0 10px;
            padding:10px;
            width: 100%;
        }

            .textbox:focus {
                -webkit-box-shadow: 0 0 2px #39f inset;
                -moz-box-shadow: 0 0 2px #39f inset;
                -ms-box-shadow: 0 0 2px #39f inset;
                -o-box-shadow: 0 0 2px #39f inset;
                box-shadow: 0 0 2px #39f inset;
                background-color: #fff;
                border: 1px solid #39f;
                outline: none;
            }

        .button {
            padding: 10px 25px;
            background-color: #39f;
            color: #fff;
            margin-top: 20px;
            font-size: small;
            box-shadow: 1px 1px 2px #333;
            border-radius: 5px;
            border: 0;
            font-weight: normal;
        }
       

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:40%; box-shadow:2px 2px 18px 2px #888; padding:20px; margin:130px auto;">
            <asp:TextBox ID="opwd" runat="server" required="" TextMode="Password" placeholder="Old Password" CssClass="textbox" /><br />
            <asp:TextBox ID="npwd" runat="server" TextMode="Password"  required="" placeholder="New Password" CssClass="textbox" /><br />
             <asp:TextBox ID="cpwd" runat="server" required="" TextMode="Password" placeholder="Confirm Password" CssClass="textbox" /><br />
            <asp:Button ID="pwdbtn"  runat="server" Text="Change Password" CssClass="btn btn-primary" OnClick="pwdbtn_Click"></asp:Button>
        </div>
    </form>
</body>
</html>
