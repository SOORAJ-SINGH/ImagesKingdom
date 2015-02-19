<%@ Page Title="ShoppingCart" Language="C#" MasterPageFile="~/MasterPageWithoutLeftMenu.master"
    AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/StyleSheet1.css" rel="stylesheet" type="text/css" />
    <link href="css/popUp.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function popUp(divId, msg,count) {
            $('#SpanLogo').html(msg);
            $(divId).bPopup();


            $('#HeaderMenu_lblCartCount').html(count);   
        }

    </script>
    <script type="text/javascript">
        function ConfirmDelete() {
            if (confirm('Are you sure?') == true)
                return true;
            else
                return false;

        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divPopUp" class="ToPopup" style="left: 433px; position: absolute; top: 122px;
        z-index: 9999; opacity: 1;">
        <span class="button b-close"><span>X</span> </span>
        <br>
        <span id="SpanLogo" class="logo"></span>
    </div>
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
                                    <asp:Label ID="lblHead" runat="server" Text="Shopping Cart"></asp:Label>
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
                                        <div id="InfoCkeckout">
                                            <table width="30%" cellpadding="4px" cellspacing="3px">
                                                <tr>
                                                    <td colspan="2">
                                                        <li>
                                                            <asp:Label ID="lblItemsInCart" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                            &nbsp Item(s) Added to Cart</li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <li>Amount:&nbsp
                                                            <asp:Label ID="lblPrice" runat="server" Font-Bold="True"></asp:Label>&nbsp INR</li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <li>Discount :&nbsp<asp:Label ID="lblDiscount" runat="server" Font-Bold="True"></asp:Label>
                                                            &nbsp INR</li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <li>Amount Payable:<asp:Label ID="lblAtPayable" runat="server" Font-Bold="True"></asp:Label>
                                                            &nbsp INR</li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <li>Service Tax<asp:Label ID="lblServiceTax" runat="server" Font-Bold="True"></asp:Label>
                                                            INR</li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <li>Net Payable:<asp:Label ID="lblNetPayable" runat="server" Font-Bold="True"></asp:Label>
                                                            &nbsp INR</li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSendServiceTax" runat="server" ></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:ImageButton ID="btnCheckout" ImageUrl="images/checkout.jpg" OnClick="btnCheckout_Click"
                                                            Width="110px" Height="30px" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="btnAddMoreImages" ImageUrl="images/btn-add-cart.png" runat="server"
                                                            OnClick="btnAddMoreImages_Click" Width="110px" Height="30px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div id="DivCartMessage">
                                            <asp:Image ID="imgCart" ImageUrl="AdminPanel/images/emptycart.gif" Height="50px"
                                                Width="60px" runat="server" />
                                            <asp:Label ID="lblMsgCart" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#FF5050"></asp:Label>
                                        </div>
                                        <div id="imageContainer">
                                            <asp:Repeater ID="reapterImageInfo" runat="server">
                                                <HeaderTemplate>
                                                    <table width="60%">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr valign="top">
                                                        <td align="center" width="26%">
                                                            <img src="uploads/small_img/<%#Eval("SMALL_PHOTO")%>" width="160px" height="100px" />
                                                        </td>
                                                        <td valign="baseline" align="left">
                                                            <table border="0" width="70%" cellspacing="1" cellpadding="5" bgcolor="#333333">
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
                                                            <asp:ImageButton ID="imgDeleteItemCart"  CommandName="ImageCart" CommandArgument='<%#Eval("IMAGE_ID")  + "," + Eval("IMAGE_TYPE_ID") %>'
                                                                OnCommand="deleteImageFromCart" OnClientClick="return ConfirmDelete();" ImageUrl="~/AdminPanel/images/delete-gray.jpg"
                                                                Height="42px" Width="66px" runat="server" />
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table></FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="clr">
                                        </div>
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
