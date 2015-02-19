<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Login"
    MasterPageFile="~/MasterPageWithoutLeftMenu.master" %>

<asp:Content ContentPlaceHolderID="head" runat="server" ID="cpHead">
    
    <%--<script src="js/jquery.js" type="text/javascript"></script> --%>
    <script src="js/validation/jquery.validationEngine.js" type="text/javascript"></script>
    <script src="js/validation/jquery.validationEngine-en.js" type="text/javascript"></script>
    <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <link href="css/popUp.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            function popUp(divId, msg) {
                $('#SpanLogo').html(msg);
                $(divId).bPopup();
                $('#mailloading').hide();
            
            }

    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();
            $('#mailloading').hide();
            $('#spanShopcart').hide();

            $('#forgotPassword').bind('click', function (e) {
                e.preventDefault();
                //alert();
                $('#divForgotPassword').bPopup();
                //                    easing: 'easeOutBack', //uses jQuery easing plugin
                //                    speed: 450,
                //                    transition: 'slideDown'
                //                }); 

            });

            $('#<%=btnForgot.ClientID%>').click(function () {
                //alert();
                $('#mailloading').show('slow');
                $.ajax({
                    type: "POST",
                    url: "Login.aspx/SentPasswordToMail",
                    data: '{EmailId:"' + $("#<%=txtEmailIDForgot.ClientID%>")[0].value + '"}',
                    contentType: "application/json;charset-utf-8",
                    dataType: "json",
                    success: function (response) {
                        var rs = response.d;
                        $('#mailloading').hide();
            
                        if (rs == 'sent') {

                            $('<br><label id="eCheckEmailId" class="redchk"><strong>Password sent sucessfully to above EmailId.</strong></label>').insertAfter('#<%=btnForgot.ClientID%>');
                        }
                        else {
                            $('<br><label id="eCheckEmailId" class="redchk"><strong>Error:Password not sent sucessfully to above EmailId.</strong></label>').insertAfter('#<%=btnForgot.ClientID%>');

                        }

                    },
                    failure: function (response) { alert(resp.d); }
                });
            });
        });
    </script>


