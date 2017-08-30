<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostPage.aspx.cs" Inherits="Sparkle.PostPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        html {
            height: 100%;

        }

        body {
            margin: 0;
            padding: 0;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            background-color: #fff;
        }

        .branches {
            background: #fff;
            color: #999;
            padding: 10px;
            border: 1px solid #999;
            margin: 5px;
        }

            .branches:hover {
                background: #39f;
                color: #fff;
                border: 1px solid #39f;
                cursor: pointer;
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
            margin: 18px;
            background: #eee;
        }

            .eachitem:hover {
                cursor: pointer;
            }

                .eachitem:hover #des {
                    height: 200px;
                }
    </style>

    <script type="text/javascript">
      
        function EditDiv(args) {
            window.location = "Video_Player.aspx?id=" + args;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
                <div style="text-align: center; margin-top: 10px;">
                    <asp:Button runat="server" ID="all2" CssClass="branches" Text="ALL" OnClick="all_Click" />
                    <asp:Button runat="server" ID="it" CssClass="branches" Text="IT" OnClick="it_Click" />
                    <asp:Button runat="server" ID="ecm" CssClass="branches" Text="ECM" OnClick="ecm_Click" />
                    <asp:Button runat="server" ID="cse" CssClass="branches" Text="CSE" OnClick="cse_Click" />
                    <asp:Button runat="server" ID="eie" CssClass="branches" Text="EIE" OnClick="eie_Click" />
                    <asp:Button runat="server" ID="eee" CssClass="branches" Text="EEE" OnClick="eee_Click" />
                    <asp:Button runat="server" ID="civil" CssClass="branches" Text="CIV" OnClick="civil_Click" />
                    <asp:Button runat="server" ID="mech" CssClass="branches" Text="MECH" OnClick="mech_Click" />
                    <asp:Button runat="server" ID="bio" CssClass="branches" Text="BIO" OnClick="bio_Click" />
                    <asp:Button runat="server" ID="ece" CssClass="branches" Text="ECE" OnClick="ece_Click" />
                </div>
                <div runat="server" style=" position: relative; margin-bottom: 20px; margin-left: auto; height: auto; margin-right: auto;">
                    <asp:DataList ID="DataList1" runat="server" Style="margin-left: auto; margin-right: auto;" RepeatColumns="4" RepeatDirection="Horizontal" DataSourceID="SqlDataSource">
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
    </form>
</body>
</html>
