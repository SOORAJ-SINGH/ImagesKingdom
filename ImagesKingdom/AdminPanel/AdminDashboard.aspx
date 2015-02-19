<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="AdminPanel_AdminDashboard" MasterPageFile="~/AdminPanel/AdminMasterPage.master" %>
<asp:Content ContentPlaceHolderID="cpAdmin" ID="cp" runat="server">
 
    <div id="content">
<div class="breadcrumb">
        <a href="#">Home</a>
      </div>
  <div class="box">
    <div class="heading">
      <h1><img src="images/home.png" alt="">Dashboard</h1>
    </div>
    <div class="content">
      <div class="latest">
        <div class="dashboard-heading">Latest Orders</div>
        <div class="dashboard-content">
        <table class="list">
            <thead>
              <tr>
                <td class="right">Order ID</td>
                <td class="left">Customer</td>
                <td class="left">Status</td>
                <td class="left">Date Added</td>
                <td class="right">Total</td>
                <td class="right">Action</td>
              </tr>
            </thead>
            <tbody>
                                          <tr>
                <td class="right">9258</td>
                <td class="left">jonh miller</td>
                <td class="left">Pending</td>
                <td class="left">27/03/2014</td>
                <td class="right">Rs 105.00</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9257</td>
                <td class="left">nklhlhlh fsrfhk</td>
                <td class="left">Pending</td>
                <td class="left">27/03/2014</td>
                <td class="right">Rs 127.38</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9255</td>
                <td class="left">a b</td>
                <td class="left">Pending</td>
                <td class="left">26/03/2014</td>
                <td class="right">Rs 127.38</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9254</td>
                <td class="left">Kevin Burks</td>
                <td class="left">Pending</td>
                <td class="left">26/03/2014</td>
                <td class="right">Rs 105.00</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9253</td>
                <td class="left">John Doe</td>
                <td class="left">Pending</td>
                <td class="left">26/03/2014</td>
                <td class="right">Rs 105.00</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9252</td>
                <td class="left">Brett Millett</td>
                <td class="left">Pending</td>
                <td class="left">26/03/2014</td>
                <td class="right">Rs 127.38</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9251</td>
                <td class="left">test test</td>
                <td class="left">Pending</td>
                <td class="left">26/03/2014</td>
                <td class="right">Rs 205.00</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9250</td>
                <td class="left">sadasd asdasda</td>
                <td class="left">Pending</td>
                <td class="left">26/03/2014</td>
                <td class="right">Rs 77.13</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9246</td>
                <td class="left">hgjkhj hfghf</td>
                <td class="left">Pending</td>
                <td class="left">26/03/2014</td>
                <td class="right">Rs 76.03</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                            <tr>
                <td class="right">9245</td>
                <td class="left">bbhaosac bbhaosac</td>
                <td class="left">Pending</td>
                <td class="left">26/03/2014</td>
                <td class="right">Rs 127.38</td>
                <td class="right">                  [ <a href="#">View</a> ]
                  </td>
              </tr>
                                        </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

</asp:Content>