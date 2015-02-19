<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" Title="Change Password"
    MasterPageFile="~/MasterPageWithoutLeftMenu.master" %>

<asp:Content ContentPlaceHolderID="head" runat="server" ID="cpHead">
    <link href="css/popUp.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function popUp(divId, msg) {
            $('#SpanLogo').html(msg);
            $(divId).bPopup();
        }

    </script>
    
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="cp" runat="server">
    <!--container start-->
    <div id="divPopUp" class="ToPopup" style="left: 433px; position: absolute; top: 122px;
        z-index: 9999; opacity: 1;">
        <span class="button b-close"><span>X</span> </span>
        <br>
        <span id="SpanLogo" class="logo"></span>
    </div>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tbody>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" align="center" border="0" width="968">
                        <tbody>
                            <tr>
                                <td width="6">
                                    <img src="images/curve-top-left.jpg" height="36" width="6">
                                </td>
                                <td class="page-heading" align="left" background="images/curve-top-center.jpg">
                                    Change your password
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
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td valign="top" width="1%">
                                                    <img src="images/spacer.gif" height="8" width="8">
                                                </td>
                                                <td valign="top" width="0%">
                                                    &nbsp;
                                                </td>
                                                <td valign="top" width="100%">
                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td valign="top" width="1%">
                                                                    <div align="left">
                                                                        <img src="images/spacer.gif" height="6" width="6"></div>
                                                                </td>
                                                                <td valign="top" width="100%">
                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td valign="top" width="100%">
                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td height="0" valign="top" width="3%">
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td valign="top">
                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td valign="top">
                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                </td>
                                                                                                                <td align="left">
                                                                                                                    <span id="lblerror" class="red" style="color: Red; font-weight: bold;"></span>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td height="7px;">
                                                                                                                </td>
                                                                                                                <td class="blackbignew">
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td height="26">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                                <td align="center">
                                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                                        <tbody>
                                                                                                                            <tr>
                                                                                                                                <td colspan="2">
                                                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="60%">
                                                                                                                                        <tbody>
                                                                                                                                            <tr>
                                                                                                                                                <td bgcolor="CBCBCB" height="0">
                                                                                                                                                    <table cellpadding="0" cellspacing="1" border="0" width="100%">
                                                                                                                                                        <tbody>
                                                                                                                                                            <tr>
                                                                                                                                                                <td bgcolor="#FFFFFF" height="0" valign="top">
                                                                                                                                                                    <table cellpadding="0" cellspacing="1" border="0" width="100%">
                                                                                                                                                                        <tbody>
                                                                                                                                                                            <tr>
                                                                                                                                                                                <td bgcolor="#EEEEEE" height="104" valign="top">
                                                                                                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                                                                                                        <tbody>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td colspan="4" height="6">
                                                                                                                                                                                                    <div align="right">
                                                                                                                                                                                                        <img src="images/spacer.gif" height="2" width="2"></div>
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td width="4%">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td colspan="2" class="linktopwhite" align="center" height="17">
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="17" width="4%">
                                                                                                                                                                                                    <div align="right">
                                                                                                                                                                                                        <img src="images/spacer.gif" height="6" width="6"></div>
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td width="4%">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="12">
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td class="blackbold" height="22" width="32%">
                                                                                                                                                                                                    Old Password
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22" width="60%">
                                                                                                                                                                                                    <asp:TextBox ID="txtOldPass" Width="155px" runat="server" TextMode="Password"></asp:TextBox>
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22" width="4%">
                                                                                                                                                                                                    <div align="right">
                                                                                                                                                                                                        <img src="images/spacer.gif" height="6" width="6"></div>
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td colspan="4" height="0">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td width="4%">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="12">
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td class="blackbold" height="22" width="32%">
                                                                                                                                                                                                    New Password
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22" width="60%">
                                                                                                                                                                                                    <asp:TextBox ID="txtNewPass" Width="155px" TextMode="Password" runat="server"></asp:TextBox>
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22" width="4%">
                                                                                                                                                                                                    <div align="right">
                                                                                                                                                                                                        <img src="images/spacer.gif" height="6" width="6"></div>
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td colspan="4" height="0">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td width="4%">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="12">
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td class="blackbold" height="22" width="32%">
                                                                                                                                                                                                    Confirm New Password
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22" width="60%">
                                                                                                                                                                                                    <asp:TextBox ID="txtCNewPass" Width="155px" TextMode="Password" runat="server"></asp:TextBox>
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22" width="4%">
                                                                                                                                                                                                    <div align="right">
                                                                                                                                                                                                        <img src="images/spacer.gif" height="6" width="6"></div>
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td colspan="4" height="0">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td colspan="4" height="0">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td>
                                                                                                                                                                                                    &nbsp;
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td class="" height="22">
                                                                                                                                                                                                    &nbsp;
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22">
                                                                                                                                                                                                    <asp:ImageButton ID="btnChangePwd" ImageUrl="images/btn-change-pwd.png" runat="server"
                                                                                                                                                                                                        OnClick="btnChangePwd_Click" />
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22">
                                                                                                                                                                                                    &nbsp;
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td colspan="4" height="0">
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                                                                                                </td>
                                                                                                                                                                                            </tr>
                                                                                                                                                                                        </tbody>
                                                                                                                                                                                    </table>
                                                                                                                                                                                </td>
                                                                                                                                                                            </tr>
                                                                                                                                                                        </tbody>
                                                                                                                                                                    </table>
                                                                                                                                                                </td>
                                                                                                                                                            </tr>
                                                                                                                                                        </tbody>
                                                                                                                                                    </table>
                                                                                                                                                </td>
                                                                                                                                            </tr>
                                                                                                                                        </tbody>
                                                                                                                                    </table>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </tbody>
                                                                                                                    </table>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td height="5">
                                                                                                                </td>
                                                                                                                <td class="blackbignew" align="left">
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td height="0">
                                                                                                                </td>
                                                                                                                <td class="blackbignew" align="left">
                                                                                                                    <span class="blackbig2">&lt;&lt;</span> <a href="#" class="blackbig2">Back to MyAccounts</a>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                                <td height="136" valign="top" width="44%">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td align="right" valign="top" width="1%">
                                                                    <div align="right">
                                                                        <img src="images/spacer.gif" height="7" width="7"></div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div align="right">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" height="0" valign="top">
                                                    <img src="images/spacer.gif" height="9" width="9">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td background="images/curve-mid-right.jpg">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <img src="images/curve-bottom-left.jpg" height="10" width="6">
                                </td>
                                <td background="images/curve-bottom-center.jpg">
                                    <img src="images/spacer.gif" height="1" width="1">
                                </td>
                                <td valign="top">
                                    <img src="images/curve-bottom-right.jpg" height="10" width="6">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <!--container end-->
</asp:Content>
