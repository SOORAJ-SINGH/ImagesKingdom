<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditMemberDetails.aspx.cs"
    Inherits="EditMemberDetails" MasterPageFile="~/MasterPageWithoutLeftMenu.master"
    Title="Edit Member Details" %>

<asp:Content ContentPlaceHolderID="head" ID="cpHead" runat="server">
    <link href="Login_files/css.css" rel="stylesheet" type="text/css" />
    <link href="Login_files/style_ibNew.css" rel="stylesheet" type="text/css" />
    <link href="Login_files/nn.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="cp" runat="server">
    <div id="maincontainer" style="min-height: 455px;">
        <form method="post">
        <tbody>
            <tr>
                <td>
                    <table style="" cellpadding="0" cellspacing="0" align="center" border="0" width="968">
                        <tbody>
                            <tr>
                                <td width="6">
                                    <img src="images/curve-top-left.jpg" height="36" width="6">
                                </td>
                                <td class="page-heading" align="left" background="images/curve-top-center.jpg">
                                    Edit your registered information
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
                                        <form name="form1" action="UpdateUser.aspx" method="POST">
                                        </form>
                                        <tbody>
                                            <tr>
                                                <td colspan="5" valign="top" width="2225%">
                                                    <img src="images/spacer.gif" height="15" width="9">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" valign="top">
                                                    <div align="center">
                                                        <table cellpadding="0" cellspacing="0" border="0" width="80%">
                                                            <tbody>
                                                                <tr>
                                                                    <td bgcolor="72B5C1" valign="top">
                                                                        <div align="center">
                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table cellpadding="0" cellspacing="1" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr bgcolor="72B5C1">
                                                                                                        <td colspan="2" height="25">
                                                                                                            <div class="white" align="center">
                                                                                                                <p class="whitetext">
                                                                                                                    Username and Password Information</p>
                                                                                                            </div>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr bgcolor="#FFFFFF">
                                                                                                        <td class="blackbig" width="273">
                                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                                <tbody>
                                                                                                                    <tr>
                                                                                                                        <td width="8%">
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                        <td class="blackbig" width="92%">
                                                                                                                            Your Email Address:
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </tbody>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="296">
                                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                                <tbody>
                                                                                                                    <tr>
                                                                                                                        <td style="height: 24px" width="10%">
                                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                                        </td>
                                                                                                                        <td style="height: 24px" class="blackbold" valign="middle" width="90%">
                                                                                                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
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
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" height="0" valign="top">
                                                    <div align="center">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" height="403" valign="top">
                                                    <div align="center">
                                                        <table cellpadding="0" cellspacing="0" border="0" width="80%">
                                                            <tbody>
                                                                <tr>
                                                                    <td bgcolor="72B5C1" height="0" valign="top">
                                                                        <div align="center">
                                                                            <table cellpadding="0" cellspacing="1" border="0" width="100%">
                                                                                <tbody>
                                                                                    <tr bgcolor="72B5C1">
                                                                                        <td colspan="2" height="25">
                                                                                            <div class="white" align="center">
                                                                                                <p class="whitetext">
                                                                                                    Contact Details</p>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30" width="273">
                                                                                            <div align="center">
                                                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td width="8%">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td class="blackbig" width="92%">
                                                                                                                First Name
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30" width="296">
                                                                                            <div align="center">
                                                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td width="10%">
                                                                                                                <img src="images/spacer.gif" height="5" width="70">
                                                                                                            </td>
                                                                                                            <td valign="bottom" width="90%">
                                                                                                                <asp:TextBox ID="txt_FirstName" runat="server"></asp:TextBox>
                                                                                                                &nbsp;*
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <div align="center">
                                                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td width="8%">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td class="blackbig" width="92%">
                                                                                                                Last Name
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <div align="center">
                                                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td width="10%">
                                                                                                                <img src="images/spacer.gif" height="5" width="70">
                                                                                                            </td>
                                                                                                            <td valign="bottom" width="90%">
                                                                                                                <asp:TextBox ID="txt_LastName" runat="server"></asp:TextBox>
                                                                                                                &nbsp;*
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <div align="center">
                                                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td width="8%">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td class="blackbig" width="92%">
                                                                                                                Job Description
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td class="blackbig">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <asp:DropDownList ID="ddlJobDescription" runat="server">
                                                                                                            </asp:DropDownList>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="8%">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="92%">
                                                                                                            Company Name
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td height="23" width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <asp:TextBox ID="txt_CompanyName" runat="server"></asp:TextBox>
                                                                                                            &nbsp;&nbsp;*
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="8%">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="92%">
                                                                                                            Business Type
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td height="23" width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <asp:DropDownList ID="ddlBusinessType" runat="server">
                                                                                                            </asp:DropDownList>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="8%">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="92%">
                                                                                                            Country
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td height="23" width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <!--							<INPUT NAME="country" TYPE="text" ID="country" VALUE="India">-->
                                                                                                            <asp:DropDownList ID="ddlCountry" runat="server">
                                                                                                            </asp:DropDownList>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30" valign="top">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="8%">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="92%">
                                                                                                            Address
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td height="23" width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="8%">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="92%">
                                                                                                            State
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td height="23" width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <div id="divtxtstate" style="display: none">
                                                                                                                <input name="txt_state" id="txt_state" type="text">
                                                                                                                &nbsp;*
                                                                                                            </div>
                                                                                                            <div style="display: block;" id="divstate">
                                                                                                                <asp:DropDownList ID="ddlState" runat="server">
                                                                                                                </asp:DropDownList>
                                                                                                            </div>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="8%">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="92%">
                                                                                                            Zip / Pin Code
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td height="23" width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                                                                                                            &nbsp;*
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="8%">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="92%">
                                                                                                            Phone Number
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td height="23" width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                                                                                                            &nbsp;*
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="8%">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                        <td class="blackbig" width="92%">
                                                                                                            Mobile Number
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td class="blackbig" height="30">
                                                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td height="23" width="10%">
                                                                                                            <img src="images/spacer.gif" height="5" width="70">
                                                                                                        </td>
                                                                                                        <td valign="bottom" width="90%">
                                                                                                            <asp:TextBox ID="txtMobileNumber" runat="server"></asp:TextBox>
                                                                                                            &nbsp;*
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" valign="top">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" class="blackbig" height="35" valign="top">
                                                    <div align="center">
                                                        <asp:ImageButton ID="btnUpdateProfile" ImageUrl="images/btn-update-profile.png" Height="29"
                                                            Width="138" runat="server" OnClick="btnUpdateProfile_Click" /></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" class="blackbig" height="19" valign="top">
                                                    &nbsp;&nbsp;&nbsp;<span class="blackbig2">&lt;&lt;</span> <a href="MyAccount.aspx"
                                                        class="blackbig2">Back to MyAccounts</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" class="blackbig" height="19" valign="top">
                                                    &nbsp;
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
    </div>
</asp:Content>
