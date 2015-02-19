<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="AdminPanel_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<title>Administration Login</title>

</head>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<body>
 <form id="form1" runat="server">
<div id="container">
<div id="header">
  <div class="div1">
    <div class="div2"><img src="images/logo.png" title="Administration"></div>
      </div>
  </div>
<div id="content">
  <div class="box" style="width: 400px; min-height: 300px; margin-top: 80px; margin-left: auto; margin-right: auto;">
    <div class="heading">
      <h1><img src="images/lockscreen.png" alt=""> Please enter your login details.</h1>
    </div>
    <div class="content" style="min-height: 150px; overflow: hidden;">
   
       <table style="width: 100%;">
          <tbody><tr>
            <td style="text-align: center;" rowspan="5"><img src="images/administrator.png" alt="Please enter your login details."></td>
          </tr>
          <tr>
            <td>Username:<br>
                <asp:TextBox ID="txtLoginID" runat="server"></asp:TextBox>
&nbsp;<br>
              <br>
              Password:<br>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
&nbsp;<br>
              <a href="#">Forgotten Password</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td style="text-align: right;">
                <asp:ImageButton ID="imgbtnLogin" Text="Login" runat="server" 
                    onclick="btnLogin_Click" ImageUrl="~/AdminPanel/images/btn-login.png" />
            </td>
          </tr>
          <tr>
            <td style="text-align: right;">
                <asp:Label ID="lblWarning" runat="server" CssClass="lableRedTextErrorMsg" ></asp:Label>
            </td>
          </tr>
        </tbody></table>
          
    </div>
  </div>
</div>
</div>
<div id="footer"></div>
</form>
</body>

</html>
