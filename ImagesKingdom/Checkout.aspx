<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/MasterPageWithoutLeftMenu.master"
    AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<%@ PreviousPageType VirtualPath="~/ShoppingCart.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/StyleSheet1.css" rel="stylesheet" type="text/css" />
    <script src="js/validation/jquery.validationEngine-en.js" type="text/javascript"></script>
    <script src="js/validation/jquery.validationEngine.js" type="text/javascript"></script>
    <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ContentPlaceHolder1_rbDemandDraft").addClass("validate[required] radio");
            $("#ContentPlaceHolder1_cbAgreement").addClass("validate[required] checkbox");
            $("#form1").validationEngine();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" align="center" border="0" width="100%">
        <tbody>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" align="center" border="0" width="968">
                        <tbody>
                            <tr>
                                <td width="6">
                                    <img src="images/curve-top-left.jpg" height="36" width="6">
                                </td>
                                <td class="page-heading" align="center" background="images/curve-top-center.jpg">
                                    <asp:Label ID="lblHead" runat="server" Text="Checkout"></asp:Label>
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
                                    <div id="Container">
                                        <table cellpadding="0" cellspacing="0" align="left" border="0" width="45%">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id="imageContainer" style="min-height: 860px;">
                                                            <asp:Repeater ID="reapterImageInfo" runat="server">
                                                                <HeaderTemplate>
                                                                    <table width="116%">
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr valign="top">
                                                                        <td align="center" width="26%">
                                                                            <img src="uploads/small_img/<%#Eval("SMALL_PHOTO")%>" width="160px" height="100px" />
                                                                        </td>
                                                                        <td valign="baseline" align="left">
                                                                            <table border="0" width="70%" cellspacing="1" cellpadding="5" bgcolor="#333333" style="border-color: #338AAE;">
                                                                                <th colspan="2">
                                                                                    <span class="linktopwhite">&nbsp;&nbsp;&nbsp;Item Information & Price </span>
                                                                                </th>
                                                                                <tr>
                                                                                    <td valign="bottom" style="width: 20px; margin-left: 12px" bgcolor="#FFFFFF">
                                                                                    </td>
                                                                                    <td bgcolor="#FFFFFF">
                                                                                        Image ID:<%#Eval("IMAGE_ID") %></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td bgcolor="#FFFFFF">
                                                                                    </td>
                                                                                    <td bgcolor="#FFFFFF">
                                                                                        Image Type:<%#Eval("IMAGE_TYPE") %></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td bgcolor="#FFFFFF">
                                                                                    </td>
                                                                                    <td bgcolor="#FFFFFF">
                                                                                        Price:<%#Eval("PRICE") %></td>
                                                                                </tr>
                                                                            </table>
                                                                            <br />
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </table></FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table width="55%" cellpadding="12px" cellspacing="7px" align="right" style="padding: 3px;
                                            border: thin groove #338aae;">
                                            <tr>
                                                <td colspan="2" bgcolor="#338AAE" height="25" width="100%">
                                                    <span class="linktopwhite">&nbsp;&nbsp;&nbsp;Your Existing Images in Shopping Cart
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr height="73px">
                                                <td colspan="2" class="bluetextLarge">
                                                    Total Amount Payable:&nbsp<asp:Label ID="lblTotalAmountCart" runat="server" Font-Bold="True"
                                                        Font-Size="Small"></asp:Label>
                                                    &nbsp[Inclusive of service tax]
                                                    <asp:Label ID="lblhiddenDiscount" runat="server" ></asp:Label>
                                                    <asp:Label ID="lblhiddenServiceTax" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" bgcolor="#338AAE" height="25" width="100%">
                                                    <span class="linktopwhite">&nbsp;&nbsp;&nbsp;Your Reconfirm Billing Address </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="40%" class="bluetext12">
                                                    First Name
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFirstName" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    Last Name
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblLastName" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    Email
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    Company
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCompany" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    City/State/Pin
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCity" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    Country
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCountry" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    Phone
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    Mobile
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    Client / Designated User
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtClientDesignatedUser" CssClass="validate[required]" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bluetext12">
                                                    Payment Mode
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rbDemandDraft" Text="Demand Draft" GroupName="Payment" runat="server" />
                                                    <br />
                                                    <asp:RadioButton ID="rbCheque" Text="Cheque" GroupName="Payment" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbAgreement" runat="server" />
                                                    <span>Please read the <a href="#">License Agreements</a> before clicking on the "Confirm
                                                        Order" button.</span>
                                                    <asp:ImageButton ID="imgbtnConfirmOrder" ImageUrl="images/ConfirmOrder.jpg" 
                                                        runat="server" onclick="imgbtnConfirmOrder_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
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
</asp:Content>
