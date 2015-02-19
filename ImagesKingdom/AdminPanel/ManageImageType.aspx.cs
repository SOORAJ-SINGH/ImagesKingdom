using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.Admin;
using System.Data.SqlClient;
using System.Data;

public partial class AdminPanel_ManageImageType : System.Web.UI.Page
{
    #region Declare Variable
    private clsImages objImage = new clsImages();

    private DataTable DT;
    private clsGetInfo objGetInfo = new clsGetInfo();
    private clsModify objModify = new clsModify();
    private DataSet objDS;

    #endregion

    #region PAge load event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillgvImageType();
            FillDdlStatus();
        }
    }
    #endregion

    #region "Methods/ Functions"
    protected void AddNewImageInformation() // Add Image type
    {
        try
        {
            objImage.IMAGE_TYPE_NAME = txtImageType.Text.ToString();
            objImage.Dimensions_Pixels = txtDimensions_Pixels.Text;
            objImage.Dimensions_Inches = txtDimensions_Inches.Text;
            objImage.Resolution = txtResolution.Text;
            objImage.Image_Type_Status = Convert.ToInt32(ddlStatus.SelectedValue);

            objDS = objImage.ADD_NEW_IMAGE_TYPE();

            if (objDS.Tables[0].Rows.Count > 0)
            {
                if (objDS.Tables[0].Rows[0][0].ToString() == "INSERTED")
                {
                    FillgvImageType();
                    //ClearFileds();
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Added Successfully.');</script>", false);
                }
                else if (objDS.Tables[0].Rows[0][0].ToString() == "ALREADY_EXITS")
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Image Type already exists!');</script>", false);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Added Successfully.');</script>", false);

            }

        }
        catch (Exception ex)
        {
            lblWarning.Text = ex.ToString();
        }
    }
    #endregion

    #region "Button Event to Add Image Type"
    protected void btnAddnew_Click(object sender, EventArgs e)
    {
        AddNewImageInformation();
    }
    #endregion

    #region "Event: OnCommand  on GridView"
    //editing the GridView
    protected void gvImageType_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvImageType.EditIndex = e.NewEditIndex;
        FillgvImageType();
    }

    //Cancelling the Editing of Grid View
    protected void gvImageType_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvImageType.EditIndex = -1;
        FillgvImageType();
    }

    //updating the Gridview
    protected void gvImageType_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        objImage.IMAGE_TYPE_ID = Convert.ToInt32(gvImageType.DataKeys[e.RowIndex].Value.ToString());
        TextBox IMAGE_TYPE = (TextBox)gvImageType.Rows[e.RowIndex].FindControl("txtImageType");
        TextBox DIMENSIONS_INCHES = (TextBox)gvImageType.Rows[e.RowIndex].FindControl("txtDimensionInches");
        TextBox DIMENSIONS_PIXELS = (TextBox)gvImageType.Rows[e.RowIndex].FindControl("txtDimensionPixels");

        objImage.IMAGE_TYPE_NAME = IMAGE_TYPE.Text;
        objImage.Dimensions_Inches = DIMENSIONS_INCHES.Text;
        objImage.Dimensions_Pixels = DIMENSIONS_PIXELS.Text;
        DT = objImage.UpdateImageTypeDetails();


        if (DT.Rows[0][0].ToString() == "UPDATED")
        {
            gvImageType.EditIndex = -1;
            FillgvImageType();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Updated Successfully.');</script>", false);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Updated Successfully.');</script>", false);

        }


    }


    //Oncommand event Delete on GridView
    public void deleteImageType(object sender, CommandEventArgs e)
    {
        objModify.ImageTypeId = Convert.ToInt32(e.CommandArgument.ToString());
        objDS = objModify.DeleteImageType();
        if (objDS.Tables.Count > 0)
        {
            FillgvImageType();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Deleted Successfully.');</script>", false);

        }
        else
        {
            FillgvImageType();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Deleted Successfully.');</script>", false);

        }
        //FillgvImageType();


    }

    //Oncommand Event of Acive/inactive on GridView
    public void Is_ActiveChange(object sender, CommandEventArgs e)
    {

        objModify.ImageTypeId = Convert.ToInt32(e.CommandArgument);
        objDS = objModify.Change_ImageTypeStatus();
        FillgvImageType();
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Status Changed.');</script>", false);


    }
    #endregion

    #region "Grid -Bind Image Type"
    protected void FillgvImageType()
    {
        try
        {
            DT = objImage.DISPLAY_IMAGE_TYPE_LIST();
            lblCount.Text = DT.Rows.Count.ToString(); 
            gvImageType.DataSource = DT;
            gvImageType.DataBind();
            
            DT.Dispose();
        }
        catch (Exception ex)
        {
            lblWarning.Text = ex.ToString();
        }
    }
    #endregion

    //bind dropDwonList with status
    private void FillDdlStatus()
    {
        objDS = objGetInfo.GetStatusInfo();

        ddlStatus.DataSource = objDS;
        ddlStatus.DataTextField = objDS.Tables[0].Columns["STATUS_NAME"].ToString();
        ddlStatus.DataValueField = objDS.Tables[0].Columns["STATUS_ID"].ToString();
        ddlStatus.DataBind();
        ddlStatus.Items.Add(new System.Web.UI.WebControls.ListItem("--Select Status--", "0"));
        ddlStatus.SelectedValue = "0";

    }
}