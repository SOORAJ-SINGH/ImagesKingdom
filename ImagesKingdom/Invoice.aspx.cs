using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLayer.Admin;
using System.Data;

public partial class Invoice : System.Web.UI.Page
{
    #region Variable Declaration
    protected clsOrder objOrder = new clsOrder();
    DataSet DS;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadDetails();
       
    }

    public void LoadDetails()
    {
        objOrder.MEMBER_ID =Convert.ToInt32( Session["SessionUserID"]);
        objOrder.ORDER_NO = Session["ORDER_NO"].ToString();
        DS = objOrder.DisplayOrderDetails();

        gvImageList.DataSource = DS;
        gvImageList.DataBind();
        gvImageList.Dispose();

        lblOrderBy.Text = DS.Tables[1].Rows[0]["NAME"].ToString();
        lblInvoiceNo.Text = Session["ORDER_NO"].ToString();
        lblInvoiceDate.Text = DS.Tables[0].Rows[0]["ORDER_DATE"].ToString();
        lblPaymentMode.Text = DS.Tables[0].Rows[0]["PAYMENT_MODE"].ToString();
        lblServiceTax.Text = DS.Tables[0].Rows[0]["SERVICE_TAX"].ToString(); 
        lblNetPayableAmt.Text = DS.Tables[0].Rows[0]["TOTAL_PRICE"].ToString();
        double T = Convert.ToDouble(DS.Tables[0].Rows[0]["TOTAL_PRICE"]) - Convert.ToDouble(DS.Tables[0].Rows[0]["SERVICE_TAX"]);
        lbltamount.Text = T.ToString();
        double DIS = Convert.ToDouble(DS.Tables[0].Rows[0]["DISCOUNT"]);
        lblDiscount.Text = DIS.ToString();
        lblTotal.Text = (T + DIS).ToString(); 
    }
    #region "Grid -Bind Image List"
    protected void FillGvImages()
    {
        //try
        //{
        //    DS = objImages.BindImageList();
        //    gvImageList.DataSource = DT;
        //    gvImageList.DataBind();
        //    lblCount.Text = DT.Rows.Count.ToString();
        //    gvImageList.Dispose();
        //}
        //catch (Exception ex)
        //{
        //    lblErrorMsg.Text = ex.ToString();
        //}
    }
    #endregion

}