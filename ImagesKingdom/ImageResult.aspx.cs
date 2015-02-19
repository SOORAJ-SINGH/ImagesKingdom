using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLayer.Admin;
using System.Data;

public partial class ImageResult : System.Web.UI.Page
{
    #region "VARIABLE DECLARATION"
    private clsImages objImage = new clsImages();
    private DataSet objDS; 
    private DataTable DT;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string te = Request.QueryString["text"];
            if (Request.QueryString["text"] == "" || Request.QueryString["text"] == null)
            {
                // no search
                DisplayImageData();
            }
            else
            {
                objImage.IMAGE_TITLE = Request.QueryString["text"];
                objDS = objImage.SearchImagesTitle();
                dtlData.DataSource = objDS;
                dtlData.DataBind();
                dtlData.Dispose();
            }
        }
        catch (Exception e1)
        {
            throw e1;
        }
        //lblPageCategoryText.Text = "6000+ images found for " + Request.QueryString["Mcat"].ToString() + ">> " + Request.QueryString["SubCat"].ToString();
        //6000+ images found for "Recently Added Images &gt;&gt; View All"
        //DisplayImageData();
    }

    public void DisplayImageData()
    {
        try
        {

            DT = objImage.DISPLAY_IMAGE_DATA();
            dtlData.DataSource = DT;
            dtlData.DataBind();
            dtlData.Dispose();
        }
        catch (Exception ex)
        {
            //lblMsg.Visible = true;
            //lblMsg.Text = ex.ToString();

        }


    }
}