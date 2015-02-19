<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewImageData.aspx.cs"
    Inherits="AdminPanel_AddNewImageData" MasterPageFile="~/AdminPanel/AdminMasterPage.master" %>

<asp:Content ContentPlaceHolderID="head" ID="cpHead" runat="server">
    <script src="js/jquery.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ContentPlaceHolderID="cpAdmin" ID="cp" runat="server">
    <div id="content">
        <div class="breadcrumb">
            <a href="#">Home</a>
        </div>
        <div class="box">
            <div class="heading">
                <h1>
                    <img src="images/home.png" alt=""/>
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
                                                <td width="31%" style="background-color: #128BD7;">
                                                    <a href="AddNewImageData.aspx">
                                                        <img src="images/image_info.jpg" style="padding: 9px 6px 9px 6px;" width="226" height="64"
                                                            border="0" /></a>
                                                </td>
                                                <td width="19%">
                                                    <a href="AddImageSize.aspx" id="AddImageSize">
                                                        <img src="images/image_size.jpg" width="135" height="64" border="0" alt=""/></a>
                                                </td>
                                                <td width="50%">
                                                    <a href="AddRelatedImages.aspx" id="AddRelatedImages">
                                                        <img src="images/relatedImages.jpg" width="230" height="64" border="0" alt="" /></a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="padding-left: 264px; padding-top: 36px;">
                                        <table cellpadding="5px" cellspacing="6px" style="">
                                            <tr>
                                                <td width="115">
                                                    Title
                                                </td>
                                                <td width="714">
                                                    <div align="left">
                                                        <asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox>
                                                        &nbsp;</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Image Code
                                                </td>
                                                <td>
                                                    <div align="left">
                                                        <asp:TextBox ID="txtImageCode" runat="server" Width="200px"></asp:TextBox>
                                                        &nbsp;</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Main Category
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlMainCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMainCategory_SelectedIndexChanged" ></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Sub Category
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubCategory" runat="server">
                                                    </asp:DropDownList>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Small Photo
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="smallFileName" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Large Photo
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="largeImage" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Keywords
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtKeyword" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Status
                                                </td>
                                                <td>
                                                    <div align="left">
                                                        <asp:DropDownList ID="ddlStatus" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnAddNew" runat="server" Text="Add New" 
                                                        OnClick="btnAddNew_Click" BackColor="#128BD7" Font-Bold="True" 
                                                        Font-Size="Medium" ForeColor="White" style=" padding:6px 9px;"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
