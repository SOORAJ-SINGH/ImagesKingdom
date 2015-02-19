<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageSubCategory.aspx.cs"
    Inherits="AdminPanel_ManageSubCategory" MasterPageFile="~/AdminPanel/AdminMasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <script type="text/javascript">
            function popUp(divId, msg) {
                $('#SpanLogo').html(msg);
                $(divId).bPopup();
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
                    Manage Sub Category</h1>
            </div>
            <div class="content">
                <div class="dashboard-heading">
                    Add New Sub Category</div>
                <div class="overview">
                <div class="dashboard-content">
                
                        <table align="center" cellpadding="4" cellspacing="3">
                            <tbody>
                            <tr>
                                <td colspan="2" align="center" style="font-family: Aharoni; font-size: larger; font-weight: bold">
                                    Add New Sub Category
                                </td>
                            </tr>
                            
                                <tr>
                                    <td align="right">
                                        New Sub Category Name
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="txtNewCategoryName" runat="server"></asp:TextBox>
                                            &nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Select Main Category
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:DropDownList ID="ddlMainCategory" runat="server">
                                            </asp:DropDownList>
                                        </div>
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
                                            <asp:Button ID="btnAddNew" runat="server" Text="Save" OnClick="btnAddNew_Click" CssClass="btnNew" />
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
                        Sub Category List</div>
                    <div align="center" class="dashboard-content">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                &nbsp; Total Number of Sub Category :
                                <asp:Label ID="lblCount" runat="server" CssClass="textr" ForeColor="#0066FF" Font-Bold="True"></asp:Label>&nbsp;
                                <asp:Label ID="lblErrorMsg" runat="server" Visible="false"></asp:Label>
                                <asp:GridView ID="gvSubCategory" DataKeyNames="SUB_CATEGORY_ID" runat="server" BorderWidth="1" AutoGenerateColumns="False"
                                    EmptyDataRowStyle-Font-Size="X-Large" PagerStyle-BackColor="DimGray" HeaderStyle-ForeColor="White"
                                    HeaderStyle-Font-Size="12px" GridLines="Vertical" Width="76%" Height="100%" HeaderStyle-BackColor="DimGray"
                                    AllowPaging="true" OnPageIndexChanging="PageIndexChanging" AllowSorting="true"  PageSize="15" CellSpacing="2" OnRowEditing="gvSubCategory_RowEditing"
                                    OnRowCancelingEdit="gvSubCategory_RowCancelEditing" OnRowUpdating="gvSubCategory_RowUpdating">
                                    <AlternatingRowStyle BackColor="Lavender" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S No." HeaderStyle-Height="25px" HeaderStyle-Width="10%">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Category Name" HeaderStyle-Width="30%" HeaderStyle-HorizontalAlign="Left" SortExpression="Sub Category Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtSubCategory" Text='<%#Eval("SUB_CATEGORY_NAME") %>' runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div align="left">
                                                    <asp:Label ID="lblSubCat" Text='<%#Eval("SUB_CATEGORY_NAME") %>' runat="server"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Main Category Name" HeaderStyle-Width="25%" HeaderStyle-HorizontalAlign="Left" SortExpression="Main Category Name">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlUpdateMainCategory" DataSourceID="SqlDataSource1" DataTextField="MAIN_CATE_NAME"
                                                    DataValueField="MAIN_CAT_ID" SelectedValue='<%#Bind("MAIN_CAT_ID") %>'
                                                    runat="server">
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div align="left">
                                                    <asp:Label ID="lblName" Text='<%#Eval("MAIN_CATE_NAME") %>' runat="server"></asp:Label>
                                                </div>
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
                                                        ToolTip="Edit" Height="26px" Width="25px" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="12%">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:ImageButton ID="imgBtnDelete" runat="server" ImageUrl="images/delete_Img.jpg"
                                                        ToolTip="Active/ inActive" CommandName="DeleteSubCategory" OnCommand="deleteSubCategoy"
                                                        OnClientClick="return ConfirmDelete();" CommandArgument='<%#Eval("SUB_CATEGORY_ID") +","+ Eval("MAIN_CAT_ID") %>'
                                                        Height="20px" Width="20px" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Active / InActive" HeaderStyle-Width="12%">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:ImageButton ID="imgActiveInActive" runat="server" ImageUrl='<%#Eval("Is_Active") %>'
                                                        CommandArgument='<%#Eval("SUB_CATEGORY_ID") %>' OnCommand="Is_ActiveChange" Height="20px"
                                                        Width="20px" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            
                                    <EmptyDataRowStyle Font-Size="X-Large" Wrap="True" />
                                    <HeaderStyle BackColor="DimGray" />
                                    <PagerStyle BackColor="DimGray" VerticalAlign="Middle" HorizontalAlign="Center" Font-Bold="true"
                                         />
                                    <SelectedRowStyle BackColor="HighlightText" />
                                    <EmptyDataTemplate>
                                        Sorry! No Records Found.
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConString %>"
                                    SelectCommand="SELECT DISTINCT * FROM [TBL_MAIN_CATEGORY]"></asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
