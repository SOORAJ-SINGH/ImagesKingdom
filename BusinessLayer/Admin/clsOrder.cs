using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DataAccess;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer.Admin
{
    public class clsOrder
    {

        #region Variable delcaration
        cDataAccess DataAccessObj;
        DataSet objDS;
        #endregion

        #region constructor
        public clsOrder()
        {
            DataAccessObj = new cDataAccess();
        }
        #endregion

        #region "Properties"
        public int ORDER_ID { set; get; }
	    public int IMAGE_ID { set; get; }
	    public int IMAGE_TYPE_ID { set; get; }		
	    public int MEMBER_ID { set; get; }			
	    public string ORDER_NO	 { set; get; }		
	    public int ORDER_DETAILS_ID { set; get; }	
	    public DateTime ORDER_DATE { set; get; }	
	    public double TOTAL_PRICE { set; get; }		
	    public double DISCOUNT	 { set; get; }		
	    public double SERVICE_TAX { set; get; }		
	    public string PAYMENT_MODE	 { set; get; }
        public string CLIENT_DESIGNATED { set; get; }
        #endregion

        #region Methods/Functions"
        public DataSet AddOrder()
        {
            try
            {
                
                objDS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_ORDER1",
                    new SqlParameter("@IMAGE_ID", IMAGE_ID),
                    new SqlParameter("@IMAGE_TYPE_ID", IMAGE_TYPE_ID),
                    new SqlParameter("@ORDER_NO", ORDER_NO),
                    new SqlParameter("@MEMBER_ID", MEMBER_ID),
                    new SqlParameter("@ORDER_DATE", ORDER_DATE),
                    new SqlParameter("@TOTAL_PRICE", TOTAL_PRICE),
                    new SqlParameter("@DISCOUNT", DISCOUNT),
                    new SqlParameter("@SERVICE_TAX", SERVICE_TAX),
                    new SqlParameter("@PAYMENT_MODE", PAYMENT_MODE),
                    new SqlParameter("@CLIENT_DESIGNATED", CLIENT_DESIGNATED),
                    new SqlParameter("@CALL_TYPE", "ADD"));

                return objDS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        public DataSet DisplayOrderDetails()
        {
            try
            {

                objDS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_ORDER1",
                    new SqlParameter("@ORDER_NO", ORDER_NO),
                    new SqlParameter("@MEMBER_ID", MEMBER_ID),
                    new SqlParameter("@CALL_TYPE", "DISPLAY"));

                return objDS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }
        #endregion

    }
}
