using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.Admin;
using System.Data.SqlClient;
using System.Data;
using System.IO; // to delete the file
using System.Web.Services;

using System.Configuration;

public partial class AdminPanel_ManageImages : System.Web.UI.Page
{
    #region Declare Variable
    private clsImages objImages = new clsImages();
    private clsCategory objCategory = new clsCategory();

    private SqlDataReader DR;
    private DataTable DT;

    private DataSet objDS;
    private clsGetInfo objGetInfo = new clsGetInfo();
    #endregion


    #region "Page load"
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGvImages();
            FillMainCategory();
            FillSubCategory();
        }

    }
    #endregion

    #region "Ajax Call"
    //this method is called through jquery AJAX....................to retrive the image Code
    [WebMethod]
    public static string[] GetImageCode(string keyword)
    {
        List<string> ImageCode = new List<string>();
        string query = string.Format("select IMAGE_CODE from TBL_IMAGES_INFORMATION where IMAGE_CODE LIKE '%{0}%'", keyword);

        using (SqlConnection con =
                new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ImageCode.Add(reader.GetString(0));
                }
            }
        }

        return ImageCode.ToArray();
    }

    public static string[] GetSubCategory(string name)
    {
        List<string> SubCategory = new List<string>();
        string query = string.Format("select SUB_CATEGORY_NAME from TBL_SUB_CATEGORY where MAIN_CATEGORY_ID LIKE '%{0}%'", name);

        using (SqlConnection con =
                new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    SubCategory.Add(reader.GetString(0));
                }
            }
        }

        return SubCategory.ToArray();
        //return "ok";

    }

    #endregion

    #region "GridView Events"
    public void Is_ActiveChange(object sender, CommandEventArgs e)
    {
        objImages.IMAGE_ID = Convert.ToInt32(e.CommandArgument);
        objDS = objImages.ChangeImageStatus();
        FillGvImages();
        objDS.Dispose();
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Status Changed.');</script>", false);
        
    }

    public void DeleteImage(object sender, CommandEventArgs e)
    {
        objImages.IMAGE_ID = Convert.ToInt16(e.CommandArgument);
        objDS = objImages.DeleteImageData();
        if (objDS != null)
        {
            //file Path
            string FilePathS = Request.PhysicalApplicationPath + "uploads\\small_img\\" + objDS.Tables[0].Rows[0][0].ToString();
            string FilePathL = Request.PhysicalApplicationPath + "uploads\\large_img\\" + objDS.Tables[0].Rows[0][1].ToString();

            File.Delete(FilePathS);
            File.Delete(FilePathL);

            FillGvImages();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Deleted Successfully.');</script>", false);
            

        }
        else
        {
            FillGvImages();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Deleted Successfully.');</script>", false);
            
        }

    }
    #endregion

    #region "Button Events for Search Button"
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (rbtnImgeCode.Checked)
        {
            objGetInfo.ImageCode = txtImageCode.Text.Trim();
            objGetInfo.SubCategoryId = 0;
            objDS = objGetInfo.GetImageSearchResult();
            if (objDS.Tables[0].Rows.Count > 0)
            {
                gvImageList.DataSource = objDS;
                gvImageList.DataBind();
                lblCount.Text = objDS.Tables[0].Rows.Count.ToString();
                gvImageList.Dispose();
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
                gvImageList.DataSource = objDS;
                gvImageList.DataBind();
                lblCount.Text = objDS.Tables[0].Rows.Count.ToString();
                gvImageList.Dispose();
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
    #endregion

    
    
    #region "to chanage the sub category items when main category item changed"
    public  void ddlMainCategory_SelectedIndexChanged(object sender, EventArgs e)
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



    #region "Grid -Bind Image List"
    protected void FillGvImages()
    {
        try
        {
            DT = objImages.BindImageList();
            gvImageList.DataSource = DT;
            gvImageList.DataBind();
            lblCount.Text = DT.Rows.Count.ToString();
            gvImageList.Dispose();
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.ToString();
        }
    }
    #endregion


    #region "Bind Main & Sub Category"
    protected void FillMainCategory()
    {
        try
        {
            objDS = objGetInfo.GetMainCategoryInfo();
            ddlMainCategory.DataSource = objDS;
            ddlMainCategory.DataTextField = objDS.Tables[0].Columns[1].ToString();
            ddlMainCategory.DataValueField = objDS.Tables[0].Columns[0].ToString();
            ddlMainCategory.DataBind();
            ddlMainCategory.Items.Add(new System.Web.UI.WebControls.ListItem("---Select Main Category---", "0"));
            ddlMainCategory.SelectedValue = "0";
            ddlMainCategory.Dispose();

        }
        catch (Exception e)
        {
            //return ObjDS;
        }
    }
    protected void FillSubCategory()
    {
        try
        {

            //objDS = objCategory.GetSubCategoryInfo();
            //ddlSubCategory.DataSource = objDS;
            //ddlSubCategory.DataTextField = objDS.Tables[0].Columns["SUB_CATEGORY_NAME"].ToString();
            //ddlSubCategory.DataValueField = objDS.Tables[0].Columns["SUB_CATEGORY_ID"].ToString();
            //ddlSubCategory.DataBind();
            ddlSubCategory.Items.Add(new System.Web.UI.WebControls.ListItem("---Select Sub Category---", "0"));
            ddlSubCategory.SelectedValue = "0";
            ddlSubCategory.Dispose();
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.ToString();
        }
    }
    #endregion



    protected void ddlMainCategory_TextChanged(object sender, EventArgs e)
    {

    }
}