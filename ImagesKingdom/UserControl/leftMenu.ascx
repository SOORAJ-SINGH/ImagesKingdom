<%@ Control Language="C#" AutoEventWireup="true" CodeFile="leftMenu.ascx.cs" Inherits="UserControl_leftMenu" %>
<asp:UpdatePanel ID="UpnlMenu" runat="server">
<ContentTemplate>
<div id="accodin">
<ul id="accordion">
 <asp:Repeater ID="CategoryNameRP" runat="server" >
    <ItemTemplate>
        <asp:Label ID="lblcatis" Text='<%#Eval("MAIN_CAT_ID") %>' runat="server"
                Visible="false"></asp:Label>
	            <li class="plusmenuicon" ><%#Eval("MAIN_CATE_NAME")%></li>
<ul style="display:none;">
        <asp:Repeater ID="rptSubCat" runat="server">
    <ItemTemplate>
	<li> 
     <a href="ImageResult.aspx?id=<%#Eval("SUB_CATEGORY_ID")%>&SubCat=<%#Eval("SUB_CATEGORY_NAME")%>&Mcat=<%#Eval("MAIN_CATE_NAME")%>">-&nbsp; <%#Eval("SUB_CATEGORY_NAME")%></a> </li>       
	</ItemTemplate>
    </asp:Repeater>
</ul>
    
	</ItemTemplate>
</asp:Repeater>
</ul>
</div>

</ContentTemplate>

</asp:UpdatePanel>
