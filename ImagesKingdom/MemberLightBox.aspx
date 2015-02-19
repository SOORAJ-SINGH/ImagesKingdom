<%@ Page Title="LightBox" Language="C#" AutoEventWireup="true" CodeFile="MemberLightBox.aspx.cs" Inherits="MemberLightBox"
    MasterPageFile="~/MasterPageWithoutLeftMenu.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="cp" runat="server">
    <!--container start-->
    <table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
        <script type="text/javascript">
//<![CDATA[
            Sys.Application.initialize();
            Sys.Application.add_init(function () {
                $create(AjaxControlToolkit.AutoCompleteBehavior, { "completionInterval": 0, "completionListCssClass": "list3", "completionListItemCssClass": "listitem3", "delimiterCharacters": "", "highlightedItemCssClass": "hoverlistitem3", "id": "header_dynamicMyaccount_AutoCompleteExtender1", "minimumPrefixLength": 2, "serviceMethod": "GetProducts", "servicePath": "http://www.imagesbazaar.com/autoservices.asmx" }, { "itemSelected": AutoCompletedClientItemSelected }, null, $get("header_dynamicMyaccount_txtsearch1"));
            });
//]]>
        </script>
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
                                    Lightboxes
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
                                    <table cellpadding="0" cellspacing="0" align="center" border="0" width="95%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#338AAE" height="25" width="100%">
                                                    <span class="linktopwhite">&nbsp;&nbsp;&nbsp;Your Existing Lightboxes </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="black" rules="cols" id="dg" style="color: #333333; width: 100%;" cellpadding="4"
                                                        cellspacing="1" border="1">
                                                        <tbody>
                                                            <tr style="color: White; background-color: #AAAAAA; font-weight: bold;">
                                                                <td>
                                                                    LightBox
                                                                </td>
                                                                <td>
                                                                    No. of Images
                                                                </td>
                                                                <td>
                                                                    View
                                                                </td>
                                                                <td>
                                                                    Rename
                                                                </td>
                                                                <td>
                                                                    Delete
                                                                </td>
                                                                <td>
                                                                    Email
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    MyLightBox
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblCountImages" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <a href="LightBox.aspx">View</a>
                                                                </td>
                                                                <td>
                                                                    <a href="#">Rename</a>
                                                                </td>
                                                                <td>
                                                                    <a href="#">Delete</a>
                                                                </td>
                                                                <td>
                                                                    <a href="#">Email</a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" align="center" border="0" width="95%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext">
                                                    <strong>What is a Lightbox?</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <img src="images/spacer.gif" height="5" width="5">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext" width="80%">
                                                    <p class="blackbig" align="justify">
                                                        A lightbox is a "folder" on our website that you create, in which you can store,
                                                        manage, and share images of interest to you. Lightboxes are designed to help you
                                                        get organized. When you find an image on our website that you like, you can save
                                                        it to a lightbox you've created and continue searching. No need to save the image
                                                        to your hard drive or jot down the image number.
                                                        <br>
                                                        <br>
                                                        Go to <a href="#" class="bluetext">Help - Lightboxes</a> for more information.
                                                    </p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" align="center" border="0" width="95%">
                                        <tbody>
                                            <tr>
                                                <td colspan="5" class="blackbig" height="19" valign="top">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" class="blackbig" height="19" valign="top">
                                                    <span class="blackbig2">&lt;&lt;</span> <a href="MyAccount.aspx" class="blackbig2">Back
                                                        to MyAccounts</a>
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
    <!--container end-->
</asp:Content>
