<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount"
    MasterPageFile="~/MasterPageWithoutLeftMenu.master" %>

<%@ Register Src="UserControl/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="cp" runat="server">
    <table cellpadding="0" cellspacing="0" align="center" border="0" width="968">
        <asp:ScriptManager ID="smain" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <tbody>
            <tr>
                <td valign="top">
                    <!--<form name="formcateList" action="">
    <input id="currentId" name="currentId" value="1" type="hidden"> 
	<input id="currentIdPrevious" name="currentIdPrevious" value="1" type="hidden">
	</form>-->
                    <div>
                        <table style="background: url(images/bg_categories.gif) repeat-y" cellpadding="0"
                            cellspacing="0" border="0" width="191">
                            <tbody>
                                <tr>
                                    <td>
                                        <img src="images/browse-img-categories.png" alt="" height="27" width="192">
                                    </td>
                                </tr>
                                <tr>
                                    <!--accordian-->
                                    <td style="padding-top: 7Px; padding-bottom: 6px;">
                                        <uc2:LeftMenu ID="LeftMenu1" runat="server" />
                                    </td>
                                </tr>
                                <!--accordian end-->
                                <tr>
                                    <td style="background: url(images/bottom_curve_category.png) bottom; height: 4px;">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <a href="#">
                                            <img src="images/BrowseSubscriptionImages.png" alt="" border="0" height="29" width="192">
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
                <td style="padding-left: 4px;" valign="top">
                    <table cellpadding="0" cellspacing="0" border="0" width="0%">
                        <tbody>
                            <tr>
                                <td align="right">
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td style="background: url(images/heading-top-bg.jpg) no-repeat" class="page-heading"
                                                    height="36">
                                                    My Account
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background: url(images/middle_body_bg.jpg) repeat-y">
                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <img src="images/spacer.gif" height="5" width="1">
                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td align="center" valign="top">
                                                                                    <span id="lblmsg" class="blackbold"></span>
                                                                                    <input name="pass" type="hidden">
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center" height="5" valign="top">
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td height="103" valign="top">
                                                                                    <div align="center">
                                                                                        <table cellpadding="0" cellspacing="0" border="0" width="605">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td bgcolor="338AAE" height="0" valign="top">
                                                                                                        <table cellpadding="0" cellspacing="1" border="0" width="100%">
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td bgcolor="#FFFFFF" height="25" valign="top" width="39%">
                                                                                                                        <table cellpadding="0" cellspacing="0" border="0" width="98%">
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td class="bluetext" height="20" width="20">
                                                                                                                                        <div align="center">
                                                                                                                                            •</div>
                                                                                                                                    </td>
                                                                                                                                    <td class="bluetext" align="left" height="20" width="89%">
                                                                                                                                        <a href="EditMemberDetails.aspx" class="bluetext">Edit Profile </a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td class="bluetext" height="20" width="20">
                                                                                                                                        <div align="center">
                                                                                                                                            •</div>
                                                                                                                                    </td>
                                                                                                                                    <td class="bluetext" align="left" height="20">
                                                                                                                                        <a href="ChangePassword.aspx" class="bluetext">Change Password</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td class="bluetext" height="20" width="20">
                                                                                                                                        <div align="center">
                                                                                                                                            •</div>
                                                                                                                                    </td>
                                                                                                                                    <td class="bluetext" align="left" height="20">
                                                                                                                                        <a href="ShoppingCart.aspx" class="bluetext">View Shopping Cart</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                    <td bgcolor="#FFFFFF" height="25" valign="top" width="61%">
                                                                                                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                                            <tbody>
                                                                                                                                <tr valign="top">
                                                                                                                                    <td colspan="2" height="0">
                                                                                                                                        <img src="images/spacer.gif" height="6" width="6">
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td class="bluetext" height="20" valign="top" width="20">
                                                                                                                                        <div align="center">
                                                                                                                                            •</div>
                                                                                                                                    </td>
                                                                                                                                    <td class="bluetext" align="left" height="0" valign="middle" width="94%">
                                                                                                                                        <a href="MemberLightBox.aspx" class="bluetext">Light Box Manager </a>
                                                                                                                                        <br>
                                                                                                                                        <span class="blackbig">View Current Light Boxes
                                                                                                                                            <br>
                                                                                                                                        </span>
                                                                                                                                        <br>
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
                                                                            <tr>
                                                                                <td height="0" valign="top">
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 15px" height="0" valign="top">
                                                                                    <div align="center">
                                                                                        <img src="images/spacer.gif" height="15" width="25"></div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="0">
                                                                                    <div align="center">
                                                                                        <table cellpadding="0" cellspacing="0" border="0" width="600">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td bgcolor="338AAE" height="0" valign="top">
                                                                                                        <table cellpadding="0" cellspacing="1" border="0" width="100%">
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td class="linktopwhite veiw_al" style="width: 599px" height="25">
                                                                                                                        &nbsp;&nbsp;&nbsp;Confirmed Orders
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr bgcolor="#FFFFFF">
                                                                                                                    <td class="linktopwhite" style="width: 599px" align="center" bgcolor="#FFFFFF" height="25"
                                                                                                                        valign="top">
                                                                                                                        <table class="black" id="dg" style="color: #333333; width: 100%;" cellpadding="4"
                                                                                                                            cellspacing="1" border="0">
                                                                                                                            <tbody>
                                                                                                                                <tr class="blackbig" style="color: White; background-color: #AAAAAA; font-weight: bold;">
                                                                                                                                    <td>
                                                                                                                                        Invoice NO.
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        Order Date
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        Total Amount
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        Order Details
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        Payment Status
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        Dowanload
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        104413
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        19-04-2014
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        24450
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">View / Print</a>
                                                                                                                                    </td>
                                                                                                                                    <td class=" received">
                                                                                                                                        Received
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                        <a href="#">Dowanload</a>
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
                                                                            <tr>
                                                                                <td height="0" valign="top">
                                                                                    <div align="center">
                                                                                        <img src="images/spacer.gif" height="15" width="25"></div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="0" valign="top">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="0" valign="top">
                                                                                    &nbsp;
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
                                            <tr>
                                                <td>
                                                    <img src="images/bottom_curve_body.jpg" height="10" width="772">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                            <tr>
                                <td>
                                    <img src="images/spacer.gif" alt="" height="1" width="1">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
