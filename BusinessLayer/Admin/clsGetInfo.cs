using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;
using DataAccess;
namespace BusinessLayer.Admin
{
    public class clsGetInfo
    {
        #region variable
        DataSet objDS;
        cDataAccess objDataAccess;
        string TRU = "TRUE";
        #endregion

        #region Constructor
        public clsGetInfo()
        {
            objDataAccess = new cDataAccess();
        }
        #endregion

        #region properties
        public int UserId { set; get; }
        public string ImageCode { set; get; }
        public int MainCategoryId { set; get; }
        public int SubCategoryId { set; get; }
        public int MemberId { set; get; }
        public int ImageId { set; get; }
        public int ImageTypeId { set; get; }

        #endregion



        #region Method/Function
        //TO GET USER INFO FOR BILLING
        public DataSet GetUserInfo()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_MEMBERS_PROCESS",
                    new SqlParameter("@CALL_TYPE","DISPLAY"),
                    new SqlParameter("@USER_ID", UserId));
                return objDS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        //TO DISPLAY THE IMAGES FROM IMAGE CART
        public DataSet GetImageCartInfo()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_CART",
                    new SqlParameter("@MEMBER_ID",MemberId),
                    new SqlParameter("@CALL_TYPE","DISPLAY"));
                return objDS;
            }
            catch(Exception e)
            { throw e; }
        }

        ////TO DISPLAY TOTAL PRICE AND DISCOUNT OF IMAGES IN CART
        //public DataSet GetTotalPriceDiscount()
        //{
        //    try
        //    {
        //        objDS = objDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_CART",
        //            new SqlParameter("@MEMBER_ID", MemberId),
        //            new SqlParameter("@CALL_TYPE", "DISPLAY_TOTAL_PRICE_AND_DISCOUNT"));
        //        return objDS;
        //    }
        //    catch (Exception e)
        //    { throw e; }
        //}


        public DataSet GetImageSizePrice()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_IMAGE_SIZE",
                    new SqlParameter("@IMAGE_ID",ImageId),
                    new SqlParameter("@CALL_TYPE","DISPLAY"));
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }

        }
        public DataSet GetInfoForDdl()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_GET_INFO_DDL",
                new SqlParameter("@CALL_BUSINESS", TRU),
                new SqlParameter("@CALL_COUNTRY", "TRUE"),
                new SqlParameter("@CALL_STATE", "TRUE"),
                new SqlParameter("@CALL_JOB", "TRUE"),
                new SqlParameter("@CALL_WHERE", "TRUE")
                );
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public DataSet GetImagesInfo()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_GET_IMAGES");
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet GetImageType()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_IMAGE_PRICE",
                    new SqlParameter("@CallType", "LOAD"));
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet GetImageTypeInfo()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_IMAGE_PRICE",
                    new SqlParameter("@CallType", "DISPLAY"));
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet GetMainCategoryInfo()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_MANAGE_MAIN_CATEGORY",
                    new SqlParameter("@CALL_TYPE", "DISPLAY"));
                return objDS;

            }

            catch (Exception e)
            {
                throw e;
            }

        }

        public DataSet GetSubCategoryInfo()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_MANAGE_SUB_CATEGORY",
                    new SqlParameter("@CALL_TYPE", "DISPLAY"));
                return objDS;

            }

            catch (Exception e1)
            {
                throw e1;
            }

        }

        public DataSet GetStatusInfo()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_GET_STATUS_INFO");
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }

        }

        
        public DataSet GetUserName()
        {

            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_GET_USERNAME",
                     new SqlParameter("@LOGIN_ID", UserId));
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        
        public DataSet GetImageSearchResult()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_SEARCH_IMAGE",
                    new SqlParameter("@ImageCode", ImageCode),
                    new SqlParameter("@MainCategoryId", MainCategoryId),
                    new SqlParameter("@SubCategoryId", SubCategoryId));
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }

        }

        public DataSet GetLightBoxImages()
        {
            try
            {
                objDS = objDataAccess.RunSPReturnDataSet("USP_MANAGE_LIGHT_BOX",
                    new SqlParameter("@CALL_TYPE", "DISPLAY"),
                    new SqlParameter("@MEMBER_ID", MemberId));
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        #endregion

    }
}
