<%@ Page Title="Invoice" Language="C#" AutoEventWireup="true" CodeFile="Invoice.aspx.cs"
    Inherits="Invoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice</title>
    <link href="css/CssSprite.css" rel="stylesheet" type="text/css" />
    <script src="AdminPanel/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.PrintArea.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#print_button").click(function () {
                //alert("ok");
                $(".PrintArea").printArea();
            });
        });
        
    </script>
</head>
<body>
    <form id="form1" runat="server">

    <div class="PrintArea">
        <table cellspacing="0" align="center" border="0" width="600">
            <tbody>
                <tr>
                    <td>
                        <table cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <td style="width: 492px">
                                        <img src="images/Logo1_imagesKingDom.JPG" border="0" height="49" width="175">
                                    </td>
                                    <td style="width: 7px" align="left" nowrap="nowrap">
                                        <a id="print_button" href="#"><div id="printS"></div>  </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <table style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px;
                            font-weight: bold" cellpadding="6" cellspacing="0" align="center" border="1"
                            width="90%">
                            <tbody>
                                <tr bgcolor="#E5E5E5">
                                    <td style="width: 190px" nowrap="nowrap">
                                        Order Confirmation No.:
                                        <asp:Label ID="lblInvoiceNo" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 114px" nowrap="nowrap">
                                        Date:
                                        <asp:Label ID="lblInvoiceDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr bgcolor="#E5E5E5">
                                    <td style="width: 190px" bgcolor="#E5E5E5" nowrap="nowrap">
                                        Mode of Payment:
                                        <asp:Label ID="lblPaymentMode" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 114px" nowrap="nowrap">
                                        <span id="lblclient">Client: media</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="font-weight: normal; width: 190px;" valign="top">
                                        <span id="lblbilledto">
                                            <br>
                                            <b>Billed To:</b><br>
                                            the designo<br>
                                            h1212 new delhi<br>
                                            Chattisgarh 110062<br>
                                            India<br>
                                            <br>
                                        </span>
                                    </td>
                                    <td colspan="1" style="font-weight: normal" valign="top">
                                        <span id="Label2" style="display: inline-block; width: 155px;">
                                            <br>
                                            <b>Order By:</b><br>
                                            <asp:Label ID="lblOrderBy" runat="server"></asp:Label></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="152" colspan="3" align="center">
                                        <div>
                                        </div>
                                        
                                        <asp:GridView ID="gvImageList" runat="server" BorderWidth="1" AutoGenerateColumns="False"
                                            EmptyDataRowStyle-Font-Size="X-Large" PagerStyle-BackColor="gainsboro" HeaderStyle-ForeColor="White"
                                            HeaderStyle-Font-Size="12px" GridLines="Vertical" Width="100%" AllowPaging="True"
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
                                                <asp:TemplateField HeaderText="Image" HeaderStyle-Width="25%" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-BorderStyle="solid" ItemStyle-BorderColor="gray">
                                                    <ItemTemplate>
                                                        <div align="center">
                                                            <img src='uploads/small_img/<%#Eval("SMALL_PHOTO") %>' width="128" height="81"  alt="img"/>
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
                                                <asp:TemplateField HeaderText="Image Type" HeaderStyle-Width="16%" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-BorderStyle="solid" ItemStyle-BorderColor="gray">
                                                    <ItemTemplate>
                                                        <div align="left">
                                                            <%#Eval("IMAGE_TYPE") %>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dimensions(Pixels)" HeaderStyle-Width="11%" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-BorderStyle="solid" ItemStyle-BorderColor="gray">
                                                    <ItemTemplate>
                                                        <div align="left">
                                                            <%#Eval("DIMENSIONS_PIXELS")%>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Amount(Rs.)" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-BorderStyle="solid" ItemStyle-BorderColor="gray">
                                                    <ItemTemplate>
                                                        <div align="RIGHT">
                                                            <%#Eval("PRICE")%> INR
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
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        <table style="font-size: 9px; font-family: Verdana, Arial, Helvetica, sans-serif"
                            cellpadding="6" cellspacing="0" align="center" border="1" width="90%">
                            <tbody>
                                <tr style="font-weight: bold">
                                    <td align="right" width="81%">
                                        Total-Discount (<asp:Label ID="lblTotal" runat="server"></asp:Label> - <asp:Label ID="lblDiscount" runat="server"></asp:Label>)
                                    </td>
                                    <td align="right" nowrap="nowrap">
                                        <asp:Label id="lbltamount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="font-weight: bold">
                                    <td align="right" width="81%">
                                        <span id="Label1">Service Tax @14.5%</span>
                                    </td>
                                    <td align="right" nowrap="nowrap">
                                        <asp:Label ID="lblServiceTax" runat="server" ></asp:Label>
                                    </td>
                                </tr>
                                <tr style="font-weight: bold">
                                    <td style="height: 25px" align="right" width="81%">
                                        Net Payable Amount
                                    </td>
                                    <td style="height: 25px" align="right" nowrap="nowrap">
                                        <span id="lblfamount"><asp:Label ID="lblNetPayableAmt" runat="server"></asp:Label></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        <table style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px"
                            cellpadding="6" cellspacing="0" align="center" border="1" width="90%">
                            <tbody>
                                <tr>
                                    <td style="height: 86px">
                                        <p>
                                            <font color="#666666">PAN No.: <strong>AADCM6333L</strong>
                                                <br>
                                                Service Tax No.: <strong>AADCM6333LST001</strong>
                                                <br>
                                                Service Tax Category: <strong>Development and Supply of Content<br>
                                                </strong>
                                                <br>
                                                <span style="font-size: 7pt; color: #666666; font-family: Verdana; mso-fareast-font-family: 'Times New Roman';
                                                    mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: EN-US;
                                                    mso-bidi-language: AR-SA">ImagesKingdom is fully owned subsidiary of ABC Pvt. Ltd.
                                                </span>Usage of images subject to ABC<font color="#666666"></font>&nbsp; Rights
                                                Agreement mentioned on <a href="Default.aspx">www.imagekingdom.com</a> </font>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b><font color="#666666">ABC Pvt. Ltd.<br>
                                            505, South Mall,
                                            <br>
                                            Plot No.2, Road No.44,<br>
                                            Pitam Pura, New Delhi-110034<br>
                                            <a href="Default.aspx">www.imagekingdom.com</a></font></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <div align="center">
                                            <strong>WE THANK YOU FOR YOUR BUSINESS. WE VALUE YOUR PATRONAGE</strong></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
