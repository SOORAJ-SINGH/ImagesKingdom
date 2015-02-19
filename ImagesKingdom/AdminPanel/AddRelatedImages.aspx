<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddRelatedImages.aspx.cs" Inherits="AdminPanel_AddRelatedImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpAdmin" runat="Server">
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
                                            <tr align="center">
                                                <td width="31%">
                                                    <a href="AddNewImageData.aspx">
                                                        <img src="images/image_info.jpg" width="226" height="64" border="0" /></a>
                                                </td>
                                                <td width="19%">
                                                    <a href="AddImageSize.aspx">
                                                        <img src="images/image_size.jpg" width="135" height="64" border="0" /></a>
                                                </td>
                                                <td width="50%" style=" background-color: #128BD7;">
                                                    <a href="AddRelatedImages.aspx">
                                                        <img src="images/relatedImages.jpg" style="padding: 9px 6px 9px 6px;" width="230" height="64" border="0" /></a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="80%" align="center" style="border-style: dotted; border-width: thin; padding: 40px 10px 85px 70px; margin-bottom: -19px; background-color: lavenderblush;">
                                            <tr>
                                                <td>
                                                    <center>
                                                        <asp:RadioButton ID="rbtnImgeCode" runat="server" GroupName="Search" Text="Image Code" /></center>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtImageCode" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table  width="80%" align="center" style="border-style: dotted; border-width: thin; padding: 40px 10px 85px 70px; margin-top: -128px; background-color: snow;">
                                            <tr>
                                                <td align="center">
                                                    <asp:RadioButton ID="rbtnMainCategory" runat="server" GroupName="Search" Text="Main category" />
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlMainCategory" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlMainCategory_SelectedIndexChanged1">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    Sub Category &nbsp;
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubCategory" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Button ID="btnSearch" Text="Search" runat="server" 
                                            OnClick="btnSearch_Click" CssClass="btnNew" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div id="DivSearchResult" runat="server">
                    <center>
                        <asp:GridView ID="gvRelatedImagesSearchResults" runat="server" AutoGenerateColumns="false"
                            DataKeyNames="IMAGE_ID" Width="80%" align="center">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ImageCode">
                                    <ItemTemplate>
                                        <%#Eval("IMAGE_CODE") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <center>
                                            <img src="../uploads/small_img/<%#Eval("SMALL_PHOTO") %>" style=" margin:2px" alt="Img" height="80px"
                                                width="142px" />
                                        </center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <center>
                                            <asp:CheckBox ID="cbSelectImage" runat="server" />
                                        </center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="AliceBlue" />
                        </asp:GridView>
                    

                        <asp:Button ID="SaveRelatedImages" OnClick="btnSave_Click" runat="server" 
                            Text="Save related Images" CssClass="btnNew" />
                        </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


