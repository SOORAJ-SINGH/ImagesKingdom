using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLayer.Admin;
using System.Data;

public partial class MemberLightBox : System.Web.UI.Page
{
    #region variable
    private DataSet objDS;
    private clsGetInfo objGetInfo = new clsGetInfo();

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
                    FillLabelCountImages();
                }

            }
        }
        catch (Exception e1)
        {
            throw e1;
        }

        
    }

    private void FillLabelCountImages()
    {
        objGetInfo.MemberId = Convert.ToInt32( Session["SessionUserID"]);
        objDS = objGetInfo.GetLightBoxImages();
        lblCountImages.Text = objDS.Tables[0].Rows.Count.ToString();
    }
}