using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLayer.Admin;
using System.Data;

public partial class AdminPanel_EditImageDetails : System.Web.UI.Page
{
    #region variable Declaration
    //private clsAdd objClsAdd = new clsAdd();
    private clsGetInfo objGetInfo = new clsGetInfo();
    private clsCategory objCategory = new clsCategory();
    private clsImages objImages = new clsImages();
    private clsModify objModify = new clsModify();
    DataSet objDS;
    DataTable objDT;
    int imageId = 0;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            imageId = Convert.ToInt32(Request.QueryString["ImageId"]);
            //lblhiddenImageId.Text = Request.QueryString["ImageId"].ToString();
            ViewState["ImageId"] = Request.QueryString["ImageId"].ToString();
            FillDdlStatusInfo();
            FillMainCategory();
            FillSubCategory();
            //FillDdlImageTypeId();
            LoadImage(imageId);
        }
    }


    #region "Update Button Click Event"
    protected void btnUpdateImageDetails_Click(object sender, EventArgs e)
    {
        objImages.IMAGE_TITLE = txtTitle.Text;
        objImages.KEYWORDS = txtKeyword.Text;
        objImages.STATUS =Convert.ToInt32( ddlStatus.SelectedValue);
        objImages.SUB_CATEGORY_ID = Convert.ToInt32(ddlSubCategory.SelectedValue);
        objImages.IMAGE_ID = Convert.ToInt32(ViewState["ImageId"]);

        objDS =  objImages.UPDATE_IMAGE_INFORMATION();
        if (objDS.Tables[0].Rows[0][0].ToString() == "UPDATED")
        {
            Response.Write("<script>alert('Updated);</script>");
            
        }
        else
        {
            //Response.Write("<script>alert('Not Updated);</script>");
        }

    }
    #endregion
    


    #region GridView Events
    //editing the GridView
    protected void gvImageType_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvImageType.EditIndex = e.NewEditIndex;
        BindgvImageType();
    }

    //Cancelling the Editing of Grid View
    protected void gvImageType_RowCancelEditing(object sender, GridViewCancelEditEventArgs e)
    {
        gvImageType.EditIndex = -1;
        BindgvImageType();
    }

    //updating the Gridview
    protected void gvImageType_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        objImages.IMAGE_PRICE_ID = Convert.ToInt32( gvImageType.DataKeys[e.RowIndex].Value);

        TextBox Price = (TextBox)gvImageType.Rows[e.RowIndex].FindControl("txtPrice");
        TextBox Discount = (TextBox)gvImageType.Rows[e.RowIndex].FindControl("txtDiscount");
        TextBox NetPrice = (TextBox)gvImageType.Rows[e.RowIndex].FindControl("txtNetPrice");

        objImages.Price = Convert.ToDouble( Price.Text);
        objImages.NetPrice = Convert.ToDecimal(NetPrice.Text);
        objImages.Discount = Convert.ToDouble( Discount.Text);

        objDS = objImages.UpdateImagePriceDetails();

        //objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(gvImageType.DataKeys[e.RowIndex].Value.ToString());
        //TextBox MainCateName = (TextBox)gvImageType.Rows[e.RowIndex].FindControl("txtMainCateName");
        //objCategory.MAIN_CATEGORY_NAME = MainCateName.Text;
        //objDS = objCategory.UpdateMainCategory();

        if (objDS.Tables[0].Rows[0][0].ToString() == "UPDATED")
        {
            //Response.Write("<script>alert('Updated);</script>");
            gvImageType.EditIndex = -1;
            BindgvImageType();
        }
        else
        {
            //Response.Write("<script>alert('Not Updated);</script>");
        }


    }

    //Oncommand event Delete on GridView
    public void deleteImageType(object sender, CommandEventArgs e)
    {
        objImages.IMAGE_PRICE_ID = Convert.ToInt32(e.CommandArgument);

        objDT = objImages.DeleteImageTypePrice();
        if (objDT.Rows.Count > 0)
        {
            // Response.Write("<script>alert('Deleted Successfully');</script>");
            BindgvImageType();

        }
        else
        {
            // Response.Write("<script>alert('Not Deleted Successfully');</script>");
            BindgvImageType();

        }
        //FillImageType();


    }

    //Oncommand Event of Acive/inactive on GridView
    //public void Is_ActiveChange(object sender, CommandEventArgs e)
    //{
    //    objImages.IMAGE_ID = Convert.ToInt32(lblhiddenImageId.Text);
    //    objImages.IMAGE_TYPE_ID = Convert.ToInt32(e.CommandArgument);
    //    objDT = objImages.ChangeImageTypeStatus();
    //    //objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(e.CommandArgument);
    //    //objDS = objCategory.Change_MainCategoryStatus();
    //    BindgvImageType();
    //}

    #endregion

    private void LoadImage(int imageID)
    {
        objImages.IMAGE_ID = imageID;
        objDS = objImages.Display_ImageForEdit();

        lblImageCode.Text = objDS.Tables[0].Rows[0]["IMAGE_CODE"].ToString();
        imgShow.ImageUrl = "../uploads/small_img/" + objDS.Tables[0].Rows[0]["SMALL_PHOTO"].ToString();
        txtTitle.Text = objDS.Tables[0].Rows[0]["IMAGE_TITLE"].ToString();

        txtKeyword.Text = objDS.Tables[0].Rows[0]["KEYWORDS"].ToString();
        //ddlImageType.SelectedValue =  objDS.Tables[0].Rows[0]["IMAGE_TYPE_ID"].ToString();
        ddlStatus.SelectedValue = objDS.Tables[0].Rows[0]["STATUS"].ToString();
        ddlMainCategory.SelectedValue = objDS.Tables[0].Rows[0]["MAIN_CATEGORY_ID"].ToString();
        ddlSubCategory.SelectedValue = objDS.Tables[0].Rows[0]["SUB_CATEGORY_ID"].ToString();


        //bind the GridView
        gvImageType.DataSource = objDS.Tables[1];
        gvImageType.DataBind();
        gvImageType.Dispose();
        //BindgvImageType();
    }

    //bind the GridView
    private void BindgvImageType()
    {
        //objImages.IMAGE_ID = imageId;
        //objImages.IMAGE_ID = Convert.ToInt32(lblhiddenImageId.Text);
        objImages.IMAGE_ID = Convert.ToInt32(ViewState["ImageId"]);
        objDS = objImages.Display_ImageForEdit();

        gvImageType.DataSource = objDS.Tables[1];
        gvImageType.DataBind();
        gvImageType.Dispose();
    }


    //to chanage the sub category items when main category item changed
    public void ddlMainCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(ddlMainCategory.SelectedValue);
        objDS = objCategory.GetSubCategoryInfomMenu();
        ddlSubCategory.DataSource = objDS;
        ddlSubCategory.DataTextField = objDS.Tables[0].Columns["SUB_CATEGORY_NAME"].ToString();
        ddlSubCategory.DataValueField = objDS.Tables[0].Columns["SUB_CATEGORY_ID"].ToString();
        ddlSubCategory.DataBind();
        ddlSubCategory.Items.Add(new System.Web.UI.WebControls.ListItem("---Select Sub Category---", "0"));
        ddlSubCategory.SelectedValue = "0";
        ddlSubCategory.Dispose();
        //return "sbyte";
    }


    #region "fills the Drop downlist"
   
    private void FillDdlStatusInfo()
    {
        objDS = objGetInfo.GetStatusInfo();

        ddlStatus.DataSource = objDS;
        ddlStatus.DataTextField = objDS.Tables[0].Columns["STATUS_NAME"].ToString();
        ddlStatus.DataValueField = objDS.Tables[0].Columns["STATUS_ID"].ToString();
        ddlStatus.DataBind();
        ddlStatus.Items.Add(new System.Web.UI.WebControls.ListItem("--Select Status--", "0"));
        ddlStatus.SelectedValue = "0";

    }

    protected void FillMainCategory()
    {
        try
        {

            objDS = objCategory.GetMainCategoryInfo();
            ddlMainCategory.DataSource = objDS;
            ddlMainCategory.DataTextField = objDS.Tables[0].Columns["MAIN_CATE_NAME"].ToString();
            ddlMainCategory.DataValueField = objDS.Tables[0].Columns["MAIN_CAT_ID"].ToString();
            ddlMainCategory.DataBind();
            ddlMainCategory.Items.Add(new System.Web.UI.WebControls.ListItem("---Select Main Category---", "0"));
            ddlMainCategory.SelectedValue = "0";
            ddlMainCategory.Dispose();
        }
        catch (Exception ex)
        {
            lblWarning.Text = ex.ToString();
        }
    }

    protected void FillSubCategory()
    {
        try
        {


            ddlSubCategory.Items.Add(new System.Web.UI.WebControls.ListItem("---Select Sub Category---", "0"));
            ddlSubCategory.SelectedValue = "0";
            ddlSubCategory.Dispose();
        }
        catch (Exception ex)
        {
            lblWarning.Text = ex.ToString();
        }
    }
    //public void FillDdlImageTypeId()
    //{
    //    objDS = objGetInfo.GetImageType();
    //    ddlImageType.DataSource = objDS;
    //    ddlImageType.DataTextField = objDS.Tables[0].Columns["IMAGE_TYPE"].ToString();
    //    ddlImageType.DataValueField = objDS.Tables[0].Columns["IMAGE_TYPE_ID"].ToString();
    //    ddlImageType.DataBind();
    //    ddlImageType.Items.Add(new ListItem("--Select Image Type--", "0"));
    //    ddlImageType.SelectedValue = "0";

    //}
    #endregion












}