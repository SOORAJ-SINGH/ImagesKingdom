<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/StyleSheet1.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="formLightBoxMsg" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
            <tbody>
                <tr>
                    <td style="height: 231px;">
                        <table cellpadding="0" cellspacing="0" align="center" border="0" width="968">
                            <tbody>
                                <tr>
                                    <td width="6">
                                        <img src="images/curve-top-left.jpg" height="36" width="6">
                                    </td>
                                    <td class="page-heading" align="center" background="images/curve-top-center.jpg">
                                        <asp:Label ID="lblHead" runat="server" Text="" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                    <td width="6">
                                        <img src="images/curve-top-right.jpg" height="36" width="6">
                                    </td>
                                </tr>
                                <tr>
                                    <td background="images/curve-mid-left.jpg">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <table cellpadding="35" cellspacing="41" align="center" border="0" width="95%">
                                            <tbody>
                                                <tr>
                                                    <td align="center" bgcolor="#338AAE" height="25" width="100%">
                                                        <asp:Label ID="lblMsgLight" runat="server" Text="Label" ForeColor="White" Font-Bold="True"
                                                            Font-Size="X-Large"></asp:Label>
                                                    </td>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td background="images/curve-mid-right.jpg">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td background="images/curve-bottom-left.jpg">
                                        &nbsp
                                    </td>
                                    <td background="images/curve-bottom-center.jpg">
                                        &nbsp
                                    </td>
                                    <td background="images/curve-bottom-right.jpg">
                                        &nbsp
                                    </td>
                                </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span id="loginAgain" style="margin-left:23px;"><a href="Default.aspx">Home</a>&nbsp&nbsp<a href="Login.aspx">Login Again</a>
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
