<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Sparkle.HomePage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sparkle Home</title>
    <link rel="stylesheet" type="text/css" href="HomePageStyle.css" />
    <script>
        window.history.forward(1);
    </script>
    <style>
        .completionList {
            border: solid 1px #37f;
            margin: 0px;
            padding:3px;
            height: 80px;
            position:fixed;
            overflow: auto;
            background-color: #FFFFFF;
        }

        .listItem {
            color: #191919;
            padding:5px;
        }

        .listItem.hover
        {
            background-color: #ADD6FF;
            color: #fff;
            padding:5px;
        }

        .itemHighlighted {
            background-color: #ADD6FF;
            color: #fff;
            padding:5px;
            cursor:pointer;
        }

        .button {
            float: right;
            color: #fff;
            margin: 20px 10px;
            border: 0;
            padding: 0;
        }

        body {
            overflow: hidden;
        }

        a:hover {
            color: #bf3030;
        }

        .completionList {
            border: solid 1px #444444;
            margin: 0px;
            padding: 2px;
            height: 120px;
            overflow: auto;
            background-color: #FFFFFF;
        }

        .listItem {
            color: #1C1C1C;
            padding:5px;
        }

        .itemHighlighted {
            background-color: #37f;
        }
    </style>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>

    <div class="container" style="background: #000; position: fixed; padding: 5px; width: 100%;">
        <form class="form-inline" role="form" runat="server">
            <div class="form-group" style="color: #fff; margin-left: 50px; margin-right: 20px; margin-top: 22px;">
                <a href="HomePage.aspx?from=1" style="font-size: 29px; color: #fff; font-family: 'Comic Sans MS'; text-decoration: none;">Sparkle</a>
            </div>
            <asp:TextBox runat="server" Style="width: 450px; margin-top: 22px; margin-right: 0;" class="form-control" ID="search"
                placeholder="search" OnTextChanged="search_TextChanged"></asp:TextBox>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:AutoCompleteExtender ID="AutoCompleteExtender1" TargetControlID="search"
                CompletionInterval="1000" MinimumPrefixLength="1" EnableCaching="true" runat="server"
                CompletionListCssClass="completionList"
                CompletionListHighlightedItemCssClass="itemHighlighted"
                CompletionListItemCssClass="listItem"
                UseContextKey="True" ServiceMethod="GetCompletionList">
            </asp:AutoCompleteExtender>


            <button class="btn btn-danger" style="margin-top: 22px">GO</button>
            <asp:ImageButton ID="logout" CssClass="button" ToolTip="Logout" ImageAlign="Middle" Width="42" Height="42" ImageUrl="/images/logouticon.png" OnClick="logout_Click" runat="server" />
            <div class="button" style="position: relative;">
                <asp:ImageButton ID="notifybt" runat="server" Visible="false" ToolTip="Notifications" Style="margin: 0;" ImageAlign="Middle" Width="42" Height="42" ImageUrl="/images/notify_new.png" OnClick="notify_Click" />
                <asp:Label runat="server" ID="ncount" Visible="false" Text="33" Style="background: #F31B26; position: absolute; top: -2px; right: -2px; font-weight: bold; color: #fff; padding: 3px; margin: 0; box-shadow: 1px 1px #444; border-radius: 3px; min-width: 20px; min-height: 20px; text-align: center; font-size: 12px; vertical-align: top;"></asp:Label>
            </div>
            <asp:ImageButton ID="namebtn" CssClass="button" ToolTip="Profile" ImageAlign="Middle" Width="42" Height="42" AlternateText="Profile" ImageUrl="/images/profile_new.png" OnClick="name_Click" runat="server" />
            <asp:ImageButton ID="uploadbtn" CssClass="button" runat="server" ToolTip="Upload" ImageAlign="Middle" Width="42" Height="42" ImageUrl="/images/upload_new1.png" OnClick="upload_Click" />
            <asp:Label runat="server" ID="nameu" CssClass="button" Text="Username" Style="color: #fff; padding: 3px; margin-top: 22px; margin-right: 100px; text-align: center; font-size: 20px; vertical-align: central;"></asp:Label>
        </form>
    </div>
    <iframe runat="server" id="post" src="PostPage.aspx" style="background: #fff; margin-top: 90px; border: 0; height: 89%; width: 100%;"></iframe>
</body>
</html>
