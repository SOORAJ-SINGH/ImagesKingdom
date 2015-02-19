using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BusinessLayer.Admin;


public partial class lightBox2 : System.Web.UI.Page
{
    #region variable declaration
    DataSet objDS;
    clsGetInfo objGetInfo = new clsGetInfo();
    clsImages objImages = new clsImages();
    //clsAdd objAdd = new clsAdd();
    clsModify objModify = new clsModify();
    string ImageId = "";
    //string Delete;
    //private int MemberId = Convert.ToInt32(Session["SessionUserID"]);
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
                    {
                        AddImgToLightbox();
                    }
                    LoaddlData();
                }
            }
        }
        catch(Exception e1)
        { throw e1; }
    }


    #region methods/function
    public void DeleteImgLightBox(object sender, CommandEventArgs e)
    {
        objModify.MemberId = Convert.ToInt32(Session["SessionUserID"]);
        objModify.ImageId = Convert.ToInt32(e.CommandArgument.ToString());
        objDS = objModify.DeleteLightBoxImages();
        if (objDS.Tables.Count > 0)
        {
            Response.Write("<script>alert('Deleted Sucessfully');</script>");
            LoaddlData();
        }

    }

    public void AddToCart(object sender, CommandEventArgs e)
    {
        string Url = "Pricing.aspx?ImageId=" + e.CommandArgument.ToString();
        Response.Redirect(Url);


    }


    private void AddImgToLightbox()
    {
        objImages.IMAGE_ID = Convert.ToInt32(ImageId);
        objImages.MemberId = Convert.ToInt32(Session["SessionUserID"]);
        objDS = objImages.AddImageToLightBox();
        if (objDS.Tables.Count > 0)
        {
            string result = objDS.Tables[0].Rows[0][0].ToString();
            if( result == "EXISTS")
                Response.Write("<script>alert('Already in LightBox!');</script>");
            else
                Response.Write("<script>alert('Added to LightBox');</script>");
        }
    }
    private void LoaddlData()
    {
        objGetInfo.MemberId = Convert.ToInt32(Session["SessionUserID"]);
        objDS = objGetInfo.GetLightBoxImages();
        dtlData.DataSource = objDS;
        dtlData.DataBind();
    }
    #endregion



}