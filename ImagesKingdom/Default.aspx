<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="UserControl/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc2" %>
<%@ Register Src="~/UserControl/Header.ascx" TagName="HeaderMenu" TagPrefix="UcHeader" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Image Kingdom</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/nn.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />

        <script src="AdminPanel/js/jquery-1.11.1.min.js" type="text/javascript"></script>

    <link href="AdminPanel/css/jquery-ui-autoComplete.css" rel="stylesheet" type="text/css" />
   
    <script src="AdminPanel/js/jquery-ui-1.10.4.custom.js" type="text/javascript"></script>
    <script src="AdminPanel/js/GetImageCode.js" type="text/javascript"></script>
   <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-latest.js"></script>
   --%> 
   <script type="text/javascript">
        function hideCartCount() {
            $('#spanShopcart').hide();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smain" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <!--Begin User control Header -->
    <UcHeader:HeaderMenu ID="HeaderMenu" runat="server" />
    <!--End User control Header -->
    <table cellpadding="0" cellspacing="0" align="center" border="0" width="968">
        <tbody>
            <tr>
                <td valign="top">
                    <!--<form name="formcateList" action="">
    <input id="currentId" name="currentId" value="1" type="hidden"> 
	<input id="currentIdPrevious" name="currentIdPrevious" value="1" type="hidden">
	</form>-->
                    <div>
                        <table style="background: url(images_960/bg_categories.gif) repeat-y" cellpadding="0"
                            cellspacing="0" border="0" width="191">
                            <tbody>
                                <tr>
                                    <td>
                                        <img src="images/browse-img-categories.png" alt="" height="27" width="192"/>
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
                                    <td style="background: url(images_960/bottom_curve_category.png) bottom; height: 4px;">
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
                                    <a href="#">
                                        <img src="images/Homeimage.jpg" alt="" border="0"></a>
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
    <table cellpadding="0" cellspacing="0" align="center" border="0" width="970">
        <tbody>
            <tr>
                <td>
                    <img src="images/spacer.gif" alt="" height="1" width="1">
                </td>
            </tr>
            <tr>
                <td style="width: 4px; height: 1px; background: url(images/bgDot.gif) left top no-repeat;
                    padding: 0px; display: block;">
                    <img src="images/spacer.gif" alt="">
                </td>
            </tr>
        </tbody>
    </table>
    <table cellpadding="0" cellspacing="0" align="center" border="0" width="970">
        <tbody>
            <tr>
                <td align="left" width="50%">
                    <table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
                        <tbody>
                            <tr>
                                <td>
                                    <span style="padding: 0px">
                                        <img src="images/spacer.gif" alt="" height="1" width="1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; color: #62655C;
                                    font-weight: bold;" height="20">
                                    Toll Free <span style="color: #1E7EA6;">1800 11 6869</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="padding: 0px">
                                        <img src="images/spacer.gif" alt="" height="1" width="1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbold01" height="20">
                                    Company Info
                                </td>
                            </tr>
                            <tr>
                                <td class="lightFooter" height="20">
                                    <a href="#" class="blackbigFooter">Home</a>&nbsp; | &nbsp;<a href="#" class="blackbigFooter">About
                                        Us</a> &nbsp;|&nbsp; <a href="#" class="blackbigFooter">Press Releases</a> &nbsp;|&nbsp;
                                    <a href="#" class="blackbigFooter">Testimonials</a> &nbsp;|&nbsp; <a href="#" class="blackbigFooter">
                                        Image Research</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="padding: 0px">
                                        <img src="images/spacer.gif" alt="" height="1" width="1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbold01" height="20">
                                    Learn More
                                </td>
                            </tr>
                            <tr>
                                <td class="lightFooter" height="20">
                                    <a href="#" class="blackbigFooter">Pricing</a> &nbsp;|&nbsp; <a href="#" class="blackbigFooter">
                                        Licensing</a> &nbsp;|&nbsp; <a href="#" class="blackbigFooter">Terms of Use</a>
                                    &nbsp;|&nbsp; <a href="#" class="blackbigFooter">Privacy Policy</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="padding: 0px">
                                        <img src="images/spacer.gif" alt="" height="1" width="1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbold01" height="20">
                                    Need Help
                                </td>
                            </tr>
                            <tr>
                                <td class="lightFooter" height="20">
                                    <a href="#" class="blackbigFooter">FAQ</a> &nbsp;|&nbsp; <a href="#" class="blackbigFooter">
                                        Search Tips</a> &nbsp;|&nbsp; <a href="#" class="blackbigFooter">Contact Us</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="padding: 0px">
                                        <img src="images/spacer.gif" alt="" height="1" width="1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="graytext">© ImagesBazaar.com. A division of Mash Audio Visuals Pvt. Ltd.
                                        All rights reserved.</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="padding: 0px">
                                        <img src="images/spacer.gif" alt="" height="1" width="1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="padding: 0px">
                                        <img src="images/spacer.gif" alt="" height="1" width="1"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td valign="top" width="50%">
                    <table cellspacing="0" border="0" width="100%">
                        <tbody>
                            <tr>
                                <td>
                                    <span style="padding: 0px">
                                        <img src="images/spacer.gif" alt="" height="1" width="1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbold01" align="right" valign="top">
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td style="font-family: Arial, Helvetica, sans-serif; font-size: 11px; color: #666666;
                                                    font-weight: bold; text-decoration: none; padding-top: 3px; padding-right: 3px;"
                                                    align="right" valign="top" width="80%">
                                                    100% Satisfaction<br>
                                                    Guaranteed!
                                                </td>
                                                <td style="padding-top: 4px;" align="right" valign="top">
                                                    <div id="navigation">
                                                        <ul id="nav">
                                                            <li><a href="#" title="Demo">
                                                                <img src="images/btn-Help_2.png" alt="" border="0" height="26" width="91"></a>
                                                                <ul style="font-weight: normal;">
                                                                    <li><a href="#">Pricing</a></li>
                                                                    <li><a href="#">Search Tips</a></li>
                                                                    <li><a href="#">Collections</a></li>
                                                                    <li><a href="#">Ordering</a></li>
                                                                    <li><a href="#">Downloading</a></li>
                                                                    <li><a href="#">Licensing</a></li>
                                                                    <li><a href="#">Technical</a></li>
                                                                    <li><a href="#">Contact Us</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="5">
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbold01" align="right" valign="top">
                                    Why ImagesKingDom?
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbigFooter" align="right" valign="top">
                                    - Over 10,00,000 creative images &amp; videos with Indian faces.
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbigFooter" align="right" valign="top">
                                    - One of the fastest &amp; most user friendly image search engines in the World.
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbigFooter" align="right" valign="top">
                                    - All images are colour corrected and retouched as per international standards.
                                </td>
                            </tr>
                            <tr>
                                <td class="blackbigFooter" align="right" valign="top">
                                    - Super quick turnaround time &amp; extraordinary customer service. <a href="#" style="font-size: 8pt;
                                        font-family: Arial, Helvetica, sans-serif;">Read</a> testimonials.
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">
                                    <table title="Click to Verify - This site chose Symantec SSL for secure e-commerce and confidential communications."
                                        cellpadding="2" cellspacing="0" border="0" width="135">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <img src="images/PaymentGateways_3.jpg" alt="" border="0" height="59" width="158">
                                                </td>
                                                <td align="center" valign="top" width="135">
                                                    <script type="text/javascript" src="#"></script>
                                                    <!--<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" id="s_s" align="" height="72" width="100"> <param name="movie" value="https://seal.verisign.com/getseal?at=1&amp;sealid=2&amp;dn=www.imagesbazaar.com&amp;lang=en"> <param name="loop" value="false"> <param name="menu" value="false"> <param name="quality" value="best"> <param name="wmode" value="transparent"> <param name="allowScriptAccess" value="always"> <embed src="Images%20Bazaar%20%20Largest%20collection%20of%20Indian%20images_files/getseal.swf" loop="false" menu="false" quality="best" wmode="transparent" swliveconnect="FALSE" name="s_s" type="application/x-shockwave-flash" pluginspage="https://www.macromedia.com/go/getflashplayer" allowscriptaccess="always" align="" height="72" width="100">  </object>-->
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
    <script>        $("#accordion > li").click(function () {
            if (false == $(this).next().is(':visible')) { $('#accordion > ul').slideUp(300); }
            $(this).next().slideToggle(300);
        }); $('#accordion > ul:eq(0)').show();</script>
    </form>
</body>
</html>
