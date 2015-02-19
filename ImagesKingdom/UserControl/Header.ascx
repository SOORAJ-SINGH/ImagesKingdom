<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="UserControl_Header" %>
<table cellpadding="0" cellspacing="0" align="center" border="0" width="1010">
    <tbody>
        <tr>
            <td style="padding: 0px 20px;">
                <table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td colspan="2" width="100%">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img src="images/top_curve_left.jpg" />
                                            </td>
                                            <td style="background: url(images/top_curve_cen.jpg) repeat-x;" align="left" height="140"
                                                valign="top" width="100%">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="left" valign="top">
                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td height="67" width="30%">
                                                                                <a href="#">
                                                                                    <img id="logoImageKindom" src="images/Logo1_imagesKingDom.JPG" height="86px" width="226px"
                                                                                        style="border-radius: 55px;" border="0" /></a>
                                                                            </td>
                                                                            <td align="right" width="70%">
                                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td class="ib_top_nav" align="right">
                                                                                                <ul>
                                                                                                    <li style="border-right: none; padding-right: 0px;"><a href="#">Contact Us</a></li>
                                                                                                    <li><a id="shopCart" href="ShoppingCart.aspx">Shopping Cart</a><span id="spanShopcart"><asp:Label ID="lblCartCount" runat="server"></asp:Label></span></li>
                                                                                                    <li><a href="MemberLightBox.aspx">Lightboxes</a></li>
                                                                                                    <li><a href="MyAccount.aspx">My Account</a></li>
                                                                                                    <li><a href="#">About Us</a></li>
                                                                                                    <li><a href="Default.aspx">Home</a></li>
                                                                                                </ul>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="10">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="login_register" style="padding-right: 8px;" align="right">
                                                                                                <ul>
                                                                                                    <li><a runat="server" id="lnlLogin_LogOut">
                                                                                                        <asp:Label ID="lblLogin_Logout" runat="server"></asp:Label></a></li>
                                                                                                    <li>|</li>
                                                                                                    <li><a href="NewRegister.aspx">
                                                                                                        <asp:Label ID="lblRegister" runat="server" Text="Register"></asp:Label></a></li>
                                                                                                </ul>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                                <div style="display:none;">
                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="446">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td align="right" width="144">
                                                                                                    <input id="username" name="username" tabindex="1" onchange="return clickButton(event,'loginid')"
                                                                                                        onkeypress="return clickButton(event,'loginid')" class="ib_input watermarked_User"
                                                                                                        onblur="javascript:ShowWatermarkUser()" onfocus="javascript:HideWatermarkUser()"
                                                                                                        style="color: #000000; width: 137px;"/>
                                                                                                </td>
                                                                                                <td align="right" width="144">
                                                                                                
                                                                                                    <input id="txtpassword" name="txtpassword" tabindex="2" onchange="return clickButton(event,'loginid')"
                                                                                                        onkeypress="return clickButton(event,'loginid')" class="ib_input watermarked_password"
                                                                                                        onblur="javascript:ShowWatermarkpassword()" onfocus="javascript:HideWatermarkpassword()"
                                                                                                        style="color: #000000; width: 137px;" type="password" />
                                                                                                </td>
                                                                                                <td align="right" width="79">
                                                                                                    <input name="loginid" id="loginid"  style="background: url(images/btn-login_new.png);
                                                                                                        border: none; width: 75px; height: 26px;" value="" tabindex="3" onclick="javascript:return chkValnew();"
                                                                                                        type="button"/>
                                                                                                </td>
                                                                                                <td align="right" width="79">
                                                                                                    <a href="#">
                                                                                                        <img src="images/btn-register.png" alt="Register Now" border="0" height="26" width="75"></a>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="16">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="57" valign="top">
                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td valign="top" width="80%">
                                                                                <div style="display: block">
                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="0%">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td width="310">
                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="315">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td align="right" height="34" valign="middle" width="61%">
                                                                                                                    <script type="text/javascript">
//<![CDATA[
                                                                                                                        Sys.WebForms.PageRequestManager._initialize('header_dynamicMyaccountCategory$ToolkitScriptManager1', document.getElementById('formcateList'));
                                                                                                                        Sys.WebForms.PageRequestManager.getInstance()._updateControls([], [], [], 90);
//]]>
                                                                                                                    </script>
                                                                                                                    <asp:TextBox ID="txtSearch" runat="server" class="ib_input_search"></asp:TextBox>
                                                                                                                    <ul style="display: none; visibility: hidden; position: absolute;" class="list3"
                                                                                                                        id="header_dynamicMyaccountCategory_AutoCompleteExtender1_completionListElem">
                                                                                                                    </ul>
                                                                                                                </td>
                                                                                                                <td height="34" valign="middle" width="35%">
                                                                                                                    <asp:Button ID="btnSearch" runat="server" Style="background: url(images/btn_search.gif);
                                                                                                                        border: none; width: 80px; height: 34px;" onclick="btnSearch_Click" />
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td width="80">
                                                                                                    <table class="linktopwhitenew" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td valign="bottom" width="2%">
                                                                                                                    <input class="radio" name="radbox1" value="Images" checked="checked" type="radio">
                                                                                                                </td>
                                                                                                                <td width="98%">
                                                                                                                    <strong><font color="#666666">Images</font></strong>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td style="height: 20px">
                                                                                                                    <input class="radio" name="radbox1" value="Videos" onclick="gotoIB();" type="radio">
                                                                                                                </td>
                                                                                                                <td style="height: 20px">
                                                                                                                    <strong><font color="#666666">Videos</font></strong>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td width="252">
                                                                                                    <table class="linktopwhitenew" cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td valign="bottom" width="2%">
                                                                                                                    <input class="style1" name="execl" id="execl" value="0" unselectable="off" checked="checked"
                                                                                                                        type="checkbox">
                                                                                                                </td>
                                                                                                                <td class="linktopgray" width="98%">
                                                                                                                    Exclusive Rights <a href="#" onclick="addfiles(); return false" class="linktopwhite">
                                                                                                                        [?]</a>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <input class="style1" name="nonexecl" id="nonexecl" value="0" unselectable="off"
                                                                                                                        checked="checked" type="checkbox">
                                                                                                                </td>
                                                                                                                <td class="linktopgray">
                                                                                                                    Non-Exclusive Rights <a href="#" onclick="addfiles(); return false" class="linktopwhite">
                                                                                                                        [?]</a><a href="#"></a>
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
                                                                            <td style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #666666;
                                                                                font-weight: normal; text-decoration: none; padding-top: 3px; padding-right: 3px;"
                                                                                align="right" valign="top">
                                                                                <span style="font-size: 18px; margin-right: 18px;">World's No.1</span><br>
                                                                                collection of Indian images
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
                                                <img src="images/top_curve_right.jpg">
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
