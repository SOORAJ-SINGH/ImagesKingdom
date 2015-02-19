using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.Admin;
using System.Data.SqlClient;
using System.Data;
using System.IO;


public partial class AdminPanel_AddNewImageData : System.Web.UI.Page
{

    #region Declare Variable
    private clsImages objImage = new clsImages();
    private clsCategory objCategory = new clsCategory();
    clsGetInfo objGetInfo = new clsGetInfo();
    private SqlDataReader DR;
    private DataTable DT;
    private DataSet objDS;
    private string[] SmallFileName;
    private string[] LargeFileName;
    private bool SmallFileCheckStatus;
    private bool LargeFileCheckStatus;
    #endregion

    #region page load
    protected void Page_Load(object sender, EventArgs e)
    {
        string status;
        if (!IsPostBack)
        {
            status = Request.QueryString["status"];
            if (status == "error")
            {
                Response.Write("<script>alert('First Add new Image!');</script>");
            }
            else
            {
            }
            FillMainCategory();
            FillSubCategory();
            FillDdlStatusInfo();
            
        }
    }
    #endregion

    #region Button Event
    //to add new image 
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        AddNewImageInformation();
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
    #endregion


    #region "Methods/ Functions"
    protected void AddNewImageInformation() // Add Image
    {
        try
        {

            string uploadFolderSmallFile = Request.PhysicalApplicationPath + "uploads\\small_img\\";
            string uploadFolderLargeFile = Request.PhysicalApplicationPath + "uploads\\large_img\\";
            string extension;
            string extensionLarge;

            //********************************************************
                //Small file upload here
            //********************************************************
            if (smallFileName.HasFile)
            {
                extension = Path.GetExtension(smallFileName.PostedFile.FileName).ToLower();
                SmallFileName = Path.GetFileName(smallFileName.PostedFile.FileName).Split('.');


                if (extension.ToLower() == ".gif" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
                {
                    if (smallFileName.PostedFile.ContentLength < 2000000)
                    {
                        SmallFileCheckStatus = true;
                    }

                    else
                    {
                        SmallFileCheckStatus = false;
                        Response.Write("<script>alert('File size could not be greater then 2 mb.');</script>");
                        lblWarning.Text = "File size could not be greaten then 2 mb.";
                    }
                }
                else
                {
                    Response.Write("<script>alert('File is not supported!');</script>");
                    lblWarning.Text = "File is not supported!";
                }
            }


               
                //********************************************************
                //large file upload here
                //********************************************************
                if (largeImage.HasFile)
                {
                    extensionLarge = Path.GetExtension(largeImage.PostedFile.FileName).ToLower();
                    LargeFileName = Path.GetFileName(largeImage.PostedFile.FileName).Split('.');


                    if (extensionLarge.ToLower() == ".gif" || extensionLarge.ToLower() == ".jpg" || extensionLarge.ToLower() == ".jpeg")
                    {
                        if (largeImage.PostedFile.ContentLength < 2000000)
                        {
                            LargeFileCheckStatus = true;
                        }

                        else
                        {
                            LargeFileCheckStatus = false;
                            Response.Write("<script>alert('File size could not be greater then 2 mb.');</script>");
                            lblWarning.Text = "File size could not be greater then 2 mb.";
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('File is not supported!');</script>");
                        lblWarning.Text = "File is not supported!";
                    }
                }

                //***************************************************
                    // Add and save image
                //******************************************************
                if (SmallFileCheckStatus == true && LargeFileCheckStatus == true)
                {

                    string SmallfileExtension = SmallFileName[1].ToLower();
                    string LargeFileExtension = LargeFileName[1].ToString();

                    objImage.SMALL_FILE_EXTENSION = SmallfileExtension.ToString();
                    objImage.LARGE_FILE_EXTENSION = LargeFileExtension.ToString();

                    objImage.IMAGE_TITLE = txtTitle.Text.Trim().ToString();
                    objImage.IMAGE_CODE = txtImageCode.Text.Trim().ToString();
                    objImage.SUB_CATEGORY_ID = Convert.ToInt32(ddlSubCategory.SelectedValue);
                    objImage.KEYWORDS = txtKeyword.Text.Trim().ToString();
                    objImage.STATUS = Convert.ToInt32(ddlStatus.SelectedValue);


                    objDS = objImage.ADD_NEW_IMAGE_INFORMATION();
                    if (objDS.Tables[0].Rows[0][0].ToString() != "0")
                    {
                        if (objDS.Tables[0].Rows.Count > 0)
                        {
                            string SmallUploaded_File_name;
                            string LargeUploadedFileName;
                            SmallUploaded_File_name = objDS.Tables[0].Rows[0][0].ToString(); // small file save
                            LargeUploadedFileName = objDS.Tables[0].Rows[0][1].ToString();  // large file save
                            smallFileName.SaveAs(uploadFolderSmallFile + SmallUploaded_File_name);
                            smallFileName.SaveAs(uploadFolderLargeFile + LargeUploadedFileName);


                            lblWarning.Text = "Data Saved";
                            ClearTextBox();

                            Response.Write("<script>alert('Added sucessfully');</script>");
                            //creating the session for current id
                            string s = objDS.Tables[0].Rows[0][2].ToString();
                            Session["NewImageId"] = s;
                        }
                    }
                    else
                    {
                        lblWarning.Text = "Image code already exists ";
                        Response.Write("<script>alert('Image code already exists');</script>");
                    }

                }
                else
                {
                    //Response.Write;
                }

            
        }
        catch (Exception ex)
        {
            lblWarning.Text = ex.ToString();
        }

    }

    //fills the Drop downlist of Status
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

            objDS = objCategory.GetSubCategoryInfo();
            ddlSubCategory.DataSource = objDS;
            ddlSubCategory.DataTextField = objDS.Tables[0].Columns["SUB_CATEGORY_NAME"].ToString();
            ddlSubCategory.DataValueField = objDS.Tables[0].Columns["SUB_CATEGORY_ID"].ToString();
            ddlSubCategory.DataBind();
            ddlSubCategory.Items.Add(new System.Web.UI.WebControls.ListItem("---Select Sub Category---", "0"));
            ddlSubCategory.SelectedValue = "0";
            ddlSubCategory.Dispose();
        }
        catch (Exception ex)
        {
            lblWarning.Text = ex.ToString();
        }
    }

    protected void ClearTextBox()
    {
        txtImageCode.Text = "";
        txtKeyword.Text = "";
        txtTitle.Text = "";
        
    }
    #endregion




}