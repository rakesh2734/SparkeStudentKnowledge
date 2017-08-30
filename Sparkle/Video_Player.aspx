<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Video_Player.aspx.cs" Inherits="Sparkle.Video_Player" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

        .likebtn {
            background: #fff;
            color: #D9534F;
            border: 2px solid #D9534F;
            padding: 0px 15px;
            margin-right: 10px;
            border-radius: 4px;
            font-weight: bold;
        }

        .postbtn {
            margin-top:5px;
            margin-bottom:7px;
            float: right;
            padding:2px 20px;
            background:#39f;
            border:0;
            color: #fff;
            border-radius: 4px;
        }

        .postbtn:hover {
            background: #37f;
        }

        .likebtn:hover, .likebtn:active {
            background: #D9534F;
            color: #fff;
        }
          #des {
            width: 100%;
            height: 0px;
            position: absolute;
            background: #000;
            bottom: 0;
            right: 0;
            left: 0;
            opacity: 0.8;
            -webkit-transition-property: height; /* Safari */
            -webkit-transition-duration: 1s; /* Safari */
            transition-property: height;
            transition-duration: 1s;
        }

        .youtube-container {
            display: block;
            width: 100%;
            height:100%;
            max-width: 600px;
        }

        .youtube-player {
            display: block;
            width: 100%; /* assuming that the video has a 16:9 ratio */
            overflow: hidden;
            position: absolute;
            top:0;
            height: 100%;
            cursor: pointer;
            display: block;
        }

        img.youtube-thumb {
            bottom: 0;
            display: block;
            left: 0;
            max-width: 100%;
            width: 100%;
            position: absolute;
            right: 0;
            top: 0;
            height:100%;
        }

        div.play-button {
            height: 72px;
            width: 72px;
            left: 50%;
            top: 50%;
            margin-left: -36px;
            margin-top: -36px;
            position: absolute;
            background: url("http://i.imgur.com/TxzC70f.png") no-repeat;
        }

        #youtube-iframe {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        .eachitem {
            width: 80%;
            height: 200px;
            position: relative;
            box-shadow: 1px 1px 16px 1px #666;
            margin-left:auto;
            margin-bottom:15px;
            margin-right:auto;
            background: #eee;
        }

            .eachitem:hover {
                cursor: pointer;
            }

                .eachitem:hover #des {
                    height: 200px;
                }
                body
                {
                    overflow:auto;
                }

                html {
            height: 100%;
        }
    </style>
  
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>

<body style="background-color: #eee; margin-bottom: 200px; padding-left: 25px;">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
       
        <span style="float: left; padding: 5px 20px; margin:20px; margin-bottom:0px; background: #fff;  width: 62%">
           <br /> <iframe style="width: 100%; margin-bottom:5px; margin-top:12px; height: 450px;" frameborder="0" runat="server" id="video_id1" allowfullscreen="">
            </iframe>
            <br />
            <asp:UpdatePanel runat="server">
            <ContentTemplate>
            <span style="padding:10px;  margin: 5px;">
                <asp:Label runat="server" Style="font-size: 24px; float: left; font-family: 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'; color: #37f; font-weight: bold;" ID="title" />
                <asp:Label runat="server" ID="likescount" Style="float: right; font-family: 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'; text-align: center; margin-right: 10px; color: #39f; font-weight: bold; font-size: 14px; margin-top: 5px; padding: 5px; vertical-align: middle;" Text="24 people like this"></asp:Label>
                <asp:Button runat="server" Text="like" AutoPostBack="false" CssClass="likebtn" ID="likebtn" Style="float: right; margin-top: 10px; font-size: 13px;" OnClick="Unnamed2_Click"></asp:Button><br />
                <br />
                <asp:Label runat="server" Style="font-size: 14px; font-family: 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'; margin-top: 5px; text-align: left; color: #000;" ID="description" />
                <br />
                <asp:Label runat="server" ID="user" Text="username" Style="color: #37f; margin-top: 10px; font-family: 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'; margin-top: 10px; font-size: 18px; font-weight: bold;"></asp:Label>
            </span>
                  </ContentTemplate>
             </asp:UpdatePanel>
            <br />
            <p style="width:100%; border-bottom:1px solid #bbb;"></p>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="comment" placeholder="comment here..." Style="padding: 10px; font-family: 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'; width: 100%; height: 60px; margin-top: 40px;" OnTextChanged="comment_TextChanged" />
            <input type="button" runat="server" value="Post" onserverclick="Unnamed1_Click" class="postbtn" />
            <div style="margin-top:20px; margin-bottom:20px; width:100%;">
                <asp:DataList ID="DataList1" ShowHeader="false" RepeatColumns="1" Style="border-collapse: collapse; width: 93%;" RepeatDirection="Horizontal" DataSourceID="CommentsData" runat="server">
                    <ItemTemplate>
                        <div id="comment" style="padding:10px; margin:5px; margin-bottom:2px; width:100%; background: #f7f7f7;">
                            <asp:Label runat="server" ID="descr" Style="font-size: 14px; font-family: 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'; margin-bottom: 5px; color: #444;" Text='<%# Eval("vcomment") %>'></asp:Label></span><br />
                            <asp:Label runat="server" ID="Label1" Style="font-size: 14px; font-weight: bold; font-family: 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'; color: #39f;" Text=' <%# Eval("username")%>'></asp:Label>
                            <asp:Label runat="server" ID="Label2" Style="font-size: 14px; font-weight: bold; color: #39f; font-family: 'Segoe UI, Tahoma, Geneva, Verdana, sans-serif'; margin-top: 5px; float: right;" Text='<%# Eval("timeofpost")%>'></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        <asp:SqlDataSource ID="CommentsData" runat="server" ConnectionString="<%$ ConnectionStrings:SparkleConnectionString %>"></asp:SqlDataSource>
        </ContentTemplate>
        </asp:UpdatePanel>
     </span>
        <asp:UpdatePanel runat="server">
        <ContentTemplate>
        <div style=" width:32%; float:right;  padding:10px; height:auto; background:#fff; margin:20px; margin-left:0;">
                <p style="text-align:left; margin-bottom:10px; color:#555; font-weight:bold; font-size:20px; width:100%; border-bottom:1px solid #888">Related Videos</p>
                <asp:DataList ID="DataList2" ShowHeader="false" RepeatColumns="1" Style="border-collapse:collapse; width:93%;" RepeatDirection="Vertical" DataSourceID="SqlDataSource2" runat="server">
                    <ItemTemplate>
                         <div id='<%# Eval("vid")  %>' onclick="EditDiv(this.id)" class="eachitem">
                                <div class="youtube-container">
                                    <div class="youtube-player">
                                        <img class="youtube-thumb" src='<%# Eval("dimage") %>'>
                                        <div class="play-button"></div>
                                    </div>
                                </div>
                                <div id="des">
                                    <br />
                                    <br />
                                    <asp:Label ID="Label2" onclick="video_click" Style="width: 230px; position: absolute; top: 20px; right: 20px; left: 20px; bottom: 20px; color: #fff; text-align: left; font-size: 25px;"
                                        Text='<%# Eval("title") %>' runat="server"></asp:Label>
                                </div>
                            </div>
                    </ItemTemplate>
                </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SparkleConnectionString %>"></asp:SqlDataSource>
        </ContentTemplate>
        </asp:UpdatePanel>

  </form>
</body>
</html>
