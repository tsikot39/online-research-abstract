<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="researchabstract.aspx.vb" Inherits="Research_Abstract.researchabstract" Theme="Theme1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <style type="text/css">
        .style1
        {
            font-family: Tahoma;
            font-size: 8pt;
        }
        .style2
        {
            font-family: Tahoma;
            font-size: 10pt;
        }
        .style3
        {
            font-family: Tahoma;
            font-size: 14pt;
        }           
        .modalBackground
        {

            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            padding-top: 10px;
            padding-left: 10px;
            padding-right: 10px;
        }
        .hiddencol
          {
            display: none;
          }
        .uc
          {
           text-transform: uppercase;
          }
        </style>
    <script type="text/javascript">
    function Hidepopup() {
        $find("popup").hide();
        return false;
       }
</script>
<script type="text/javascript">
        function CloseWindow() {
            window.close();
        }
</script>
</head>
<body>
    <form id="frmHitCounter" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
        <div align="center">
            <img src="logo.gif" alt="PCMC" style="vertical-align: top; height: 25px; width: 25px" />
            <span class="style3">PHILIPPINE CHILDREN'S MEDICAL CENTER</span>
            <br /><br />
            <asp:Label ID="Label3" runat="server" Text="ONLINE RESEARCH ABSTRACT" CssClass="style2" />
        </div>
        <br />
        <div align="center" style="margin-bottom: 5px">
            <asp:Label ID="Label5" runat="server" Text="Enter Keyword" CssClass="style2"></asp:Label>
            <asp:TextBox ID="txtsearch" runat="server" CssClass="style2"></asp:TextBox>
            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="style2" />
        </div>
        <div align="right">
            <asp:Label ID="Label1" runat="server" Text="Visitors Counter:" CssClass="style2" />         
            <asp:label id="lblTotalNumberOfUsers" runat="server" CssClass="style2" /><br />
<%--            <asp:Label ID="Label4" runat="server" Text="Current number of users browsing the site:" CssClass="style2"/>
            <asp:label id="lblCurrentNumberOfUsers" runat="server" CssClass="style2" /><br />--%>
        </div>
        <div align="center">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                 <asp:GridView ID="gvsearch" runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging"  PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="docno" HeaderText="Doc No." HtmlEncode="true" HeaderStyle-Font-Bold="false" />
                        <asp:BoundField DataField="title" HeaderText="Title" HtmlEncode="true" HeaderStyle-Font-Bold="false" />
                        <asp:BoundField DataField="author" HeaderText="Author" HtmlEncode="true" HeaderStyle-Font-Bold="false" />
                        <asp:BoundField DataField="abstract" HeaderText="Content" HtmlEncode="true" HeaderStyle-Font-Bold="false" />
                        <asp:BoundField DataField="keywords" HeaderText="Keywords" HtmlEncode="true" HeaderStyle-Font-Bold="false" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        <br />
        <div align="center">
            <asp:Label ID="Label2" runat="server" Text="Developed by OHICS © 2017" CssClass="style1"></asp:Label>
        </div>
    </form>
</body>
</html>
