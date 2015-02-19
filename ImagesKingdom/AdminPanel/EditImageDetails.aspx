<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMasterPage.master"
    AutoEventWireup="true" EnableEventValidation="false" CodeFile="EditImageDetails.aspx.cs"
    Inherits="AdminPanel_EditImageDetails" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" language="javascript">
        function ConfirmOnDelete() {
            if (confirm("Are you sure?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="cpAdmin" ID="cp" runat="server">
    <div id="hidden">
        <asp:Label ID="lblhiddenImageId" runat="server" Visible="false"></asp:Label>
    </div>
    <div id="content">
        <div class="breadcrumb">
            <a href="#">Home</a>
        </div>
        <div class="box">
            <div class="heading">
                <h1>
                    <img src="images/home.png" alt="" />
                    New Image Information</h1>
            </div>
            <div class="content">
                <div class="dashboard-heading">
                    Edit Image Details
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
                                    <td align="center" valign="middle">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Image ID="imgShow" Height="125Px" Width="222px" runat="server" />
                                        Image Code:
                                        <asp:Label ID="lblImageCode" runat="server"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 96px; padding-top: 36px;">
                                    <asp:UpdatePanel ID ="UpdatePanelCategory" runat="server">
                                    <ContentTemplate>
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
                                                    Main Category
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlMainCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMainCategory_SelectedIndexChanged">
                                                    </asp:DropDownList>
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
                                                    <div>
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
                                                    <asp:Button ID="btnUpdateImageDetails" runat="server" Text="Update" BackColor="#128BD7" Font-Bold="True"
                                                        Font-Size="Medium" ForeColor="White" Style="padding: 6px 9px;" 
                                                        onclick="btnUpdateImageDetails_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    
                                    </ContentTemplate>
                                    </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="gvImageType" runat="server" DataKeyNames="IMAGE_PRICE_ID" BorderWidth="1"
                                                    AutoGenerateColumns="False" EmptyDataRowStyle-Font-Size="X-Large" PagerStyle-BackColor="gainsboro"
                                                    HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="12px" GridLines="Vertical"
                                                    Width="80%" Height="100%" HeaderStyle-BackColor="gainsboro" AllowPaging="True"
                                                    PageSize="20" CellSpacing="2" OnRowEditing="gvImageType_RowEditing" OnRowCancelingEdit="gvImageType_RowCancelEditing"
                                                    OnRowUpdating="gvImageType_RowUpdating">
                                                    <AlternatingRowStyle BackColor="Lavender" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S No." HeaderStyle-Height="25px" HeaderStyle-Width="13%">
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Image Type" HeaderStyle-Width="25%" HeaderStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <div align="left">
                                                                    <asp:Label ID="lblName" Text='<%#Eval("IMAGE_TYPE") %>' runat="server"></asp:Label>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Dimension Pixels" HeaderStyle-Width="25%">
                                                            <ItemTemplate>
                                                                <%#Eval("DIMENSIONS_PIXELS")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Price" HeaderStyle-Width="12%">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtPrice" Text='<%#Eval("PRICE") %>' runat="server"></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <%#Eval("PRICE")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Discount">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtDiscount" Text='<%#Eval("DISCOUNT") %>' runat="server"></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <%#Eval("DISCOUNT")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Net Price" HeaderStyle-Width="12%">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtNetPrice" Text='<%#Eval("NET_PRICE") %>' runat="server"></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <%#Eval("NET_PRICE")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="12%">
                                                            <EditItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="images/update.jpg"
                                                                        ToolTip="Update" Height="20px" Width="20px" />
                                                                    <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="images/Cancel.jpg"
                                                                        ToolTip="Cancel" Height="20px" Width="20px" />
                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="images/Edit.jpg"
                                                                        ToolTip="Edit" Height="20px" Width="20px" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="images/delete_Img.jpg" OnCommand="deleteImageType"
                                                                        CommandArgument='<%#Eval("IMAGE_PRICE_ID") %>' OnClientClick="return ConfirmOnDelete();"
                                                                        Height="20px" Width="20px" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataRowStyle Font-Size="X-Large" Wrap="True" />
                                                    <HeaderStyle BackColor="DimGray" />
                                                    <PagerStyle BackColor="DimGray" VerticalAlign="Middle" HorizontalAlign="Center" Font-Bold="true"
                                                        ForeColor="White" />
                                                    <SelectedRowStyle BackColor="HighlightText" />
                                                    <EmptyDataTemplate>
                                                        Sorry! No Records Found.
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
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
