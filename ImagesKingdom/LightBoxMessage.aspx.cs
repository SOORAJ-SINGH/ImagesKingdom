using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BusinessLayer.Admin;

public partial class LightBoxMessage : System.Web.UI.Page
{
    #region variable declaration
    DataSet objDS;
    clsGetInfo objGetInfo = new clsGetInfo();
    clsImages objImages = new clsImages();
    //clsAdd objAdd = new clsAdd();
    clsModify objModify = new clsModify();
    string ImageId = "";
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
                    ImageId = Request.QueryString["imageid"];
                    if (ImageId != null)
                        AddImgToLightbox();
                }
            }
        }
        catch (Exception e1)
        {
            throw;
        }
        //lblMsgLight.Text = "";
    }

    private void AddImgToLightbox()
    {
        objImages.IMAGE_ID = Convert.ToInt32(ImageId);
        objImages.MemberId = Convert.ToInt32(Session["SessionUserID"]);
        objDS = objImages.AddImageToLightBox();
        if (objDS.Tables.Count > 0)
        {
            string result = objDS.Tables[0].Rows[0][0].ToString();
            if (result == "ALREADY_EXISTS")
            {
                lblMsgLight.Text = "Already in LightBox!";
                Response.Write("<script>alert('Already in LightBox!');</script>");
            }
            else
            {
                lblMsgLight.Text = "Added to LightBox";
                Response.Write("<script>alert('Added to LightBox');</script>");
            }
        }
    }
}