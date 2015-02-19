using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLayer.Admin;
using System.Data;

public partial class Pricing : System.Web.UI.Page
{
    #region Variable Declaration
    DataSet objDS;
    clsGetInfo objGetInfo = new clsGetInfo();
    clsImages objImages = new clsImages();
    //clsAdd objAdd = new clsAdd();
    int ImageId;
    
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

                    hidden_text.Visible = false;
                    ImageId = Convert.ToInt32(Request.QueryString["ImageId"]);
                    hidden_text.Value = ImageId.ToString();
                    if (ImageId != null)
                        FillGvImagePriceSize();
                }
            }
        }
        catch(Exception e1)
        {
            throw e1;
        }
    }

    protected void imgBtnAddCart_Click(object sender, ImageClickEventArgs e)
    {
        objImages.IMAGE_ID = Convert.ToInt32(hidden_text.Value);
        objImages.IMAGE_TYPE_ID = GetImageTypeIdFromRadioBtn();
        objImages.MemberId = Convert.ToInt32(Session["SessionUserID"]);
        objDS = objImages.AddToImageCart();

        if (objDS.Tables[0].Rows[0][0].ToString() == "INSERTED")
        {
            string urlBuy = "ShoppingCart.aspx";// +hidden_text.Value.ToString();
            Response.Redirect(urlBuy);
        }
        else if (objDS.Tables[0].Rows[0][0].ToString() == "ALREADY_EXISTS")
        {
            Response.Write("<script>alert('Image Already Exist in Cart!!');</script>");
        }
    }

    protected void rbSelector_CheckedChanged(object sender, System.EventArgs e)
    {
        //Clear the existing selected row 
        foreach (GridViewRow oldrow in gvImageSizePrice.Rows)
        {
            ((RadioButton)oldrow.FindControl("rbSelector")).Checked = false;
        }

        //Set the new selected row
        RadioButton rb = (RadioButton)sender;
        GridViewRow row = (GridViewRow)rb.NamingContainer;
        ((RadioButton)row.FindControl("rbSelector")).Checked = true;
    }


    public void FillGvImagePriceSize()
    {
        objGetInfo.ImageId = ImageId;
        objDS = objGetInfo.GetImageSizePrice();
        gvImageSizePrice.DataSource = objDS;
        gvImageSizePrice.DataBind();

        //FILL THE IMAGE
        imgShow.ImageUrl = "uploads/small_img/" + objDS.Tables[1].Rows[0]["SMALL_PHOTO"].ToString();
    }



    private int GetImageTypeIdFromRadioBtn()
    {
        int id = 0;
        string str = string.Empty;

        foreach (GridViewRow oldrow in gvImageSizePrice.Rows)
        {
            if (((RadioButton)oldrow.FindControl("rbSelector")).Checked == true)
            {
                id = Convert.ToInt32( gvImageSizePrice.DataKeys[oldrow.RowIndex].Value );
                break;
            }
        }

        return id;
    }
}