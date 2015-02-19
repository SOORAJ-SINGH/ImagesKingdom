<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageMainCategory.aspx.cs"
    Inherits="AdminPanel_ManageMainCategory" MasterPageFile="~/AdminPanel/AdminMasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <%--<script src="js/jquery.bpopup.min.js" type="text/javascript"></script>--%>
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
                    <img src="images/home.png" alt="" />
                    Manage Main Category</h1>
            </div>
            <div class="content">
                <div class="dashboard-heading">
                    Add New Main Category</div>
                <div class="overview">
                    <div class="dashboard-content">
                        <table align="center" width="40%" cellpadding="7" cellspacing="2">
                            <tr>
                                <td colspan="2" align="center" style="font-family: Aharoni; font-size: larger; font-weight: bold">
                                    Add New Main Category
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    New Main Category Name
                                </td>
                                <td>
                                    <div align="left">
                                        <asp:TextBox ID="txtNewCategoryName" runat="server"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Status
                                </td>
                                <td>
                                    <div align="left">
                                        <asp:DropDownList ID="DropDownListStatus" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="btnSaveMainCategory" runat="server" CssClass="btnNew" Text="Save"
                                        OnClick="btnSaveMainCategory_Click" />
                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="latest">
                    <div class="dashboard-heading">
                        Main Category List&nbsp;&nbsp;
                    </div>
                    <div align="center" class="dashboard-content">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                &nbsp; Total Number of Category :
                                <asp:Label ID="lblCount" runat="server" CssClass="textr" ForeColor="#0066FF" Font-Bold="True"></asp:Label>&nbsp;
                                <asp:Label ID="lblErrorMsg" runat="server" Visible="false"></asp:Label>
                                <asp:GridView ID="gvMainCategory" DataKeyNames="MAIN_CAT_ID" runat="server" BorderWidth="1"
                                    AutoGenerateColumns="False" EmptyDataRowStyle-Font-Size="X-Large" PagerStyle-BackColor="Aquamarine"
                                    HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="12px" GridLines="Vertical"
                                    Width="72%" HeaderStyle-BackColor="Bisque" AllowPaging="True" PageSize="20" CellSpacing="2"
                                    OnRowEditing="gvMainCategory_RowEditing" OnRowCancelingEdit="gvMainCategory_RowCancelEditing"
                                    OnRowUpdating="gvMainCategory_RowUpdating">
                                    <AlternatingRowStyle BackColor="Lavender" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S No." HeaderStyle-Height="25px" HeaderStyle-Width="10%">
                                            <EditItemTemplate>
                                                <div align="center">
                                                    <asp:Label ID="lblEditSNO" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Category Name" HeaderStyle-Width="50%" HeaderStyle-HorizontalAlign="Left">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtMainCateName" Text='<%#Eval("MAIN_CATE_NAME") %>' runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div align="left">
                                                    <asp:Label ID="lblName" Text='<%#Eval("MAIN_CATE_NAME") %>' runat="server"></asp:Label>
                                                </div>
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
                                                        OnCommand="deleteMainCategoy" CommandArgument='<%#Eval("MAIN_CAT_ID") %>' OnClientClick="return ConfirmOnDelete();"
                                                        Height="20px" Width="20px" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Active / InActive" HeaderStyle-Width="10%">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:ImageButton ID="imgBtnDelete" runat="server" CommandArgument='<%#Eval("MAIN_CAT_ID") %>'
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
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
