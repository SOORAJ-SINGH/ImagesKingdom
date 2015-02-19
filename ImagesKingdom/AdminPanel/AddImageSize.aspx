<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddImageSize.aspx.cs" Inherits="AdminPanel_AddImageSize"
    MasterPageFile="~/AdminPanel/AdminMasterPage.master" %>

<asp:Content ContentPlaceHolderID="cpAdmin" ID="cp" runat="server">
    <div id="content">
        <div class="breadcrumb">
            <a href="#">Home</a>
        </div>
        <div class="box">
            <div class="heading">
                <h1>
                    <img src="images/home.png" alt="">
                    New Image Information</h1>
            </div>
            <div class="content">
                <div class="dashboard-heading">
                    Add New Image
                </div>
                <div class="overview2">
                    <div class="dashboard-content">
                        <table width="841" cellpadding="5" cellspacing="5">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblWarning" runat="server" CssClass="lableRedTextErrorMsg"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <table width="72%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="31%">
                                                    <a href="AddNewImageData.aspx">
                                                        <img src="images/image_info.jpg" width="226" height="64" border="0" /></a>
                                                </td>
                                                <td width="19%" style="background-color: #128BD7;">
                                                    <a href="AddImageSize.aspx">
                                                        <img src="images/image_size.jpg" style="padding: 9px 6px 9px 6px;" width="135" height="64"
                                                            border="0" /></a>
                                                </td>
                                                <td width="50%">
                                                    <a href="AddRelatedImages.aspx">
                                                        <img src="images/relatedImages.jpg" width="230" height="64" border="0" /></a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 264px; padding-top: 36px;">
                                        <table>
                                            <tr>
                                                <td>
                                                    Image Type
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlImageType" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Price
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Discount
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDiscount" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Net Price
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtNetPrice" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSaveImageType" CssClass="btnNew" runat="server" Text="Save" OnClick="btnSaveImageType_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <center>
                            <asp:GridView ID="gvImageType" Width="80%" Height="122px" runat="server" AutoGenerateColumns="false"
                            HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black" HeaderStyle-Font-Size="12px" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="AliceBlue" />
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Image Type">
                                        <ItemTemplate>
                                            <%#Eval("IMAGE_TYPE")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dimension Inches">
                                        <ItemTemplate>
                                            <%#Eval("DIMENSIONS_INCHES")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dimension Pixels">
                                        <ItemTemplate>
                                            <%#Eval("DIMENSIONS_PIXELS")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Active / InActive" HeaderStyle-Width="10%">
                                        <ItemTemplate>
                                            <div align="center">
                                                <asp:ImageButton ID="imgBtnDelete" runat="server" CommandArgument='<%#Eval("IMAGE_TYPE_ID") %>'
                                                    OnCommand="Is_ActiveChange" ImageUrl='<%#Eval("Is_Active") %>' Height="20px"
                                                    Width="20px" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
