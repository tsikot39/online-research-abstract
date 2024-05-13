<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="Research_Abstract.login" %>

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
        .gvheader
        {
            background-color: #507CD1;
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
        .hidden
        {
            display: none;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Button ID="btnok" runat="server" Text="" CssClass="hidden"/>
        <ajaxToolkit:ModalPopupExtender ID="modalpopup" runat="server" TargetControlID="btnok" BackgroundCssClass="modalBackground" PopupControlID="panel1" />
        <asp:Panel ID="panel1" runat="server" CssClass="modalPopup">
            <table>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" valign="top">
                        <img src="logo.gif" alt="PCMC" style="vertical-align: top; height: 25px; width: 25px" />
                        <span class="style3">PHILIPPINE CHILDREN'S MEDICAL CENTER</span>                                                   
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label18" runat="server" Text="ONLINE RESEARCH ABSTRACT" CssClass="style2"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Login ID="Login1" runat="server" OnAuthenticate="ValidateUser" CssClass="style2"></asp:Login>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" style="height: 30px">
                        <asp:Label ID="Label2" runat="server" Text="Developed by OHICS © 2017" CssClass="style1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
