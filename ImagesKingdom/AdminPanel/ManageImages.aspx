<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageImages.aspx.cs" Inherits="AdminPanel_ManageImages"
    MasterPageFile="~/AdminPanel/AdminMasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
    <%--    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>--%>
    <script type="text/javascript">
        function popUp(divId, msg) {
            $('#SpanLogo').html(msg);
            $(divId).bPopup();
        }

    </script>
    <script type="text/javascript">
        function ConfirmDelete() {
            if (confirm('Are You sure?') == true)
                return true;
            else
                return false;
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            //script for filling the sub category drop down list .... closed.
            $('cpAdmin_ddlMainCategory').change(function () {

                $.ajax({
                    type: "POST",
                    url: "ManageSubCategory.aspx/GetSubCategory",
                    data: '{MainCategoryId: "' + $("#<%=ddlMainCategory.ClientID%>")[0].value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",

                    success: function (data) {
                        //now iterate through the data..
                        var teams = eval('(' + data.d + ')');
                        var teams1 = teams["dsIdentity"];
                        //var len = teams1[1][0];
                        var len1 = teams1.length;
                        var listItems = "";
                        var i = 0;
                        //alert("ok");
                        $('#cpAdmin_ddlSubCategory').html(listItems);
                        for (i = 0; i < teams1.length; i++) {
                            listItems = "<option value='" + teams1[i][0] + "'>" + teams1[i][1] + "</option>";
                            $('#cpAdmin_ddlSubCategory').append(listItems);
                        }
                        alert(listItems);
                        $('#cpAdmin_ddlSubCategory').append(listItems);


                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                function OnSuccess(data) {
                    // alert(response.d);
                    response($.map(data.d, function (item) {
                        var list = "<option value='0'>" + item + "</option>";
                        $('#cpAdmin_ddlSubCategory').append(list);
                    }))
                }


            });

        });
       
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            if ($('#cpAdmin_rbtnImgeCode').is(':checked') == false && $('#cpAdmin_rbtnMainCategory').is(':checked') == false) {
                $('#divCateSearch').hide();
                $('#divImageSearch').hide();
            }

            if ($('#cpAdmin_rbtnImgeCode').is(':checked') == true) {
                $('#divCateSearch').hide();
            }
            if ($('#cpAdmin_rbtnMainCategory').is(':checked') == true) {
                $('#divImageSearch').hide();
            }



            $('#cpAdmin_rbtnImgeCode').change(function () {
                if ($(this).attr("checked")) {
                    $('#divCateSearch').hide();
                    $('#divImageSearch').slideDown("slow");
                }
                else {
                    $('#divImageSearch').hide();
                }
                //alert("change");
            });

            $('#cpAdmin_rbtnMainCategory').change(function () {
                if ($(this).attr("checked")) {
                    $('#divImageSearch').hide();
                    $('#divCateSearch').slideDown("slow");
                }
                else {
                    $('#divCateSearch').hide();
                }
                // alert("change");
            });

        });


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
                    <img src="images/home.png" alt="Home" />
                    Manage Images</h1>
            </div>
            <div class="content">
                <div class="dashboard-heading">
                    Search Images</div>
                <div class="overview2">
                    <div class="dashboard-content">
                        <%--<asp:UpdatePanel ID="updatePanel2" runat="server">
                            <ContentTemplate>--%>
                        <table style="width: 823px">
                            <tbody>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:RadioButton ID="rbtnImgeCode" GroupName="Search" Text="Image Code" runat="server" />
                                        <br />
                                        <br />
                                        <asp:RadioButton ID="rbtnMainCategory" GroupName="Search" Text="Main Category" runat="server" />
                                    </td>
                                </tr>
                                <tr height="92px">
                                    <td class="style2" align="center">
                                        <div id="divImageSearch">
                                            <span class="style1">Image Code</span>
                                            <asp:TextBox ID="txtImageCode" runat="server"></asp:TextBox>
                                        </div>
                                    </td>
                                    <td class="style4" align="center">
                                        <div id="divCateSearch">
                                            <span class="style1"><span class="style1">Main Category</span>
                                                <asp:DropDownList ID="ddlMainCategory" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlMainCategory_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                                <span class="style1">Sub Category</span><asp:DropDownList ID="ddlSubCategory" runat="server">
                                                </asp:DropDownList>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5" colspan="2" align="center">
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btnNew" OnClick="btnSearch_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        &nbsp;
                                    </td>
                                    <td class="style2">
                                        &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </div>
                </div>
                <div class="latest">
                    <div>
                        <a href="AddNewImageData.aspx">
                            <img src="images/add_icon.gif" alt="add_icon" border="0" /></a>Add New Data
                    </div>
                    <div class="dashboard-heading">
                        Image List
                    </div>
                    <div align="center" class="dashboard-content">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <b>Total Number of Image List : </b>
                                <asp:Label ID="lblCount" runat="server" CssClass="textr" ForeColor="#0066FF" Font-Bold="True"></asp:Label>&nbsp;
                                <asp:Label ID="lblErrorMsg" runat="server" Visible="false"></asp:Label>
                                <asp:GridView ID="gvImageList" runat="server" BorderWidth="1" AutoGenerateColumns="False"
                                    EmptyDataRowStyle-Font-Size="X-Large" PagerStyle-BackColor="gainsboro" HeaderStyle-ForeColor="White"
                                    HeaderStyle-Font-Size="12px" GridLines="Vertical" Width="94%" AllowPaging="True"
                                    PageSize="20" CellSpacing="2">
                                    <AlternatingRowStyle BackColor="Lavender" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S No." HeaderStyle-Height="25px" HeaderStyle-Width="10%"
                                            ItemStyle-BorderStyle="solid">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image Code" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left"
                                            ItemStyle-BorderStyle="solid" ItemStyle-BorderColor="gray">
                                            <ItemTemplate>
                                                <div align="left">
                                                    <%#Eval("IMAGE_CODE") %>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image" HeaderStyle-Width="25%" HeaderStyle-HorizontalAlign="Left"
                                            ItemStyle-BorderStyle="solid" ItemStyle-BorderColor="gray">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <img src='../uploads/small_img/<%#Eval("SMALL_PHOTO") %>' width="128" height="81" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Main & Sub Category Name" HeaderStyle-Width="18%"
                                            HeaderStyle-HorizontalAlign="Left" ItemStyle-BorderStyle="solid" ItemStyle-BorderColor="gray">
                                            <ItemTemplate>
                                                <div align="left">
                                                    <%#Eval("MAIN_CATE_NAME")%>>>
                                                    <%#Eval("SUB_CATEGORY_NAME") %>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View/Edit" HeaderStyle-Width="10%" ItemStyle-BorderStyle="solid"
                                            ItemStyle-BorderColor="gray">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <a href='EditImageDetails.aspx?ImageId=<%#Eval("IMAGE_ID") %>'>
                                                        <img src="images/Edit.jpg" height="28px" width="27px" alt="image" />
                                                    </a>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="10%" ItemStyle-BorderStyle="solid"
                                            ItemStyle-BorderColor="gray">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:ImageButton ID="imgBtnDelete" CommandArgument='<%#Eval("IMAGE_ID") %>' OnClientClick="return ConfirmDelete();"
                                                        OnCommand="DeleteImage" ImageUrl="~/AdminPanel/images/delete_Img.jpg" Height="20px"
                                                        Width="20px" runat="server" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Active / InActive" HeaderStyle-Width="15%" ItemStyle-BorderStyle="solid"
                                            ItemStyle-BorderColor="gray">
                                            <ItemTemplate>
                                                <div align="center">
                                                    <asp:ImageButton ID="imgBtnActiveInactive" CommandArgument='<%#Eval("IMAGE_ID") %>'
                                                        OnCommand="Is_ActiveChange" ImageUrl='<%#Eval("Is_Active") %>' Height="35px"
                                                        Width="35px" runat="server" />
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
