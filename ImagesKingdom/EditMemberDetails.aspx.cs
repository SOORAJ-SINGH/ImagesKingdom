using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLayer.Admin;
using System.Data;

public partial class EditMemberDetails : System.Web.UI.Page
{

    #region varisbleDeclaration
    clsGetInfo objGetInfo = new clsGetInfo();
    clsMember objMemberUpdate = new clsMember();
    DataSet DS;
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
                    DS = objGetInfo.GetInfoForDdl();
                    LoadDdlBusiness();
                    LoadDdlCountry();
                    LoadDdlJobDescription();
                    LoadDdlState();
                    LoadDdlWhereHeard();

                    LoadUserDetails();

                }

            }
        }
        catch (Exception e1)
        {
            throw e1;
        }


    }

    protected void btnUpdateProfile_Click(object sender, ImageClickEventArgs e)
    {
        objMemberUpdate.MemberId = Convert.ToInt32(Session["SessionUserID"]);
        objMemberUpdate.FirstName = txt_FirstName.Text;
        objMemberUpdate.LastName = txt_LastName.Text;
        objMemberUpdate.CompanyName = txt_CompanyName.Text;
        objMemberUpdate.JobDescription = Convert.ToInt32(ddlJobDescription.SelectedValue);
        objMemberUpdate.BusinessType = Convert.ToInt32(ddlBusinessType.SelectedValue);
        objMemberUpdate.Country = Convert.ToInt32(ddlCountry.SelectedValue);
        objMemberUpdate.Address = txtAddress.Text;
        objMemberUpdate.State = Convert.ToInt32(ddlState.SelectedValue);
        objMemberUpdate.Zip = txtZipCode.Text;
        objMemberUpdate.Mobile = txtMobileNumber.Text;
        objMemberUpdate.Phone = txtPhoneNumber.Text;

        DS = objMemberUpdate.Update_UserDetails();
        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows[0][0].ToString() == "UPDATED")
            {
                Response.Write("<scrip>alert('Updated');</script>");
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Login First!');</script>", false);
            }
            else
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Login First!');</script>", false);
            }
        }
    }

    #region Bind the data with DropDownlists on page

    //lOADS THE details of user for updation
    public void LoadUserDetails()
    {
        objGetInfo.UserId = Convert.ToInt32(Session["SessionUserID"]);
        DS = objGetInfo.GetUserInfo();

        lblEmail.Text = DS.Tables[0].Rows[0]["EMAIL_ID"].ToString();
        txt_FirstName.Text = DS.Tables[0].Rows[0]["FIRST_NAME"].ToString();
        txt_LastName.Text = DS.Tables[0].Rows[0]["LAST_NAME"].ToString();
        txt_CompanyName.Text = DS.Tables[0].Rows[0]["COMPANY_NAME"].ToString();
        txtAddress.Text = DS.Tables[0].Rows[0]["ADDRESS"].ToString();
        txtMobileNumber.Text = DS.Tables[0].Rows[0]["MOBILE"].ToString();
        txtPhoneNumber.Text = DS.Tables[0].Rows[0]["PHONE"].ToString();
        txtZipCode.Text = DS.Tables[0].Rows[0]["ZIP"].ToString();

        ddlBusinessType.SelectedValue = DS.Tables[0].Rows[0]["BUSINESS_TYPE"].ToString();
        ddlJobDescription.SelectedValue = DS.Tables[0].Rows[0]["JOB_DESCRIPTION"].ToString();
        ddlCountry.SelectedValue = DS.Tables[0].Rows[0]["CountryId"].ToString();
        ddlState.SelectedValue = DS.Tables[0].Rows[0]["StateId"].ToString();
    }

    //this loads the data from database table with the drop down List
    public void LoadDdlBusiness()
    {
        ddlBusinessType.DataSource = DS.Tables[0];
        ddlBusinessType.DataTextField = DS.Tables[0].Columns["BusinessTypeName"].ToString();
        ddlBusinessType.DataValueField = DS.Tables[0].Columns["BusinessTypeId"].ToString();
        ddlBusinessType.DataBind();
        ddlBusinessType.Items.Add(new ListItem("--Select Business Type--", "0"));
        ddlBusinessType.SelectedValue = "0";
    }

    public void LoadDdlCountry()
    {
        ddlCountry.DataSource = DS.Tables[1];
        ddlCountry.DataTextField = DS.Tables[1].Columns[1].ToString();
        ddlCountry.DataValueField = DS.Tables[1].Columns[0].ToString();
        ddlCountry.DataBind();
        ddlCountry.Items.Add(new ListItem("--Select Country--", "0"));
        ddlCountry.SelectedValue = "0";
    }

    public void LoadDdlState()
    {
        ddlState.DataSource = DS.Tables[2];
        ddlState.DataTextField = DS.Tables[2].Columns["StateName"].ToString();
        ddlState.DataValueField = DS.Tables[2].Columns["StateId"].ToString();
        ddlState.DataBind();
        ddlState.Items.Add(new ListItem("--Select State--", "0"));
        ddlState.SelectedValue = "0";
    }

    public void LoadDdlJobDescription()
    {
        ddlJobDescription.DataSource = DS.Tables[3];
        ddlJobDescription.DataTextField = DS.Tables[3].Columns["JobDescription"].ToString();
        ddlJobDescription.DataValueField = DS.Tables[3].Columns["JobId"].ToString();
        ddlJobDescription.DataBind();
        ddlJobDescription.Items.Add(new ListItem("--Select Job Description--", "0"));
        ddlJobDescription.SelectedValue = "0";
    }

    public void LoadDdlWhereHeard()
    {

        //ddlWhereHeard.DataSource = DS.Tables[4];
        //ddlWhereHeard.DataTextField = DS.Tables[4].Columns["WhereHeard"].ToString();
        //ddlWhereHeard.DataValueField = DS.Tables[4].Columns["WhereHeardId"].ToString();
        //ddlWhereHeard.DataBind();
        //ddlWhereHeard.Items.Add(new ListItem("--Select Where you heard--", "0"));
        //ddlWhereHeard.SelectedValue = "0";
    }


    #endregion
}