</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="cp" runat="server">
    <div id="divPopUp" class="ToPopup" style="left: 433px; position: absolute; top: 122px;
        z-index: 9999; opacity: 1;">
        <span class="button b-close"><span>X</span> </span>
        <br>
        <span id="SpanLogo" class="logo"></span>
    </div>

    <div id="divForgotPassword" class="ToPopup" style="left: 433px; position: absolute; top: 122px;
        z-index: 9999; opacity: 1;">
        <span class="button b-close"><span>X</span> </span>
        <br/>
        <span id="Span1" class="logo"> Forgot Password!</span><br />
        <div style="margin-left: 50px; margin-top: 19px;">Email Id:<asp:TextBox ID="txtEmailIDForgot" Width="194px" runat="server"></asp:TextBox>
        <asp:Button ID="btnForgot" OnClick="btnForgot_click" Text="Forgot" runat="server" />
        </div>
        <br /><div id="mailloading" style="margin-right: -101px; padding-top: 41px; border-bottom-width: 0px; padding-bottom: 7px; margin-bottom: 11px; width: 223px; padding-left: 0px; margin-left: 56px; margin-top:-102px "  ></div>
    </div>
    <table cellpadding="0" cellspacing="0" align="center" border="0" width="968">
        <tbody>
            <tr>
                <td style="padding-left: 0px; padding-top: 0px;">
                    <table cellpadding="0" cellspacing="0" border="0" width="968">
                        <tbody>
                            <tr>
                                <td width="6">
                                    <img src="images/curve-top-left.jpg" height="36" width="6"/>
                                </td>
                                <td class="page-heading" align="left" background="images/curve-top-center.jpg">
                                    Login
                                </td>
                                <td width="6">
                                    <img src="images/curve-top-right.jpg" height="36" width="6"/>
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
                                                    <img src="images/spacer.gif" height="8" width="8"/>
                                                </td>
                                                <td valign="top" width="0%">
                                                    &nbsp;
                                                </td>
                                                <td valign="top" width="100%">
                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td height="0" valign="top" width="100%">
                                                                    <table cellpadding="0" cellspacing="1" border="0" width="100%">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td bgcolor="#FFFFFF" height="0" valign="top">
                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td style="padding-left: 11px;" valign="top" width="56%">
                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td align="center" valign="top" width="3%">
                                                                                                                    <span id="lblerror" style="color: Red; font-size: 11pt; font-weight: bold;"></span>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top" width="3%">
                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="style6" style="padding-right: 18px;" align="right" width="68%">
                                                                                                                    &nbsp; &nbsp; &nbsp; Not Registered Yet?&nbsp;<a href="NewRegister.aspx" class="style6">Register
                                                                                                                        Now</a>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="style6" style="padding-right: 18px;" align="right" width="68%">
                                                                                                                    Forgotten your password? <a id="forgotPassword" href="#" class="style6">Forgot Password</a>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top" width="3%">
                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="99%">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td valign="top" width="97%">
                                                                                                                    <br />
                                                                                                                </td>
                                                                                                                <td width="3%">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top" width="97%">
                                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                                        <tbody>
                                                                                                                            <tr>
                                                                                                                                <td colspan="2">
                                                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
                                                                                                                                                                                                    <img src="images/spacer.gif" height="6" width="6">
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td class="blackbold" height="22" width="32%">
                                                                                                                                                                                                    Your Email Address
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22" width="60%">
                                                                                                                                                                                                    <asp:TextBox ID="txtEmailID" class="validate[required,custom[email]]" runat="server"
                                                                                                                                                                                                        Width="250px"></asp:TextBox>
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
                                                                                                                                                                                                <td>
                                                                                                                                                                                                    &nbsp;
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td class="blackbold" height="22">
                                                                                                                                                                                                    Password
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22">
                                                                                                                                                                                                    <asp:TextBox ID="txtPassword" TextMode="Password" class="validate[required]" runat="server"
                                                                                                                                                                                                        Width="250px"></asp:TextBox>
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
                                                                                                                                                                                            <tr>
                                                                                                                                                                                                <td>
                                                                                                                                                                                                    &nbsp;
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td class="" height="22">
                                                                                                                                                                                                    &nbsp;
                                                                                                                                                                                                </td>
                                                                                                                                                                                                <td height="22">
                                                                                                                                                                                                    <asp:ImageButton ID="btnLogin" runat="server" ImageUrl="~/images/btn-login.png" OnClick="btnLogin_Click" />
                                                                                                                                                                                                    <br /><asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
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
                                                                                                                <td width="3%">
                                                                                                                    <div align="right">
                                                                                                                        <img src="images/spacer.gif" height="10" width="10"></div>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td style="padding-top: 6px;" height="136" valign="top" width="44%">
                                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                                <td class="bluetextlite1Large" height="33" valign="middle">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                                <td valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                                <td class="bluetextlite1Large" height="22" valign="middle">
                                                                                                                    Enjoy the benefits of Registration:
                                                                                                                </td>
                                                                                                                <td valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <!--  <TR>
                        <TD VALIGN="top">&nbsp;</TD>
                        <TD HEIGHT="0" VALIGN="middle" CLASS="blackbignew">1. Download a free high resolution image every month.</TD>
                        <TD VALIGN="top">&nbsp;</TD>
                      </TR>-->
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                                <td class="blackbignew" height="0" valign="middle">
                                                                                                                    1. Use personalized lightboxes to store and share images.
                                                                                                                </td>
                                                                                                                <td valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                                <td class="blackbignew" height="0" valign="top">
                                                                                                                    2. Receive free image research from ImagesBazaar experts.
                                                                                                                </td>
                                                                                                                <td valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td style="height: 0px" valign="top">
                                                                                                                </td>
                                                                                                                <td class="blackbignew" style="height: 0px" height="0" valign="top">
                                                                                                                    3. Get special offers and information via e-mail or post.
                                                                                                                </td>
                                                                                                                <td style="height: 0px" valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td style="height: 0px" valign="top">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                                <td class="blackbignew" style="height: 0px" height="0" valign="top">
                                                                                                                    4. Be the first to find out about new imagery and search tools.
                                                                                                                </td>
                                                                                                                <td style="height: 0px" valign="top">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                    <img src="images/spacer.gif" height="7" width="7">
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td align="right" valign="top" width="1%">
                                                                    <div align="right">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div align="right">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" height="0">
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
                                <td>
                                    <img src="images/curve-bottom-left.jpg" height="10" width="6">
                                </td>
                                <td background="images/curve-bottom-center.jpg">
                                </td>
                                <td>
                                    <img src="images/curve-bottom-right.jpg" height="10" width="6">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
