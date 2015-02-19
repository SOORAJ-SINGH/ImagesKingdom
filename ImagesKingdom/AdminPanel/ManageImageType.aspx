<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageImageType.aspx.cs"
    Inherits="AdminPanel_ManageImageType" MasterPageFile="~/AdminPanel/AdminMasterPage.master" %>

<asp:Content ContentPlaceHolderID="head" ID="cpHead" runat="server">
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function popUp(divId, msg) {
            $('#SpanLogo').html(msg);
            $(divId).bPopup();
        }

    </script>
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
    <div id="divPopUp" class="ToPopup" style="left: 433px; position: absolute; top: 122px;
        z-index: 9999; opacity: 1;">
        <span class="button b-close"><span>X</span> </span>
        <br>
        <span id="SpanLogo" class="logo"></span>
    </div>

    <div id="content">
        <div class="breadcrumb">
            <a href="#">Home</a>
        </div>
        <div class="box">
            <div class="heading">
                <h1>
                    <img src="images/home.png" alt="">
                    Manage Image Type</h1>
            </div>
            <div class="content">
                <div class="dashboard-heading">
                    Add New Image Type</div>
                <div class="overview">
                    <div class="dashboard-content">
                        <table cellpadding="4" cellspacing="3">
                            <tbody>
                                <tr>
                                    <td colspan="2" align="center" style="font-family: Aharoni; font-size: larger; font-weight: bold">
                                        Add New Image Type
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        New Image Type
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="txtImageType" runat="server"></asp:TextBox>
                                            &nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Dimensions (Pixels)
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="txtDimensions_Pixels" runat="server"></asp:TextBox></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Dimensions (Inches)
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="txtDimensions_Inches" runat="server"></asp:TextBox></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Resolution
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="txtResolution" runat="server"></asp:TextBox></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
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
                                        <div align="left">
                                            <asp:Button ID="btnAddnew" runat="server" Text="Save" CssClass="btnNew" OnClick="btnAddnew_Click" />
                                            &nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Label ID="lblWarning" runat="server" CssClass="lableRedTextErrorMsg"></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="latest">
                    <div class="dashboard-heading">
                        Image Type List&nbsp;&nbsp;
                    </div>
                    <div align="center" class="dashboard-content">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                Total Number of Image Type :
                                <asp:Label ID="lblCount" runat="server" CssClass="textr" ForeColor="#0066FF" Font-Bold="True"></asp:Label>&nbsp;
                                <asp:Label ID="lblErrorMsg" runat="server" Visible="false"></asp:Label>
                                <asp:GridView ID="gvImageType" DataKeyNames="IMAGE_TYPE_ID" runat="server" BorderWidth="1"
                                    AutoGenerateColumns="False" EmptyDataRowStyle-Font-Size="X-Large" PagerStyle-BackColor="gainsboro"
                                    HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="12px" GridLines="Vertical"
                                    Width="80%" Height="100%" HeaderStyle-BackColor="gainsboro" AllowPaging="True"
                                    PageSize="20" CellSpacing="2" OnRowEditing="gvImageType_RowEditing" OnRowCancelingEdit="gvImageType_RowCancelingEdit"
                                    OnRowUpdating="gvImageType_RowUpdating">
                                    <AlternatingRowStyle BackColor="Lavender" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S No." HeaderStyle-Height="25px" HeaderStyle-Width="10%">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image Type" HeaderStyle-Width="30%" HeaderStyle-HorizontalAlign="Left">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtImageType" Text='<%#Eval("IMAGE_TYPE") %>' runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div align="left">
                                                    <asp:Label ID="lblName" Text='<%#Eval("IMAGE_TYPE") %>' runat="server"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dimension Inches">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDimensionInches" Text='<%#Eval("DIMENSIONS_INCHES") %>' runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <%#Eval("DIMENSIONS_INCHES")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dimension Pixels">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDimensionPixels" Text='<%#Eval("DIMENSIONS_PIXELS") %>' runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <%#Eval("DIMENSIONS_PIXELS")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="10%">
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
                                                    <asp:ImageButton ID="imgInActive" runat="server" ImageUrl="images/delete_Img.jpg"
                                                        OnCommand="deleteImageType" CommandArgument='<%#Eval("IMAGE_TYPE_ID") %>' OnClientClick="return ConfirmOnDelete();"
                                                        Height="20px" Width="20px" />
                                                </div>
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
                                    <EmptyDataRowStyle Font-Size="X-Large" Wrap="True" />
                                    <HeaderStyle BackColor="DimGray" />
                                    <PagerStyle BackColor="DimGray" VerticalAlign="Middle" HorizontalAlign="Center" Font-Bold="true"
                                        ForeColor="White" />
                                    <SelectedRowStyle BackColor="HighlightText" />
                                    <EmptyDataTemplate>
                                        Sorry! No Records Found.
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <div class="clr">
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
