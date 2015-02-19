<%@ Page Title="Pricing" Language="C#" MasterPageFile="~/MasterPageWithoutLeftMenu.master"
    AutoEventWireup="true" CodeFile="Pricing.aspx.cs" Inherits="Pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/StyleSheet1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <input id="hidden_text" type="text" runat="server" />
    <table cellpadding="0" cellspacing="0" align="center" border="0" width="968">
        <tbody>
            <tr>
                <td><img src="images/curve-top-left.jpg" alt="" height="36" width="6">
                </td>
                <td class="page-heading" align="left" background="images/curve-top-center.jpg">
                    <asp:Label ID="Label1" runat="server" Text="Pricing"></asp:Label>
                </td>
                <td width="6">
                    <img src="images/curve-top-right.jpg" alt="" height="36" width="6">
                </td>
            </tr>
            <tr>
                <td background="images/curve-mid-left.jpg">
                    &nbsp;
                </td>
                <td>
                    <div id="ImgContainer">
                        <asp:Image ID="imgShow" ImageAlign="Bottom" AlternateText="NA" Height="175px" Width="250px"
                            runat="server" BorderStyle="Dotted" BorderColor="#333333" BorderWidth="4px" />
                    </div>
                    <asp:ImageButton ID="imgBtnAddCart" ToolTip="Add to Cart" runat="server" ImageUrl="images/Shopping-Cart.gif"
                        Height="40px" Width="60px" OnClick="imgBtnAddCart_Click" />
                    <div id="GridTable">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvImageSizePrice" DataKeyNames="IMAGE_TYPE_ID" CellPadding="12"
                                    CellSpacing="10" Width="80%" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <asp:RadioButton ID="rbSelector" GroupName="SelectOne" runat="server" AutoPostBack="false"
                                                    OnCheckedChanged="rbSelector_CheckedChanged" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image Type">
                                            <ItemTemplate>
                                                <%#Eval("IMAGE_TYPE") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                <%#Eval("PRICE") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dimensions (Pixels)">
                                            <ItemTemplate>
                                                <%#Eval("DIMENSIONS_PIXELS")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dimensions (Inches)">
                                            <ItemTemplate>
                                                <%#Eval("DIMENSIONS_INCHES")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delivery Time">
                                            <ItemTemplate>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
                <td background="images/curve-mid-right.jpg">
                </td>
            </tr>
            <tr>
                <td background="images/curve-mid-left.jpg">
                </td>
                <td>
                    <table cellpadding="0" cellspacing="0" align="right" border="0" width="95%">
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
</asp:Content>
