using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using BusinessLayer.Admin;
using System.Text;
using System.Web.Services;

public partial class newReg : System.Web.UI.Page
{
    #region variable Declaration
    clsGetInfo objGetInfo = new clsGetInfo();
    clsMember objMemberAddNew = new clsMember();
    DataSet DS;
    #endregion

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DS = objGetInfo.GetInfoForDdl();
            LoadDdlBusiness();
            LoadDdlCountry();
            LoadDdlJobDescription();
            LoadDdlState();
            LoadDdlWhereHeard();

            FillCaptcha();
        }
    }

    #region "This method called through jQuery.Ajax"
    [WebMethod]
    public static string GetEmail(string emailID)
    {
        string isEmailExist= null;
        clsMember objlogin = new clsMember();
        objlogin.Email_Id = emailID;
        isEmailExist =   objlogin.CheckEmailId();
        if (isEmailExist == emailID)
            return "exist";
        else
            return "notexist";
    }
    #endregion

    protected void imgBtnRegister_Click(object sender, ImageClickEventArgs e)
    {
        objMemberAddNew.Email_Id = txtEmailAddress.Text;
        objMemberAddNew.Password = txtPassword.Text;
        objMemberAddNew.FirstName = txtFirstName.Text;
        objMemberAddNew.LastName = txtLastName.Text;
        objMemberAddNew.CompanyName = txtCompanyName.Text;
        objMemberAddNew.JobDescription = Convert.ToInt32(ddlJobDescription.SelectedValue);
        objMemberAddNew.BusinessType = Convert.ToInt32(ddlBusinessType.SelectedValue);
        objMemberAddNew.Country = Convert.ToInt32(ddlCountry.SelectedValue);
        objMemberAddNew.Address = txtAddress.Text;
        objMemberAddNew.State = Convert.ToInt32(ddlState.SelectedValue);
        objMemberAddNew.Zip = txtZipPinCode.Text;
        objMemberAddNew.Mobile = txtMobileNumber.Text;
        objMemberAddNew.Phone = txtPhoneNumber.Text;
        objMemberAddNew.WhereHeard = Convert.ToInt32(ddlWhereHeard.SelectedValue);

        if (Session["Captcha"].ToString() == txtCaptach.Text)
        {
            try
            {
                DS = objMemberAddNew.Add_New_User();
                if (DS.Tables.Count > 0)
                {
                    if (DS.Tables[0].Rows[0][0].ToString() == "INSERTED")
                    {
                        Response.Write("<script>alert('Added Sucessfully');</script>");
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Login First!');</script>", false);
                    }
                    else 
                    {
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Login First!');</script>", false);
                    }
                } 
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }
        else
        {
            Response.Write("<script>alert('Wrong Captcha Code!');</script>");
            //Response.Redirect("newReg.aspx");
        }
    }


    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCaptcha();
    }
    #endregion


    #region Methods/Function
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

        ddlWhereHeard.DataSource = DS.Tables[4];
        ddlWhereHeard.DataTextField = DS.Tables[4].Columns["WhereHeard"].ToString();
        ddlWhereHeard.DataValueField = DS.Tables[4].Columns["WhereHeardId"].ToString();
        ddlWhereHeard.DataBind();
        ddlWhereHeard.Items.Add(new ListItem("--Select Where you heard--", "0"));
        ddlWhereHeard.SelectedValue = "0";
    }

    public void FillCaptcha()
    {
        try
        {
            string Combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            Random rand = new Random();
            StringBuilder captcha = new StringBuilder();

            for (int i = 0; i < 6; i++)
            {
                captcha.Append(Combination[rand.Next(Combination.Length)]);
            }

            Session["Captcha"] = captcha.ToString();
            imgCaptcha.ImageUrl = "GenrateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
        }
        catch (Exception e)
        {
            throw;
        }
    }
    #endregion

    
}