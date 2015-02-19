using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BusinessLayer.Admin;

public partial class Checkout : System.Web.UI.Page
{

    #region Variable Declaration
    int ImageId;
    clsGetInfo objGetInfo = new clsGetInfo();
    clsModify objModify = new clsModify();
    clsOrder objOrder = new clsOrder();
    DataSet objDS;

    //double TotalPrice;

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Convert.ToInt32(Session["SessionUserID"]) == 0 || Session["SessionUserID"] == null)
                {
                    Response.Redirect("Login.aspx?status=LoginFirst");
                }
                else
                {
                    lblhiddenDiscount.Visible = false;
                    lblhiddenServiceTax.Visible = false;

                    //Gets the info from previous page
                    if (PreviousPage != null)
                    {
                        Control placeHolder = PreviousPage.Controls[0].FindControl("ContentPlaceHolder1");
                        Label SourceData0 = (Label)placeHolder.FindControl("lblNetPayable");
                        if (SourceData0 != null)
                        {
                            lblTotalAmountCart.Text = SourceData0.Text;
                        }
                        Label SourceData1 = (Label)placeHolder.FindControl("lblDiscount");
                        if (SourceData1 != null)
                        {
                            lblhiddenDiscount.Text = SourceData1.Text;
                        }
                        Label SourceData2 = (Label)placeHolder.FindControl("lblSendServiceTax");
                        if (SourceData2 != null)
                        {
                            lblhiddenServiceTax.Text = SourceData2.Text;
                        }

                    }
                  
  
                    LoadImageCartDetails();
                    GetUserInfo();
                }

            }
        }
        catch (Exception e1)
        {
            throw e1;
        }
    }

    //gets the user info for Billing..
    public void GetUserInfo()
    {
        objGetInfo.UserId = Convert.ToInt32( Session["SessionUserID"]);
        objDS = objGetInfo.GetUserInfo();

        
        //lblTotalAmountCart.Text =  TotalPrice.ToString();
        lblFirstName.Text = objDS.Tables[0].Rows[0]["FIRST_NAME"].ToString();
        ViewState["USERNAME"] = lblFirstName.Text; ////THIS VIEW STATE WILL BE USED FOR GENRATING THE ORDER NO....
        lblLastName.Text = objDS.Tables[0].Rows[0]["LAST_NAME"].ToString();
        lblCompany.Text = objDS.Tables[0].Rows[0]["COMPANY_NAME"].ToString();
        lblEmail.Text = objDS.Tables[0].Rows[0]["EMAIL_ID"].ToString();
        lblCity.Text = objDS.Tables[0].Rows[0]["ADDRESS"].ToString()+","+
                       objDS.Tables[0].Rows[0]["StateName"].ToString() + ", PIN-" + 
                       objDS.Tables[0].Rows[0]["ZIP"].ToString();
        lblMobile.Text = objDS.Tables[0].Rows[0]["MOBILE"].ToString();
        lblPhone.Text = objDS.Tables[0].Rows[0]["PHONE"].ToString();
        lblCountry.Text = objDS.Tables[0].Rows[0]["CountryName"].ToString();
        
    }
    //bind repeater with data source
    public void LoadImageCartDetails()
    {
        //objGetInfo.ImageId = ImageId;
        objGetInfo.MemberId = Convert.ToInt32(Session["SessionUserID"]);

        objDS = objGetInfo.GetImageCartInfo();
        if (objDS.Tables[0].Rows.Count > 0)
        {
            reapterImageInfo.DataSource = objDS;
            reapterImageInfo.DataBind();
            reapterImageInfo.Dispose();

            objDS.Dispose();
        }
        else
        {

            reapterImageInfo.Visible = false;
        }
    }


    //"Confirm Order" button click
    protected void imgbtnConfirmOrder_Click(object sender, ImageClickEventArgs e)
    {
        objOrder.ORDER_DATE = DateTime.Now;
        objOrder.MEMBER_ID = Convert.ToInt32(Session["SessionUserID"]);
        objOrder.TOTAL_PRICE = Convert.ToDouble(lblTotalAmountCart.Text);
        objOrder.DISCOUNT = Convert.ToDouble(lblhiddenDiscount.Text);
        objOrder.SERVICE_TAX = Convert.ToDouble(lblhiddenServiceTax.Text);

        if (rbDemandDraft.Checked)
            objOrder.PAYMENT_MODE = rbDemandDraft.Text;
        else if (rbCheque.Checked)
            objOrder.PAYMENT_MODE = rbCheque.Text;

        objOrder.CLIENT_DESIGNATED = txtClientDesignatedUser.Text;
                
        objOrder.ORDER_NO = GenrateOrderNo();
        

        objDS = objOrder.AddOrder();

        if (objDS.Tables.Count > 0)
        {
            Session["ORDER_NO"] = objDS.Tables[0].Rows[0]["ORDER_NO"].ToString();
            if (objDS.Tables[0].Rows[0][0].ToString() == "INSERTED")
            {
                Response.Redirect("Invoice.aspx");
            }
            else
            {
                Response.Write("<script>alert('error confirming the order!');</script>");
            }
        }
    }

    //OrderNo genration methods
    private string GenrateOrderNo()
    {
        string num = "O";
        string userName = ViewState["USERNAME"].ToString();
        userName.ToLower();
        char[] charUserName = userName.ToCharArray();
        for (int i = 0; i < 3; i++)
        {
            int j = charUserName[i] - 96;
            num += j.ToString();
        }
        DateTime Date;
        Date = DateTime.Now;
        num += Date.Day.ToString();
        num += Date.Month.ToString();
        num += Date.Year.ToString();
        return num;
    }
}