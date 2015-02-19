using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BusinessLayer.Admin;
using System.Web.Services;
using System.Text;

public partial class ShoppingCart : System.Web.UI.Page
{
    #region Variable Declaration
    int ImageId;
    clsImages objImages = new clsImages();
    clsGetInfo objGetInfo = new clsGetInfo();
    clsModify objModify = new clsModify();
    DataSet objDS;
    #endregion

    #region "Page Load Event"
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
                    LoadImageCartDetails();
                    lblSendServiceTax.Visible = false;
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Deleted Successfully.');</script>", false);
            
                }

            }
        }
        catch (Exception e1)
        {
            throw e1;
        }


    }
    #endregion


    #region Button event
    protected void btnAddMoreImages_Click(object sender, EventArgs e)
    {
        Response.Redirect("ImageResult.aspx?id=1&SubCat=View All&Mcat=Recently Added Images");
    }


    protected void btnCheckout_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("Checkout.aspx");
    }

    #endregion


    //on command evnt for delete image frm cart
    public void deleteImageFromCart(object sender, CommandEventArgs e)
    {
        string ImageId = "";
        string ImageTypeId = "";
        if (e.CommandName == "ImageCart")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            ImageId = commandArgs[0];
            ImageTypeId = commandArgs[1];
        }

        objModify.ImageId = Convert.ToInt32(ImageId);
        objModify.ImageTypeId = Convert.ToInt32(ImageTypeId);
        objModify.MemberId = Convert.ToInt32(Session["SessionUserID"]);

        objModify.deleteImageFromCart();
        //Response.Write("<script>alert('Deleted!');</script>");
        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>CartCountChange();</script>", false);
        objImages.MemberId = Convert.ToInt32(Session["SessionUserID"]);
        string countCart = objImages.CountCartImages();
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Deleted Successfully.','" + countCart + "');</script>", false);
        LoadImageCartDetails();
        


    }

    //bind repeater with data source
    public void LoadImageCartDetails()
    {
        lblMsgCart.Visible = false;
        imgCart.Visible = false;
        //objGetInfo.ImageId = ImageId;
        objGetInfo.MemberId = Convert.ToInt32(Session["SessionUserID"]);

        objDS = objGetInfo.GetImageCartInfo();
        if (objDS.Tables[0].Rows.Count > 0)
        {
            double serviceTax = Convert.ToDouble(System.Configuration.ConfigurationManager.AppSettings["ServiceTaxPercentage"]);
            double amountPayable, netPayable;

            reapterImageInfo.DataSource = objDS;
            reapterImageInfo.DataBind();
            reapterImageInfo.Dispose();

            lblItemsInCart.Text = objDS.Tables[0].Rows.Count.ToString();
            lblPrice.Text = objDS.Tables[1].Rows[0]["TOTAL_PRICE"].ToString();
            lblDiscount.Text = objDS.Tables[1].Rows[0]["TOTAL_DISCOUNT"].ToString();
            //lblServiceTax.Text  =  System.Configuration.ConfigurationManager.AppSettings["ServiceTaxPercentage"];
            amountPayable = Convert.ToInt32(lblPrice.Text) - Convert.ToInt32(lblDiscount.Text);
            lblAtPayable.Text = amountPayable.ToString();
            lblServiceTax.Text = "(" + serviceTax.ToString() + "%) :  " + Convert.ToString(amountPayable * serviceTax / 100);
            lblSendServiceTax.Text = Convert.ToString(amountPayable * serviceTax / 100);
            netPayable = amountPayable + (amountPayable * serviceTax / 100);
            lblNetPayable.Text = netPayable.ToString();

            objDS.Dispose();
        }
        else
        {

            lblMsgCart.Visible = true;
            imgCart.Visible = true;
            lblMsgCart.Text = "Cart is Empty!";
            reapterImageInfo.Visible = false;

            lblItemsInCart.Text = "0";
            lblPrice.Text = "0.00";
            lblDiscount.Text = "0.00";
            lblAtPayable.Text = "0.00";
            lblServiceTax.Text = "0.00";
            lblNetPayable.Text = "0.00";

        }
    }


}