using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLayer.Admin;
using System.Data;

public partial class AdminPanel_AddImageSize : System.Web.UI.Page
{

    #region variable Declaration
    clsImages objImages = new clsImages();

    clsGetInfo objGetInfo = new clsGetInfo();
    DataSet ObjDS;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!IsPostBack)
            {
                if (Session["NewImageId"] != null)
                {
                    LoadDdlImageTypeId();
                    LoadGvImageType();
                }
                else
                {
                    Response.Redirect("AddNewImageData.aspx?status=error");
                }

            }
        }
        catch (Exception e1)
        {
            throw e1;
        }

    }



    protected void btnSaveImageType_Click(object sender, EventArgs e)
    {
        objImages.IMAGE_TYPE_ID = Convert.ToInt32(ddlImageType.SelectedValue);
        //if (Session["NewImageId"] != null)
            objImages.IMAGE_ID = Convert.ToInt32(Session["NewImageId"]);

        objImages.Price = Convert.ToInt32(txtPrice.Text);
        objImages.Discount = Convert.ToInt32(txtDiscount.Text);
        objImages.NetPrice = Convert.ToInt32(txtNetPrice.Text);

        ObjDS = objImages.AddPriceDetailsforImageType();

        if (ObjDS.Tables.Count > 0)
        {
            LoadGvImageType();
            ClearFields();
            Response.Write("<script>alert('Data Added SUCESSFULL');</script>");

        }
        else
        {
            Response.Write("<script>alert('Data not Added SUCESSFULL');</script>");
        }
        ObjDS.Dispose();

    }

    //Oncommand Event of Acive/inactive on GridView
    public void Is_ActiveChange(object sender, CommandEventArgs e)
    {
        //objCategory.MAIN_CATEGORY_ID = Convert.ToInt32(e.CommandArgument);
        //objDS = objCategory.Change_MainCategoryStatus();
        //FillGvMainCategoryInfo();
    }
    public void LoadDdlImageTypeId()
    {
        ObjDS = objGetInfo.GetImageType();
        ddlImageType.DataSource = ObjDS;
        ddlImageType.DataTextField = ObjDS.Tables[0].Columns["IMAGE_TYPE"].ToString();
        ddlImageType.DataValueField = ObjDS.Tables[0].Columns["IMAGE_TYPE_ID"].ToString();
        ddlImageType.DataBind();
        ddlImageType.Items.Add(new ListItem("--Select Image Type--", "0"));
        ddlImageType.SelectedValue = "0";

    }

    public void LoadGvImageType()
    {
        ObjDS = objGetInfo.GetImageType();
        gvImageType.DataSource = ObjDS;
        gvImageType.DataBind();
        ObjDS.Dispose();

    }

    //clears the text filds after adding the data..
    private void ClearFields()
    {
        ddlImageType.SelectedValue = "0";
        txtDiscount.Text = ""; ;
        txtNetPrice.Text = ""; ;
        txtPrice.Text = "";
    }
}