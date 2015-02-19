using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer.Admin;
using System.Data;

public partial class UserControl_leftMenu : System.Web.UI.UserControl
{
    #region "VARIABLE DECLARATION"
    private clsCategory objCategory = new clsCategory();
    private DataSet objDS;
    private DataTable DT;
    #endregion "End VARIABLE DECLARATION"

    #region Page Laod
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRepeaterCollections();
        }
    }
    #endregion


    #region " Display Main Menu in Repeater Method"
    protected void BindRepeaterCollections()
    {
        try
        {
            objDS = objCategory.GetMainCategoryInfo();//BindLeftMenuMainCategory();
            CategoryNameRP.DataSource = objDS;
            CategoryNameRP.DataBind();
            CategoryNameRP.Dispose();   
         
            BindLeftMenuSubCategory();
        }
        catch (Exception ex)
        {

        }
    }

    private void BindLeftMenuSubCategory()
        {
            foreach (RepeaterItem li in CategoryNameRP.Items)
            {
                Repeater rptSub = (Repeater)li.FindControl("rptSubCat");
                Label lblid = (Label)li.FindControl("lblcatis");
                try
                {
                    objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(lblid.Text);
                    //DT = objCategory.DisplaySubitems();
                    objDS = objCategory.GetSubCategoryInfomMenu();
                    rptSub.DataSource = objDS;
                    rptSub.DataBind();
                    rptSub.Dispose();
                }
                catch (Exception ex)
                {

                }
            }
        }
     #endregion "End Display Menu Collection in Repeater Method"
       
    }




