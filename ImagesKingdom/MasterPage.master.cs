using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BusinessLayer.Admin;

public partial class MasterPage : System.Web.UI.MasterPage
{
    #region "Variable Declaration"
    clsImages objclsImage = new clsImages();
    DataSet objDS = new DataSet();
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Convert.ToInt32(Session["SessionUserID"]) == 0 || Session["SessionUserID"] == null)
                {
                    lblLogin_Logout.Text = "Login";
                    lnlLogin_LogOut.HRef = "Login.aspx";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>hideCartCount();</script>", false);
                    
                    //Response.Redirect("Login.aspx?status=LoginFirst");
                }
                else
                {
                    lblLogin_Logout.Text = "Logout";
                    lnlLogin_LogOut.HRef = "Logout.aspx";
                    objclsImage.MemberId = Convert.ToInt32( Session["SessionUserID"]);
                    lblCartCount.Text = objclsImage.CountCartImages();

                }

            }
        }
        catch (Exception e1)
        {
            throw e1;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string url = "ImageResult.aspx?text=" + txtSearch.Text;
        Response.Redirect(url);
        //objclsImage.IMAGE_TITLE = txtSearch.Text;
        //objDS = objclsImage.SearchImagesTitle();
    }
}
