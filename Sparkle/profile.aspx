<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Sparkle.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
        html{
          height:100%;
        }
        body {
            margin: 0;
            padding: 0;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            padding-bottom:60px;
            background-color: #fff;
        }
        #des {
            width: 250px;
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
            width: 100%;
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
            width: 250px;
            height: 200px;
            position: relative;
            box-shadow: 1px 1px 16px 1px #666;
            background: #eee;
            margin-left:10px;
        }

            .eachitem:hover {
                cursor: pointer;
            }

                .eachitem:hover #des {
                    height: 200px;
                }
        
            .Change_pwd{
                float:right;
                margin-top:5px 5px;
                background:#fff;
                color:#39f;
               padding:5px;
               font-weight:bold;

               border-radius:4px;
                border: 2px solid #39f;
            }
            .Change_pwd:hover{
                background:#39f;
                color:#fff;
                cursor:pointer;
            }
    </style>
      <script type="text/javascript">
            function EditDiv(args) {
              window.location = "Video_Player.aspx?id=" + args;
             }
       
    </script>
</head>
<body style="padding:0px 20px;">
     <form id="form1" runat="server" >
         <asp:Button ID="cpwd" runat="server"  CssClass="Change_pwd" Text="Change Password" OnClick="cpwd_Click" />
    <p style="width:100%; padding:5px; font-weight:bold; background:#fff; border-bottom:1px double #444; font-family:'Comic Sans MS'; color:#39f;font-size:22px;">
        Threads You Liked</p>
    <div runat="server"  style="overflow-x:auto; overflow-y:hidden; position:relative;   height:auto;">
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource">
                <ItemTemplate>
                     <div id='<%# Eval("vid")  %>' onclick="EditDiv(this.id)" class="eachitem">
                                <div class="youtube-container">
                                    <div class="youtube-player">
                                        <img class="youtube-thumb" src='<%# Eval("dimage") %>'>
                                        <div class="play-button"></div>
                                    </div>
                                </div>
                                <%-- <iframe id="vid1" onclick="video_click" frameborder="0" style="position:absolute;overflow:hidden; color:#444; width:250px; height:200px;"
                                    src='<%# Eval("url") %>' runat="server"></iframe>--%>
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
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SparkleConnectionString %>"></asp:SqlDataSource>
    <p style="width:100%; padding:5px; font-weight:bold;  font-size:22px; background:#fff; border-bottom:1px double #444; font-family:'Comic Sans MS'; color:#39f;">
        Threads You Posted</p>
     <div runat="server"  style="overflow-x:auto; overflow-y:hidden; position:relative; margin-bottom:20px; height:auto;">
            <asp:DataList ID="DataList2" runat="server"  RepeatDirection="Horizontal" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                     <div id='<%# Eval("vid")  %>' onclick="EditDiv(this.id)" class="eachitem">
                                <div class="youtube-container">
                                    <div class="youtube-player">
                                        <img class="youtube-thumb" src='<%# Eval("dimage") %>'>
                                        <div class="play-button"></div>
                                    </div>
                                </div>
                                <%-- <iframe id="vid1" onclick="video_click" frameborder="0" style="position:absolute;overflow:hidden; color:#444; width:250px; height:200px;"
                                    src='<%# Eval("url") %>' runat="server"></iframe>--%>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SparkleConnectionString %>"></asp:SqlDataSource>
</form>
</body>
</html>
