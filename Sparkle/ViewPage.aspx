<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPage.aspx.cs" Inherits="Sparkle.ViewPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        
        body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .btn {
            -webkit-border-radius: 9;
            -moz-border-radius: 9;
            border-radius: 5px;
            font-family: Arial;
            color: #39f;
            font-size: 12px;
            display: block;
            font-weight: bold;
            background: #fff;
            text-align: center;
            width: 80%;
            margin-right: auto;
            margin-left: auto;
            margin-bottom: 10px;
            border: 1px solid #39f;
            padding: 5px 10px 5px 10px;
            text-decoration: none;
        }

            .btn:hover {
                background: rgba(51, 153, 255, 0.16);
                text-decoration: none;
            }

             .btn1 {
            -webkit-border-radius: 9;
            -moz-border-radius: 9;
            border-radius: 5px;
            font-family: Arial;
            color: #fff;
            font-size: 12px;
            display: block;
            font-weight: bold;
            background: #39f;
            text-align: center;
            width: 80%;
            margin-right: auto;
            margin-left: auto;
            margin-bottom: 10px;
            border: 1px solid #39f;
            padding: 5px 10px 5px 10px;
            text-decoration: none;
            }

            .btn1:hover {
                background:rgba(51, 153, 255, 0.91);
                text-decoration: none;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; margin: 0; padding: 0;">
            <asp:Label Width="100%" Style="font-size: large; padding:10px; width: 100%; background: #39f; color: #fff; text-align: left; " runat="server" ID="view" Text="View By Branch"></asp:Label>
            <br />
            <br />
            <a id="ecm" href="PostPage.aspx?bch=0" class="btn" target="frame2">Electronics and Computers</a>
            <a id="it" class="btn" href="PostPage.aspx?bch=1" target="frame2">Information Technology</a>
            <a id="ece" class="btn" href="PostPage.aspx?bch=2" target="frame2">Electronics and Communication</a>
            <a id="eee" href="PostPage.aspx?bch=4" class="btn" target="frame2">Electrical and Electronics</a>
            <a id="cse" href="PostPage.aspx?bch=3" class="btn" target="frame2">Computer Science</a>
            <a id="mec" href="PostPage.aspx?bch=5" class="btn" target="frame2">Mechanical</a>
            <a id="eie" class="btn" href="PostPage.aspx?bch=8" target="frame2">Electronics and Instrumentation</a>
            <a id="civ" class="btn" href="#PostPage.aspx?bch=6" target="frame2">Civil Engineering</a>
            <a id="bio" class="btn" href="PostPage.aspx?bch=7" target="frame2">Bio Technology</a>
            <br />
            <br />
            <a id="upload" class="btn1" href="upload.aspx"  target="frame2">Upload</a>
            <a id="viewall" class="btn1" href="PostPage.aspx?bch=1993" target="frame2">View All</a>
            <a id="admin" class="btn1" href="DataBase.aspx" target="frame2">Admin</a>
            <br />

        </div>
    </form>
</body>
</html>
