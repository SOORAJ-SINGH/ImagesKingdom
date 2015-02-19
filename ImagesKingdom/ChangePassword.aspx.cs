using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.Admin;

public partial class ChangePassword : System.Web.UI.Page
{
    #region VARIABLE
    clsMember objMember = new clsMember();
    
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

                    
                }
            }
        }
        catch (Exception e1)
        { throw e1; }
    }
    protected void btnChangePwd_Click(object sender, ImageClickEventArgs e)
    {
        objMember.OldPassword = txtOldPass.Text;

        if (txtNewPass.Text == txtCNewPass.Text)
        {
            objMember.NewPassword = txtCNewPass.Text;
            objMember.MemberId = Convert.ToInt32(Session["SessionUserID"]);

            string status = objMember.ChangePassword();
            if (status == "changed")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Password Updated Sucessfully');</script>", false);
            }
            else if (status == "not_changed")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Old Password Not Matched');</script>", false);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','New Password not Matched');</script>", false);
            
        }
        
        
    }
}