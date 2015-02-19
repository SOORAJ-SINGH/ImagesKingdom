using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DataAccess;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer.Admin
{
    public class clsModify
    {

        #region Variable delcaration
        cDataAccess DataAccessObj;
        DataSet objDS;
        #endregion


        #region Properties
        public int MainCategoryId { set; get; }
        public int SubCategoryId { set; get; }
        public int ImageId { set; get; }
        public int Status { set; get; }
        public int MemberId { set; get; }

        public int ImageTypeId { set; get; }
        #endregion

        //constructor
        public clsModify()
        {
            DataAccessObj = new cDataAccess();
        }

      
        public DataSet deleteImageFromCart()
        {
            try
            {
                objDS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_IMAGE_CART",
                    new SqlParameter("@IMAGE_ID", ImageId),
                    new SqlParameter("@IMAGE_TYPE_ID", ImageTypeId),
                    new SqlParameter("@MEMBER_ID", MemberId),
                    new SqlParameter("CALL_TYPE", "DELETE"));

                return objDS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }


        public DataSet DeleteImage()
        {
            try
            {
                objDS = DataAccessObj.RunSPReturnDataSet("USP_IMAGE",
                    new SqlParameter("IMAGE_ID", ImageId),
                    new SqlParameter("CALL_TYPE", 1));

                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet DeleteImageType()
        {
            try
            {
                objDS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_IMAGE_TYPE",
                    new SqlParameter("@IMAGE_TYPE_ID", ImageTypeId),
                    new SqlParameter("@CALL_TYPE","DELETE"));

                return objDS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        public DataSet DeleteLightBoxImages()
        {
            try
            {
                objDS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_LIGHT_BOX",
                    new SqlParameter("@IMAGE_ID", ImageId),
                    new SqlParameter("@MEMBER_ID",MemberId),
                    new SqlParameter("@CALL_TYPE","DELETE"));
                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        





        #region "Change Status"
        

        public DataSet Change_iMAGEActive()
        {
            try
            {
                objDS = DataAccessObj.RunSPReturnDataSet("USP_IMAGE",
                    new SqlParameter("IMAGE_ID", ImageId),
                    new SqlParameter("CALL_TYPE", 2));

                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet Change_ImageTypeStatus()
        {
            try
            {
                objDS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_IMAGE_TYPE",
                    new SqlParameter("@IMAGE_TYPE_ID", ImageTypeId),
                    new SqlParameter("@CALL_TYPE", "CHANGE_STATUS"));
 
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
