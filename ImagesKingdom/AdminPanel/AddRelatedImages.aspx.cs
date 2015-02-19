using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLayer.Admin;
using System.Data;


public partial class AdminPanel_AddRelatedImages : System.Web.UI.Page
{
    #region Variable Declaration
    public clsGetInfo objGetInfo = new clsGetInfo();
    public clsCategory objCategory = new clsCategory();
    public clsImages objImages = new clsImages();
    public DataSet objDS = new DataSet();
    #endregion

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!IsPostBack)
            {
                if (Session["NewImageId"] != null)
                {
                    DivSearchResult.Visible = false;
                    LoadSubCategory();
                    LoadMainCategory();

                }
                else
                {
                    Response.Redirect("AddNewImageData.aspx?status=error");
                }

            }
        }
        catch (Exception e1)
        {
            throw e1;
        }
    }

    //Button events for Search Button
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (rbtnImgeCode.Checked)
        {
            objGetInfo.ImageCode = txtImageCode.Text.Trim();
            objGetInfo.SubCategoryId = 0;
            objDS = objGetInfo.GetImageSearchResult();
            if (objDS.Tables[0].Rows.Count > 0)
            {
                DivSearchResult.Visible = true;
                gvRelatedImagesSearchResults.DataSource = objDS;
                gvRelatedImagesSearchResults.DataBind();
            }
            else
            {
                Response.Write("<script>alert('No Data Found!');</script>");

            }

        }
        else if (rbtnMainCategory.Checked)
        {
            objGetInfo.MainCategoryId = Convert.ToInt32(ddlMainCategory.SelectedValue);
            objGetInfo.SubCategoryId = Convert.ToInt32(ddlSubCategory.SelectedValue);
            objGetInfo.ImageCode = null;
            objDS = objGetInfo.GetImageSearchResult();
            if (objDS.Tables[0].Rows.Count > 0)
            {
                DivSearchResult.Visible = true;
                gvRelatedImagesSearchResults.DataSource = objDS;
                gvRelatedImagesSearchResults.DataBind();
            }
            else
            {
                Response.Write("<script>alert('No Data Found!');</script>");

            }

        }
        else
        {
            Response.Write("<script>alert('Please Check the Radio Button');</script>");
        }
    }

    //Save Related Images
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string str = string.Empty;
        string strName = string.Empty;

        foreach (GridViewRow gvrow in gvRelatedImagesSearchResults.Rows)
        {
            CheckBox chk = (CheckBox)gvrow.FindControl("cbSelectImage");
            if (chk != null & chk.Checked)
            {
                str += gvRelatedImagesSearchResults.DataKeys[gvrow.RowIndex].Value.ToString() + ',';
                
            }
        }

        objImages.IMAGE_ID =Convert.ToInt32( Session["NewImageId"]);
        //seprate the ImageId from  the string of imageId
        string[] ImageId ;
        bool status = true;
        ImageId= str.Split(',');
        foreach (string id in ImageId)
        {
            if (id != "")
            {
                objImages.REFFERENCE_PHOTO_ID = Convert.ToInt32(id);
                objDS = objImages.AddRelatedImages();
                if (objDS.Tables[0].Rows[0][0] == "INSERTED")
                { }
                else
                    status = false;
            }
        }

        if (status == true)
        {
            Response.Write("<script>alert('Saved.');</script>");
            Session["NewImageId"] = null;
        }
        else
            Response.Write("<script>alert('Saved.');</script>");
        
    }

    //to chanage the sub category items when main category item changed
    protected void ddlMainCategory_SelectedIndexChanged1(object sender, EventArgs e)
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
    #endregion

    #region Methods/Function
    //fills the drop down list of Sub category
    public void LoadSubCategory()
    {
        objDS = objGetInfo.GetSubCategoryInfo();
        ddlSubCategory.DataSource = objDS;
        ddlSubCategory.DataTextField = objDS.Tables[0].Columns["SUB_CATEGORY_NAME"].ToString();
        ddlSubCategory.DataValueField = objDS.Tables[0].Columns["SUB_CATEGORY_ID"].ToString();
        ddlSubCategory.DataBind();
        ddlSubCategory.Items.Add(new ListItem("--Select SubCategory--", "0"));
        ddlSubCategory.SelectedValue = "0";
        //rbSubCategoryName.InputAttributes.Add("disabled", "disabled");
    }

    //fills the drop down list of Sub category
    public void LoadMainCategory()
    {
        objDS = objGetInfo.GetMainCategoryInfo();
        ddlMainCategory.DataSource = objDS;
        ddlMainCategory.DataTextField = objDS.Tables[0].Columns["MAIN_CATE_NAME"].ToString();
        ddlMainCategory.DataValueField = objDS.Tables[0].Columns["MAIN_CAT_ID"].ToString();
        ddlMainCategory.DataBind();
        ddlMainCategory.Items.Add(new ListItem("--Select MainCategory--", "0"));
        ddlMainCategory.SelectedValue = "0";

    }

    #endregion



}