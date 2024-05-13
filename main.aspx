<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="main.aspx.vb" Inherits="Research_Abstract.main" Theme="Theme1" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
<body bgcolor="#EFF3FB">
    <form id="frmHitCounter" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div align="right">
            <asp:Label ID="Label1" runat="server" Text="USER:" CssClass="style2" />
            <asp:Label ID="lbllogin" runat="server" Text="Label" CssClass="style2"/>
            <asp:LoginName ID="LoginName1" runat="server" CssClass="style2" Visible="false" />|
            <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutText="LOGOUT" CssClass="style2" LogoutAction="RedirectToLoginPage" />
        </div>
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
        <br />
        <div align="center">
            <asp:Button ID="btnAdd" runat="server" Text="Add New Abstract" OnClick="Add" CssClass="style2" />
        </div>
        <br />
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
                        <asp:TemplateField>
                           <ItemTemplate>
                               <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit Data" OnClick="Edit" CssClass="style2" />
                           </ItemTemplate>
                        </asp:TemplateField>
<%--                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("refno")%>' OnClientClick = "return confirm('Do you want to delete?')" Text="Delete" OnClick="Delete" CssClass="style2" />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
<%--                        <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkview" runat="server" NavigateUrl='<%# String.Format("~/details.aspx?dcno={0}", HttpUtility.UrlEncode(Eval("dcno").ToString()))%>' Target="_blank" Text="View details" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    </Columns>
                </asp:GridView>
                <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
                    <br />
                    <asp:Label ID ="lblcaption" runat="server" Text="" CssClass="style2" />
                    <table align="center">
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Document Number" CssClass="style2" />
                        </td>
                        <td>
                            <asp:Label ID="lbldocno" runat="server" Text="" CssClass="style2" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbltitle" runat="server" Text="Title" CssClass="style2" />
                        </td>
                        <td>
                            <asp:TextBox ID="txttitle" runat="server" CssClass="style2" Width="500px" />
                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txttitle" ErrorMessage="Title field should not be blank." ValidationGroup="Group1" CssClass="style2" Display="None" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblauthor" runat="server" Text="Author" CssClass="style2" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtauthor" runat="server" CssClass="style2" Width="500px" />
                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtauthor" ErrorMessage="Author field should not be blank." ValidationGroup="Group1" CssClass="style2" Display="None" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Label ID="lblabstract" runat="server" Text="Content" CssClass="style2" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtcontent" runat="server" TextMode="MultiLine" CssClass="style2" Width="500px" Height="300px" />
                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtcontent" ErrorMessage="Content field should not be blank." ValidationGroup="Group1" CssClass="style2" Display="None" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblkeywords" runat="server" Text="Keywords" CssClass="style2" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtkeywords" runat="server" CssClass="style2" Width="500px" />
                            <%--<asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtkeywords" ErrorMessage="Keyword field should not be blank." ValidationGroup="Group1" CssClass="style2" Display="None" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="Save" CssClass="style2" ValidationGroup="Group1" />&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="return Hidepopup()" CssClass="style2"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Group1" CssClass="style2" HeaderText="Warning!" /></td>                                
                    </tr>
                    </table>
                    </asp:Panel>
                <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                <ajaxToolkit:ModalPopupExtender ID="popup" runat="server" DropShadow="false" PopupControlID="pnlAddEdit" TargetControlID="lnkFake" BackgroundCssClass="modalBackground" />
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID = "gvsearch" />
                <asp:AsyncPostBackTrigger ControlID = "btnSave" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
        <br />
        <div align="center">
            <asp:Label ID="Label2" runat="server" Text="Developed by OHICS © 2017" CssClass="style1"></asp:Label>
        </div>
    </form>
</body>
</html>

