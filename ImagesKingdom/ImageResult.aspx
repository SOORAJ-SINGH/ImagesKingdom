<%@ Page Title="ImageKindom:ImageResult" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ImageResult.aspx.cs" Inherits="ImageResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <script src="AdminPanel/js/jquery-1.11.1.min.js" type="text/javascript"></script>

    <link href="AdminPanel/css/jquery-ui-autoComplete.css" rel="stylesheet" type="text/css" />
   
    <script src="AdminPanel/js/jquery-ui-1.10.4.custom.js" type="text/javascript"></script>
    <script src="AdminPanel/js/GetImageCode.js" type="text/javascript"></script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="width: 100%; float: left; padding-top: 2px;">
            <a name="top" id="top"></a>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tbody>
                    <tr>
                        <td valign="top" width="100%">
                            <!---header Label--->
                            <div id="label2" style="height: 20Px; text-align: left; padding-top: 0px; padding-left: 0px;
                                padding-bottom: 5px; font-size: 16px; color: #1E759D">
                                <span id="SearchImageCategoryData1_Label2" style="font-weight: bold;">6000+ images found
                                    for "Recently Added Images &gt;&gt; View All"</span>
                            </div>
                            <!---header Label--->
                        </td>
                        <td valign="top" width="35%">
                        </td>
                        <td style="padding-top: 0px; vertical-align: top;">
                        </td>
                    </tr>
                </tbody>
            </table>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tbody>
                    <tr>
                        <td style="padding-top: 0px; background: url(images/LT.jpg) no-repeat; width: 10px;
                            height: 34px;">
                        </td>
                        <td style="padding-top: 3px; background: url(images/CT.jpg); width: 100% height:34px;">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td align="left" width="33%">
                                            <table cellpadding="0" cellspacing="0" border="0" width="200">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="51px">
                                                            <span class="blackCopyVerPaging"><strong>Sort By:&nbsp;</strong></span>
                                                        </td>
                                                        <td align="left" width="150px">
                                                            <select name="SearchImageCategoryData1$DropDownList3" id="SearchImageCategoryData1_DropDownList3"
                                                                class="paging_list" onchange="most();">
                                                                <option selected="selected" value="0">Relevance</option>
                                                                <option value="1">Newest</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td align="center" width="34%">
                                            <table cellpadding="0" cellspacing="0" border="0" width="100">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <span class="blackCopyVerPaging"><strong>Display:&nbsp;<strong></strong></strong></span>
                                                        </td>
                                                        <td>
                                                            <select name="SearchImageCategoryData1$DropDownList1" onchange="javascript:setTimeout('__doPostBack(\'SearchImageCategoryData1$DropDownList1\',\'\')', 0)"
                                                                id="SearchImageCategoryData1_DropDownList1" class="paging_listPer">
                                                                <option selected="selected" value="48">48</option>
                                                                <option value="96">96</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td align="right" width="33%">
                                            <table cellpadding="0" cellspacing="0" border="0" width="200">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div id="Paging">
                                                                <div class="page">
                                                                    <span class="blackCopyVerPaging" style="padding-left: 3px;"><strong>Page</strong></span></div>
                                                                <div class="input">
                                                                    <input name="SearchImageCategoryData1$txtsearch1" value="1" maxlength="3" id="SearchImageCategoryData1_txtsearch1"
                                                                        class="paging_input" onchange="return clickButton(event,'SearchImageCategoryData1_GO')"
                                                                        onkeypress="return clickButton(event,'SearchImageCategoryData1_GO')" type="text"></div>
                                                                <div class="number">
                                                                    <span class="blackCopyVerPaging"><strong>of 125</strong></span></div>
                                                                <div class="arrow_rgt">
                                                                    <input name="SearchImageCategoryData1$ImageButton2" id="SearchImageCategoryData1_ImageButton2"
                                                                        src="images/Arrow3.png" style="border-width: 0px;" type="image">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="padding-top: 0px; background: url(images/RT.jpg) no-repeat; width: 10px;
                            height: 34px;">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!---header Navigation--->
        <div style="width: 100%; display: none;">
            <table cellpadding="0" cellspacing="0" background="images/Bar_centre.gif" border="0"
                width="100%">
                <tbody>
                    <tr>
                        <td width="11">
                            <img src="images/Bar_left.gif" height="28" width="11">
                        </td>
                        <td width="150">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td align="right">
                                        </td>
                                        <td align="center">
                                            <span id="SearchImageCategoryData1_lblPagingLabelLeft2" class="black" style="color: Black;">
                                                Page 1 of 125</span>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td width="150">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td class="black">
                                            Go to Page
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <input name="SearchImageCategoryData1$GO" value="GO" onclick="return chkValmy();"
                                                id="SearchImageCategoryData1_GO" class="black" type="submit">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td width="150">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td class="black" style="padding-left: 10px;" align="center">
                                            Per Page
                                        </td>
                                        <td style="text-align: left">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td width="11">
                            <div align="right">
                                <img src="images/Bar_right.gif" height="28" width="11"></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!---header Navigation--->
        <!---No RESULTS--->
        <div id="label3" style="width: 60%; background-color: #FFFFFF; float: left; text-align: left">
            <font color="#000000" face="Arial, Helvetica, sans-serif" size="2"><span id="SearchImageCategoryData1_Label3"
                class="blackBig2"></span></font>
        </div>
        <!---No RESULTS--->
        <br>
        <br>
        <!---SEARCH RESULTS--->
        <div id="imageContainer">
            <div style="float: left; text-align: left; width: 900Px; height: auto;">
                <asp:DataList ID="dtlData" runat="server" RepeatColumns="4" RepeatDirection="vertical"
                    CellSpacing="15" CellPadding="15" ShowFooter="False" ShowHeader="False">
                    <ItemTemplate>
                        <div id="product_box">
                            <div class="item">
                                <div class="item">
                                    <div id="product_img">
                                        <img src="uploads/small_img/<%#Eval("SMALL_PHOTO")%>" height="100px" width="150px"
                                            title="<%# Eval("IMAGE_CODE")%>">
                                    </div>
                                    <br />
                                    <span class="blackCopyVerBlue2012"><a href="#">Similar Images</a> | <a href="#" class="blackCopyVerBlue2012">
                                        Entire Shoot</a></span>
                                    <div class="blackCopyVer1">
                                        Platinum ID:
                                        <%#Eval("IMAGE_CODE")%></div>
                                    <div class="blackCopyVer">
                                        Add to: <a href="Pricing.aspx?ImageId=<%#Eval("IMAGE_ID") %>">Cart</a> &nbsp <a href="LightBoxMessage.aspx?imageid=<%#Eval("IMAGE_ID")%>"
                                            target="light">Lightbox</a></div>
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                        <!--product_container--end-->
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <!---SEARCH RESULTS--->
        <!---Bottom Navigation--->
        <div style="width: 100%; float: left;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tbody>
                    <tr>
                        <td style="padding-top: 0px; background: url(images/LB.jpg) no-repeat; width: 10px;
                            height: 34px;">
                        </td>
                        <td style="padding-top: 0px; background: url(images/CB.jpg); width: 100% height:34px;">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td align="left" width="33%">
                                            <table cellpadding="0" cellspacing="0" border="0" width="200">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="51px">
                                                            <span class="blackCopyVerPaging"><strong>Sort By:&nbsp;</strong></span>
                                                        </td>
                                                        <td align="left" width="150px">
                                                            <select name="SearchImageCategoryData1$DropDownList4" id="SearchImageCategoryData1_DropDownList4"
                                                                class="paging_list" onchange="most_1();">
                                                                <option selected="selected" value="0">Relevance</option>
                                                                <option value="1">Newest</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td align="center" width="34%">
                                            <table cellpadding="0" cellspacing="0" border="0" width="100">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <span class="blackCopyVerPaging"><strong>Display:&nbsp;<strong></strong></strong></span>
                                                        </td>
                                                        <td>
                                                            <select name="SearchImageCategoryData1$DropDownList2" onchange="javascript:setTimeout('__doPostBack(\'SearchImageCategoryData1$DropDownList2\',\'\')', 0)"
                                                                id="SearchImageCategoryData1_DropDownList2" class="paging_listPer">
                                                                <option selected="selected" value="48">48</option>
                                                                <option value="96">96</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td align="right" width="33%">
                                            <table cellpadding="0" cellspacing="0" border="0" width="200">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div id="Paging">
                                                                <div class="page">
                                                                    <span class="blackCopyVerPaging" style="padding-left: 3px;"><strong>Page</strong></span></div>
                                                                <div class="input">
                                                                    <input name="SearchImageCategoryData1$TextBox2" value="1" id="SearchImageCategoryData1_TextBox2"
                                                                        class="paging_input" onchange="return clickButton(event,'SearchImageCategoryData1_Button1')"
                                                                        onkeypress="return clickButton(event,'SearchImageCategoryData1_Button1')" type="text"></div>
                                                                <div class="number">
                                                                    <span class="blackCopyVerPaging"><strong>of 125</strong></span></div>
                                                                <div class="arrow_rgt">
                                                                    <input name="SearchImageCategoryData1$ImageButton4" id="SearchImageCategoryData1_ImageButton4"
                                                                        src="images/Arrow3.png" style="border-width: 0px;" type="image">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="padding-top: 0px; background: url(images/RB.jpg) no-repeat; width: 10px;
                            height: 34px;">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div style="width: 100%; float: left; display: none;">
                <table cellpadding="0" cellspacing="0" background="images/Bar_centre.gif" border="0"
                    width="100%">
                    <tbody>
                        <tr>
                            <td width="11">
                                <img src="images/Bar_left.gif" height="28" width="11">
                            </td>
                            <td width="150">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td align="right">
                                            </td>
                                            <td align="center">
                                                <span id="SearchImageCategoryData1_Label1" class="black" style="color: Black;">Page
                                                    1 of 125</span>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td width="150">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td class="black">
                                                Go to Page
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <input name="SearchImageCategoryData1$Button1" value="GO" onclick="return chkValmynew();"
                                                    id="SearchImageCategoryData1_Button1" class="black" type="submit">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td width="150">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td class="black" style="padding-left: 20px;" align="center">
                                                Display
                                            </td>
                                            <td style="text-align: left">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td width="11">
                                <div align="right">
                                    <img src="images/Bar_right.gif" height="28" width="11"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!---Bottom Navigation--->
        </div>
        <!---Bottom Navigation--->
    </div>
</asp:Content>
