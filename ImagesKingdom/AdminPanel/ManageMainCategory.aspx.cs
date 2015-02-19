using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.Admin;
using System.Data.SqlClient;
using System.Data;

public partial class AdminPanel_ManageMainCategory : System.Web.UI.Page
{
   
    #region Declare Variable
    private clsCategory objCategory = new clsCategory();
    private clsGetInfo objGetInfo = new clsGetInfo();
    private SqlDataReader DR;
    private DataTable DT;
    

    private DataSet objDS;
    #endregion

    #region Page load event 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGvMainCategoryInfo();
            FillDdlStatus();
            
        }
    }
    #endregion


    #region Button SaveMainCategory Event
    protected void btnSaveMainCategory_Click(object sender, EventArgs e)
    {

        objCategory.MAIN_CATEGORY_NAME = txtNewCategoryName.Text.Trim();
        objCategory.STATUS = Convert.ToInt32(DropDownListStatus.SelectedValue);
        objDS = objCategory.AddMainCategory();

        if (objDS.Tables.Count > 0)
        {
            if (objDS.Tables[0].Rows[0][0].ToString() == "INSERTED")
            {
                //lblMsg.Text = "Added SUCESSFULL";
                FillGvMainCategoryInfo();
                txtNewCategoryName.Text = "";
                DropDownListStatus.SelectedValue = "0";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Added Successfully.');</script>", false);
            
            }
            else if (objDS.Tables[0].Rows[0][0].ToString() == "ALREADY_EXITS")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','This Main Category already exists!');</script>", false);
                

            }
        }
        else
        {
            
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Added Successfully.');</script>", false);
            //lblMsg.Text = "NOT SUCESSFULL";
        }
        objDS.Dispose();


    }
    #endregion

    #region GridView Events
    //editing the GridView
    protected void gvMainCategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvMainCategory.EditIndex = e.NewEditIndex;
        FillGvMainCategoryInfo();
    }

    //Cancelling the Editing of Grid View
    protected void gvMainCategory_RowCancelEditing(object sender, GridViewCancelEditEventArgs e)
    {
        gvMainCategory.EditIndex = -1;
        FillGvMainCategoryInfo();
    }

    //updating the Gridview
    protected void gvMainCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(gvMainCategory.DataKeys[e.RowIndex].Value.ToString());
        TextBox MainCateName = (TextBox)gvMainCategory.Rows[e.RowIndex].FindControl("txtMainCateName");
        objCategory.MAIN_CATEGORY_NAME = MainCateName.Text;
        objDS = objCategory.UpdateMainCategory();

        if (objDS.Tables[0].Rows[0][0].ToString() == "UPDATED")
        {
            gvMainCategory.EditIndex = -1;
            FillGvMainCategoryInfo();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Updated Successfully.');</script>", false);
            
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','NOT Updated Successfully.');</script>", false);
            
        }

            
    }

    //Oncommand event Delete on GridView
    public void deleteMainCategoy(object sender, CommandEventArgs e)
    {
        objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(e.CommandArgument.ToString());
        objDS = objCategory.DeleteMainCategory();
        if (objDS.Tables.Count > 0)
        {
            FillGvMainCategoryInfo();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Deleted Successfully.');</script>", false);
            
        }
        else
        {
            FillGvMainCategoryInfo();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp',' NOT Deleted Successfully.');</script>", false);
            
        }
        
    }

    //Oncommand Event of Acive/inactive on GridView
    public void Is_ActiveChange(object sender, CommandEventArgs e)
    {
        objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(e.CommandArgument);
        objDS = objCategory.Change_MainCategoryStatus();
        FillGvMainCategoryInfo();
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Status Changed.');</script>", false);
            
    }

    #endregion



    #region "Methods/ Functions"

    //Fills the dropDownList of Status
    private void FillDdlStatus()
    {
        objDS = objGetInfo.GetStatusInfo();

        DropDownListStatus.DataSource = objDS;
        DropDownListStatus.DataTextField = objDS.Tables[0].Columns["STATUS_NAME"].ToString();
        DropDownListStatus.DataValueField = objDS.Tables[0].Columns["STATUS_ID"].ToString();
        DropDownListStatus.DataBind();
        DropDownListStatus.Items.Add(new System.Web.UI.WebControls.ListItem("--Select Status--", "0"));
        DropDownListStatus.SelectedValue = "0";

    }

    
    /*--fills the GridView of main category --*/
    protected void FillGvMainCategoryInfo()
    {
        try
        {

            objDS = objCategory.GetMainCategoryInfo();
            gvMainCategory.DataSource = objDS;
            gvMainCategory.DataBind();
            lblCount.Text = objDS.Tables[0].Rows.Count.ToString();
            gvMainCategory.Dispose();
        }
        catch (Exception ex)
        {
            //lblWarning.Text = ex.ToString();
        }
    }
    #endregion


    
}