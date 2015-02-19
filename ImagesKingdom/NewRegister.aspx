<%@ Page Title="New Registration" Language="C#" MasterPageFile="~/MasterPageWithoutLeftMenu.master"
    AutoEventWireup="true" CodeFile="NewRegister.aspx.cs" Inherits="newReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="AdminPanel/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/validation/jquery.validationEngine.js" type="text/javascript"></script>
    <script src="js/validation/jquery.validationEngine-en.js" type="text/javascript"></script>
    <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ContentPlaceHolder1_cbAgree").addClass("validate[required] checkbox");
            $("#form1").validationEngine();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=txtEmailAddress.ClientID%>').focusout(function () {
                //alert("focusout");
                $.ajax({
                    type: "POST",
                    url: "NewRegister.aspx/GetEmail",
                    data: '{emailID:"' + $("#<%=txtEmailAddress.ClientID%>")[0].value + '"}',
                    contentType: "application/json;charset-utf-8",
                    dataType: "json",
                    success: function (response) {
                        var rs = response.d;
                        if (rs == 'exist') {
                            //alert("exist");
                            $('#lCheckEmailId').remove();
                            $('#eCheckEmailId').remove();
                            $('<label id="eCheckEmailId" class="red"><strong>Email Id already Registered!</strong></label>').insertAfter('#starRed');
                        }
                        else if (rs == 'notexist') {
                            //alert("not");
                            $('#eCheckEmailId').remove();
                            $('#lCheckEmailId').remove();
                            $('<label id="lCheckEmailId"></label>').insertAfter('#starRed');
                            $('#lCheckEmailId').addClass('valid');
                        }
                    },
                    failure: function (response) { alert(resp.d); }
                });
            });
        });
    </script>

    <script type="text/javascript">
        function hideCartCount() {
            $('#spanShopcart').hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="968" border="0" cellspacing="0" cellpadding="0" align="center">
        <tbody>
            <tr>
                <td width="6">
                    <img src="images/curve-top-left.jpg" width="6" height="36" />
                </td>
                <td align="left" background="images/curve-top-center.jpg" class="page-heading">
                    Hi! Ready to register with ImageKingdom?
                </td>
                <td width="6">
                    <img src="images/curve-top-right.jpg" width="6" height="36" />
                </td>
            </tr>
            <tr>
                <td background="images/curve-mid-left.jpg">
                    &nbsp;
                </td>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td colspan="5" valign="top">
                                    <img src="images/spacer.gif" width="9" height="9" />
                                </td>
                            </tr>
                            <tr>
                                <td width="89%" colspan="5" class="bluetext">
                                    <div align="center">
                                        <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td height="25" class="bluetextlite1Large">
                                                        Enjoy the benefits of Free Registration:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" class="bluetext">
                                                        <span class="blackbignew">
                                                            <!--1. Download a free high resolution image every month.<br>-->
                                                            1. Use personalized lightboxes to store and share images
                                                            <br />
                                                            2. Receive free image research from ImageKingdom experts<br />
                                                            3. Get special offers and information via e-mail or post.<br />
                                                            4. Be the first to find out about new imagery and search tools. </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="20" class="bluetext">
                                                        <div align="right">
                                                            <span class="blackbig">Already Registered ? <a href="Login.aspx">Login</a> or <a href="#">Forgot
                                                                Password</a> </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="20" class="style2">
                                                        <div align="right">
                                                            Fields marked by an asterisk(*) are required fields.</div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td height="131" colspan="5" valign="top">
                                    <div align="center">
                                        <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td valign="top" bgcolor="338AAE" style="height: 127px">
                                                        <div align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td colspan="2" style="padding-left: 5px" class="linktopwhite">
                                                                                            <span id="Label1"></span>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="338AAE">
                                                                                        <td height="20" colspan="2" style="padding-left: 5px" class="linktopwhite">
                                                                                            Login Information
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td width="31%" height="30" align="left" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                                            Your Email Address
                                                                                        </td>
                                                                                        <td width="69%" height="30" align="left" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                                            <asp:TextBox ID="txtEmailAddress" class="validate[required,custom[email]]" data-errormessage-value-missing="Email is required!"
                                                                                                data-errormessage-custom-error="Let me give you a hint: someone@nowhere.com"
                                                                                                placeholder="Enter your Email Address" runat="server" MaxLength="100" Width="206px"></asp:TextBox>
                                                                                            &nbsp;<span id="starRed" class="red">*</span><br />
                                                                                            <font class="style12">Note : Make sure you use a valid email address.<br />
                                                                                                Your log in details will be emailed to you.</font>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td height="30" align="left" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                                            Password
                                                                                        </td>
                                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                                            <asp:TextBox ID="txtPassword" placeholder="Enter your Password" TextMode="Password"
                                                                                                class="validate[required]" Width="206px" runat="server"></asp:TextBox><span>*</span><br />
                                                                                            <span class="black style7"><span class="style11"><font class="style12">Note: Password
                                                                                                should not contain any special characters, symbols or spaces </font></span></span>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr bgcolor="#FFFFFF">
                                                                                        <td height="30" align="left" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                                            Confirm Password
                                                                                        </td>
                                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                                            <asp:TextBox ID="txtConfirmPassword" runat="server" class="validate[required,equals[ContentPlaceHolder1_txtPassword]] text-input"
                                                                                                data-errormessage-pattern-mismatch="Password Not Matched" TextMode="Password"
                                                                                                placeholder="Enter your Password Again" Width="206px"></asp:TextBox>
                                                                                            &nbsp;<span class="red">*</span>
                                                                                            <input name="txt_email" type="hidden" id="txt_email">
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
                                <td height="0" colspan="5" valign="top">
                                    <div align="center">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td height="403" colspan="5" valign="top">
                                    <div align="center">
                                        <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td height="0" valign="top" bgcolor="338AAE">
                                                        <div align="center">
                                                            <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                                                <tbody>
                                                                    <tr bgcolor="338AAE">
                                                                        <td height="20" colspan="2" style="padding-left: 5px" class="linktopwhite">
                                                                            Contact Details
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td width="31%" height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            First Name
                                                                        </td>
                                                                        <td width="69%" height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:TextBox ID="txtFirstName" placeholder="Enter your First Name" class="validate[required]"
                                                                                MaxLength="35" runat="server" Width="206px"></asp:TextBox>&nbsp;&nbsp;<span class="red">*</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Last Name
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:TextBox ID="txtLastName" placeholder="Enter your Last Name" class="validate[required]"
                                                                                runat="server" Width="206px"></asp:TextBox>
                                                                            &nbsp;&nbsp;<span class="red">*</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Job Description
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:DropDownList ID="ddlJobDescription" runat="server">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Company Name
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:TextBox ID="txtCompanyName" placeholder="Enter your Company Name" class="validate[required]"
                                                                                MaxLength="200" runat="server" Width="206px"></asp:TextBox>
                                                                            &nbsp;<span class="red">*</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Business Type
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:DropDownList ID="ddlBusinessType" runat="server">
                                                                            </asp:DropDownList>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Country
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:DropDownList ID="ddlCountry" runat="server">
                                                                            </asp:DropDownList>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Address
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:TextBox ID="txtAddress" class="validate[required]" TextMode="MultiLine" runat="server"
                                                                                Height="49px" Width="206px"></asp:TextBox>
                                                                            &nbsp;&nbsp;<span class="red">*</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            State
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <div id="divtxtstate" style="display: none">
                                                                                <input name="txt_state" type="text" id="txt_state" maxlength="50" size="35" />
                                                                                &nbsp;<span class="red" />*</span></div>
                                                                            <div id="divstate">
                                                                                <asp:DropDownList ID="ddlState" runat="server">
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Zip / Pin Code
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:TextBox ID="txtZipPinCode" placeholder="Enter your Zip Code " class="validate[required]"
                                                                                MaxLength="7" runat="server" Width="206px"></asp:TextBox>&nbsp;<span class="red">&nbsp;*</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Phone Number
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:TextBox ID="txtPhoneNumber" placeholder="Enter your Phone number " class="validate[required]"
                                                                                Width="206px" runat="server"></asp:TextBox>
                                                                            &nbsp;<span class="red">&nbsp;*</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" valign="top" class="blackbig" style="padding: 5px 0 0 20px;">
                                                                            Mobile Number
                                                                        </td>
                                                                        <td height="30" class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:TextBox ID="txtMobileNumber" placeholder="Enter your Mobile Number" class="validate[required]"
                                                                                MaxLength="20" runat="server" Width="206px"></asp:TextBox>
                                                                            &nbsp;&nbsp;<span class="red">*</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td class="blackbig" valign="top" style="padding: 5px 0 0 20px;">
                                                                            Where did you hear about us from ?
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            </table>
                                                                        </td>
                                                                        <td class="blackbig" style="padding: 5px 0 10px 70px;">
                                                                            <asp:DropDownList ID="ddlWhereHeard" runat="server">
                                                                            </asp:DropDownList>
                                                                            &nbsp;<br />
                                                                            <div style="padding: 10px 0 0 0;">
                                                                                Other :
                                                                                <asp:TextBox ID="txtWhereHeardOther" runat="server" Width="156px"></asp:TextBox>
                                                                                &nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#FFFFFF">
                                                                        <td height="30" colspan="2" class="blackbig">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td colspan="4" height="10px">
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="4" class="blackbig" style="padding-left: 7px">
                                                                                            Before we can enable your membership benefits, we ask you to agree to our <a href="#"
                                                                                                class="bluetextlite">Terms and Conditions</a> for comp usage of Images on our
                                                                                            site. Please read it carefully. If you agree Click "I Agree" to continue.<span class="bluetext">&nbsp;&nbsp;
                                                                                                <span class="bluetext" style="padding-left: 5px"></span>
                                                                                                <asp:CheckBox ID="cbAgree" runat="server" Text="I Agree" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="3" align="center" class="bluetext">
                                                                                            <span class="red"><span id="lblmsg"></span></span>
                                                                                        </td>
                                                                                        <td width="2%">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left" class="blackbig" style="padding-right: 8px">
                                                                                            <strong>&nbsp;&nbsp;Please Enter the Code :</strong>
                                                                                        </td>
                                                                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                                        </asp:ScriptManager>
                                                                                        <td>
                                                                                            <asp:UpdatePanel ID="upCaptcha" runat="server">
                                                                                                <ContentTemplate>
                                                                                                    <table>
                                                                                                        <tr>
                                                                                                            <td style="height: 50px; width: 150px;">
                                                                                                                <asp:Image ID="imgCaptcha" runat="server" />
                                                                                                            </td>
                                                                                                            <td valign="middle">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </ContentTemplate>
                                                                                            </asp:UpdatePanel>
                                                                                        </td>
                                                                                        <td width="64%">
                                                                                            <span class="blackbig" style="padding-right: 8px"><span style="padding-right: 5px"><span
                                                                                                class="blackbig"><span>
                                                                                                    <asp:TextBox ID="txtCaptach" placeholder="Enter the Code from Image" runat="server"
                                                                                                        Width="160px"></asp:TextBox>
                                                                                                </span></span><span class="blackbig" style="padding-right: 8px"><span class="red"><strong>
                                                                                                    *</strong></span></span></span></span>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="3px" colspan="3" align="center" valign="bottom">
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="21%" align="center">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td width="13%" align="center">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td align="left">
                                                                                            <asp:ImageButton ID="imgBtnRegister" runat="server" ImageUrl="images/btn-register.png"
                                                                                                OnClick="imgBtnRegister_Click" />
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="3" align="center" height="10px">
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
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" valign="top" height="5">
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
                    <img src="images/curve-bottom-left.jpg" width="6" height="10" />
                </td>
                <td background="images/curve-bottom-center.jpg">
                </td>
                <td>
                    <img src="images/curve-bottom-right.jpg" width="6" height="10" />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
