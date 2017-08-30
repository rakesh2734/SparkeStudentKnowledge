<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notify.aspx.cs" Inherits="Sparkle.notify" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html {
            background: #fff;
        }
        body {
            background: #fff;
            width: 80%;
            box-shadow: 3px 3px 18px 3px #555;
            margin: auto auto;
            margin-bottom: 100px;
        }
        #eachItem {
            background-color: #fff;
            padding: 20px;
            box-shadow: 1px 1px 16px 1px #bbb;
            margin: 10px 10px;
            border: 1px solid #bbb;
        }
        .t {
            color: #39f;
            font-size: xx-large;
            margin-right: 10px;
        }
        .d {
            color: #444;
            font-size: medium;
        }
        .vid_Button {
            color: #fff;
            background: #39f;
            padding: 8px;
            border: 0;
            float: right;
            text-decoration: none;
            margin: 10px 10px;
        }
            .vid_Button:hover {
                color: #fff;
                background: #3bf;
                cursor: pointer;
            }
        .ap_Button {
            color: #fff;
            background: #388E3C;
            padding: 8px;
            text-decoration: none;
            border: 0;
            float: right;
            margin: 10px 10px;
        }
            .ap_Button:hover {
                background: #7CB342;
                cursor: pointer;
            }
        .rj_Button {
            color: #fff;
            background: #D84315;
            padding: 8px;
            border: 0;
            text-decoration: none;
            float: right;
            margin: 10px 10px;
        }
            .rj_Button:hover {
                background: #FF5722;
                cursor: pointer;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DataList Style="width: 100%;" ID="DataList1" ShowHeader="false" RepeatColumns="1" RepeatDirection="Horizontal" DataSourceID="PostApprovals" runat="server">
            <ItemTemplate>
                <div id="eachItem">
                    <span>
                        <asp:Label ID="title" CssClass="t" runat="server" Text='<%# Eval("title") %>'></asp:Label></span>
                    <span>
                        <a runat="server" id="reject" class="rj_Button" href='<%# String.Format("notify.aspx?reject={0}", Eval("vid")) %>'>Reject</a>
                        <a id="approve" runat="server" class="ap_Button" href='<%# String.Format("notify.aspx?approve={0}", Eval("vid")) %>'>Approve</a>
                        <a runat="server" class="vid_Button" href='<%# String.Format("Video_Player.aspx?id={0}", Eval("vid")) %>'>Watch Video</a>
                    </span>
                    <br/>
                    <br/>
                    <span>
                        <asp:Label runat="server" ID="descr" CssClass="d" Text='<%# Eval("des") %>'></asp:Label></span>
                </div>
           </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="PostApprovals" runat="server" ConnectionString="<%$ ConnectionStrings:SparkleConnectionString %>" SelectCommand="SELECT [uid], [title], [des], [vid], [date] FROM [Table_Post] Where status=3 ORDER BY [date] DESC"></asp:SqlDataSource>
    </form>
</body>
</html>
