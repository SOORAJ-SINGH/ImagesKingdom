using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.Admin;
using System.Data.SqlClient;

public partial class AdminPanel_Default : System.Web.UI.Page
{

    #region Declare Variable
    private clsAdminLogin obj_clsAdminLogin = new clsAdminLogin();
    private SqlDataReader DR;
    #endregion


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        loginCheck();
    }

    #region "Methods/ Functions"
    protected void loginCheck() // Admin login Check
    {
        try
        {
            obj_clsAdminLogin.ADMIN_LOGIN_NAME = txtLoginID.Text.Trim();
            obj_clsAdminLogin.ADMIN_PASSWORD = txtPassword.Text.Trim();
            DR = obj_clsAdminLogin.ADMIN_LOGIN_CHECK();

            while (DR.Read())
            {
                if (!DR["LOGIN_NAME"].ToString().Equals(""))
                {
                    Session["LOGIN_NAME"] = DR["LOGIN_NAME"].ToString();

                }
               
            }

            if (Session["LOGIN_NAME"].ToString().Equals("") || Session["LOGIN_NAME"] == null)
            {
                lblWarning.Text = "<b>Invalid login, please try again..</b>";
            }
            else
            {
                Response.Redirect("AdminDashboard.aspx", false);
            }


        }
        catch (Exception ex)
        {
            lblWarning.Text = "Please try again...";
            lblWarning.Visible = true;
           // ErrorLog.LogError(ex);
        }
    }


    #endregion

    
}