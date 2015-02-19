using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.Admin;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;
using System.Web.Services;
using System.Web.Script;
using System.Web.Script.Serialization;

public partial class AdminPanel_ManageSubCategory : System.Web.UI.Page
{
    #region Declare Variable
    private clsCategory objCategory = new clsCategory();
    private SqlDataReader DR;
    private DataTable DT;

    private clsGetInfo objGetInfo = new clsGetInfo();
    private DataSet objDS;
    #endregion

    #region Page load event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDdlMainCategory();
            FillgvSubCategory();
            FillDdlStatusInfo();
            
        }
    }
    #endregion

    #region Button Add Event
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        AddNewSubCategory();

    }
    #endregion

    #region "PageIndexChange"
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSubCategory.PageIndex = e.NewPageIndex;
        FillgvSubCategory();
        //GridVwPagingSorting.PageIndex = e.NewPageIndex;
        //DataView dvEmployee = Getdata();
        //GridVwPagingSorting.DataSource = dvEmployee;
        //GridVwPagingSorting.DataBind();
    }
    #endregion


    #region "AJAX CALL"
    //method called using the AJAX ..to get the sub category based on the main category
    [WebMethod]
    public static string GetSubCategory(string MainCategoryId)
    {
        DataTable DT = new DataTable();
        DataSet DS = new DataSet();
        clsCategory objcate = new clsCategory();
        string daresult = null;
        objcate.MAIN_CATEGORY_ID = Convert.ToInt32(MainCategoryId);

        DS = objcate.GetSubCategoryforMainCateID();
        DT = DS.Tables[0];

        daresult = DataSetToJSON(DS);
        return daresult;
    }


    public static string DataSetToJSON(DataSet ds)
    {

        Dictionary<string, object> dict = new Dictionary<string, object>();
        foreach (DataTable dt in ds.Tables)
        {
            object[] arr = new object[dt.Rows.Count + 1];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                arr[i] = dt.Rows[i].ItemArray;
            }

            dict.Add(dt.TableName, arr);
        }

        JavaScriptSerializer json = new JavaScriptSerializer();
        return json.Serialize(dict);
    }
    #endregion






    #region GridView Oncommand Events
    //editing the Grid View 
    protected void gvSubCategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvSubCategory.EditIndex = e.NewEditIndex;
        FillgvSubCategory();

        objDS = objCategory.GetMainCategoryInfo();

        //ddlUpdateMainCategory.DataSource = objDS;
        //ddlUpdateMainCategory.DataTextField = objDS.Tables[0].Columns["MAIN_CATE_NAME"].ToString();
        //ddlUpdateMainCategory.DataValueField = objDS.Tables[0].Columns["MAIN_CAT_ID"].ToString();
        //ddlUpdateMainCategory.DataBind();
        //ddlUpdateMainCategory.Items.Add(new ListItem("--Select Main Category--", "0"));
        //ddlUpdateMainCategory.SelectedValue = "0";

    }

    protected void gvSubCategory_RowCancelEditing(object sender, GridViewCancelEditEventArgs e)
    {
        gvSubCategory.EditIndex = -1;
        FillgvSubCategory();
    }

    //updating the Gridview
    protected void gvSubCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        objCategory.SUB_CATEGORY_ID = Convert.ToInt32( gvSubCategory.DataKeys[e.RowIndex].Value);
        TextBox txtEditSubCateName = (TextBox)gvSubCategory.Rows[e.RowIndex].FindControl("txtSubCategory");
        objCategory.SUB_CATEGORY_NAME = txtEditSubCateName.Text;
        DropDownList ddlEditMainCateId = (DropDownList)gvSubCategory.Rows[e.RowIndex].FindControl("ddlUpdateMainCategory");
        objCategory.MAIN_CATEGORY_ID = Convert.ToInt32( ddlEditMainCateId.SelectedValue);
        objDS = objCategory.UpdateSubCategory();

        if (objDS.Tables[0].Rows[0][0].ToString() == "UPDATED")
        {
            gvSubCategory.EditIndex = -1;
            FillgvSubCategory();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Updated Successfully.');</script>", false);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Updated Successfully.');</script>", false);
            
        }

    }



    //Oncommand Event of Delete click on GridView
    public void deleteSubCategoy(object sender, CommandEventArgs e)
    {
        string MainId = "";
        string SubId = "";
        if (e.CommandName == "DeleteSubCategory")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            MainId = commandArgs[1];
            SubId = commandArgs[0];
        }
        objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(MainId);
        objCategory.SUB_CATEGORY_ID = Convert.ToInt32(SubId);
        objDS = objCategory.DeleteSubCategory();
        if (objDS != null)
        {
            FillgvSubCategory();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Deleted Successfully.');</script>", false);
            
        }
        else
        {
            FillgvSubCategory();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Deleted Successfully.');</script>", false);
            
        }
        //FillgvSubCategory(); 
    }

    //Oncommand Event of Acive/inactive on GridView
    public void Is_ActiveChange(object sender, CommandEventArgs e)
    {
        objCategory.SUB_CATEGORY_ID = Convert.ToInt32(e.CommandArgument);

        objDS = objCategory.Change_SubCategoryStatus();
        FillgvSubCategory();
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Status Changed.');</script>", false);
        
    }
    #endregion


 
    #region Methods/Functions
    protected void AddNewSubCategory() // Add sub category
    {
        objCategory.SUB_CATEGORY_NAME = txtNewCategoryName.Text.Trim();
        objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(ddlMainCategory.SelectedValue);
        objCategory.STATUS = Convert.ToInt32(ddlStatus.SelectedValue);

        objDS = objCategory.AddSubCategory();

        if (objDS.Tables.Count > 0)
        {
            if (objDS.Tables[0].Rows[0][0].ToString() == "INSERTED")
            {
                FillgvSubCategory();
                ClearFileds();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Added Successfully.');</script>", false);
            
            }
            else if (objDS.Tables[0].Rows[0][0].ToString() == "ALREADY_EXITS")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Sub Category already exists!');</script>", false);
            
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Added Successfully.');</script>", false);
            
        }
        objDS.Dispose();

    }
    
    //fills the Drop downLIst of Main category
    protected void FillDdlMainCategory()
    {
        try
        {
            objDS = objCategory.GetMainCategoryInfo();

            ddlMainCategory.DataSource = objDS;
            ddlMainCategory.DataTextField = objDS.Tables[0].Columns["MAIN_CATE_NAME"].ToString();
            ddlMainCategory.DataValueField = objDS.Tables[0].Columns["MAIN_CAT_ID"].ToString();
            ddlMainCategory.DataBind();
            ddlMainCategory.Items.Add(new ListItem("--Select Main Category--", "0"));
            ddlMainCategory.SelectedValue = "0";
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

    //Fills the GridView
    private void FillgvSubCategory()
    {
        objDS = objCategory.GetSubCategoryInfo();
        lblCount.Text = objDS.Tables[0].Rows.Count.ToString();
        gvSubCategory.DataSource = objDS;
        gvSubCategory.DataBind();
        objDS.Dispose();

    }


    //Clear the text fields
    public void ClearFileds()
    {
        txtNewCategoryName.Text = "";
        ddlMainCategory.SelectedValue = "0";
        ddlStatus.SelectedValue = "0";

    }
   


    #endregion



}