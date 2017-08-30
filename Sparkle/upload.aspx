<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="Sparkle.upload" %>

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
        <div style="width:60%; box-shadow:2px 2px 18px 2px #888; padding:20px; margin:130px auto;">
            <asp:TextBox ID="title" runat="server" required="" placeholder="Title of Post" CssClass="textbox" /><br />
            <asp:TextBox ID="desc" runat="server" TextMode="MultiLine"  required="" placeholder="Description of Post" CssClass="textbox" /><br />
             <asp:TextBox ID="tags" runat="server" required="" placeholder="Tags followed by commas" CssClass="textbox" /><br />
             <asp:DropDownList ID="bch" runat="server" CssClass="btn btn-default dropdown-toggle" style="width:100%" title="Select  Branch" required="">
                <asp:ListItem Text="ECM" Value="0" />
                <asp:ListItem Text="IT" Value="1" />
                <asp:ListItem Text="ECE" Value="2" />
                <asp:ListItem Text="CSE" Value="3" />
                <asp:ListItem Text="EEE" Value="4" />
                <asp:ListItem Text="MEC" Value="5" />
                <asp:ListItem Text="CIV" Value="6" />
                <asp:ListItem Text="BT" Value="7" />
                <asp:ListItem Text="EIE" Value="8" />
            </asp:DropDownList>
             <br />
               <asp:FileUpload  ID="uploadfile" style="align-content:center; margin-top:20px; margin-bottom:10px; text-align:center;" runat="server" />
              <p style="text-align:left; width:100%;">OR</p>
             <asp:TextBox ID="url" runat="server"  placeholder="Video link from other site" CssClass="textbox" /><br />
            
            <asp:Button ID="uploadb"  runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="uploadb_Click"></asp:Button>
        </div>
    </form>
</body>
</html>
