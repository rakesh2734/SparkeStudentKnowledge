<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="Sparkle.demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .video_wrapper{
            width:200px;
            height:200px;
            box-shadow:2px 2px 3px #333;
            position:relative;
        }

        html,body
        {
            margin:2px;
            padding:0;
            width:200px;
            height:200px;
        }

        .video{
            width:100%;
            height:100%;
            z-index:-1;
        }
        desc
        {

        }

        more_desc
        {

        }
        .text
        {
           width:200px;
           height:40px;
           top:160px;
           position:absolute;
           color:#fff;
           background-color:rgba(0, 0, 0, 0.74);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="video_wrapper">
            <video class="video" src='<%# Eval("url") %>' runat="server" ></video>
           
        </div>
         <div class="text">
            <strong>
                <asp:Label ID="title" Text='<%# Eval("title") %>' runat="server"></asp:Label></strong>
            <p class="desc">
                <asp:Label runat="server" Text='<%# Eval("des") %>' CssClass="more_desc" ID="more_desc"></asp:Label></p>
            <br />
            </div>
    </form>
</body>
</html>
