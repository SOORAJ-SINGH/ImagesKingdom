using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using System.Data.SqlClient;
using System.Data;

namespace BusinessLayer.Admin
{
    public class clsImages
    {
        #region "Variables Declaration"
        cDataAccess obj_cDataAccess;
        private DataSet DS;
        private SqlDataReader DR;
        private int RecordStatus;
        private DataTable DT;
        #endregion

        #region Constructor
        public clsImages()
        {
            obj_cDataAccess = new cDataAccess();
        }
        #endregion

        #region "Properties"
        public string IMAGE_TITLE { get; set; }
        public string IMAGE_CODE { get; set; }
        public string SMALL_PHOTO { get; set; }
        public string LARGE_PHOTO { get; set; }
        public int SUB_CATEGORY_ID { get; set; }
        public string KEYWORDS { get; set; }
        public string SMALL_FILE_EXTENSION { get; set; }
        public string LARGE_FILE_EXTENSION { get; set; }
        public int STATUS { get; set; }
        public int IMAGE_ID { get; set; }
        public int REFFERENCE_PHOTO_ID { get; set; }
        public string IMAGE_TYPE_NAME { get; set; }
        public int IMAGE_TYPE_ID { get; set; }
        public string Dimensions_Pixels { set; get; }
        public string Resolution { set; get; }
        public string Dimensions_Inches { set; get; }
        public int Image_Type_Status { set; get; }
        public int IMAGE_PRICE_ID { get; set; }
        public double Price { set; get; }
        public double Discount { set; get; }
        public decimal NetPrice { set; get; }
        public int MemberId { get; set; }
        #endregion

        #region "MANAGE Image Details"
        public DataSet ADD_NEW_IMAGE_INFORMATION()
        {
            DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_INFORMATION",
                 new SqlParameter("@CALL_TYPE", "ADD")
               , new SqlParameter("@IMAGE_TITLE", IMAGE_TITLE)
               , new SqlParameter("@IMAGE_CODE", IMAGE_CODE)
               , new SqlParameter("@SMALL_FILE_EXTENSION", SMALL_FILE_EXTENSION)
               , new SqlParameter("@LARGE_FILE_EXTENSION", LARGE_FILE_EXTENSION)
               , new SqlParameter("@SUB_CATEGORY_ID", SUB_CATEGORY_ID)
               , new SqlParameter("@KEYWORDS", KEYWORDS)
               , new SqlParameter("@STATUS", STATUS)

            );

            return DS;
        }

        public DataSet UPDATE_IMAGE_INFORMATION()
        {
            DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_INFORMATION",
                 new SqlParameter("@CALL_TYPE", "UPDATE")
               , new SqlParameter("@IMAGE_TITLE", IMAGE_TITLE)
               , new SqlParameter("@IMAGE_ID", IMAGE_ID)
               , new SqlParameter("@SUB_CATEGORY_ID", SUB_CATEGORY_ID)
               , new SqlParameter("@KEYWORDS", KEYWORDS)
               , new SqlParameter("@STATUS", STATUS)

            );

            return DS;
        }

        public DataTable DISPLAY_IMAGE_DATA()
        {
            try
            {
                DT = obj_cDataAccess.RunSPReturnDataTable("USP_MANAGE_IMAGE_INFORMATION",
                 new SqlParameter("@CALL_TYPE", "DISPLAY")
                );

                return DT;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        public DataTable BindImageList()
        {
            DT = obj_cDataAccess.RunSPReturnDataTable("USP_MANAGE_IMAGE_INFORMATION",
                 new SqlParameter("@CALL_TYPE", "DISPLAY")
                  );

            return DT;
        }

        public DataSet DeleteImageData()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_INFORMATION",
                    new SqlParameter("@IMAGE_ID", IMAGE_ID),
                    new SqlParameter("@CALL_TYPE", "DELETE"));
                return DS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        public DataSet ChangeImageStatus()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_INFORMATION",
                    new SqlParameter("@IMAGE_ID", IMAGE_ID),
                    new SqlParameter("@CALL_TYPE", "CHANGE_STATUS"));
                return DS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        #endregion


        #region "Manage Image Type"
        public DataSet ADD_NEW_IMAGE_TYPE()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_TYPE",
                     new SqlParameter("@CALL_TYPE", "ADD"),
                     new SqlParameter("@IMAGE_TYPE", IMAGE_TYPE_NAME),
                     new SqlParameter("@DIMENSIONS_PIXELS", Dimensions_Pixels),
                     new SqlParameter("@DIMENSIONS_INCHES", Dimensions_Inches),
                     new SqlParameter("@RESOLUTION", Resolution),
                     new SqlParameter("@IMAGE_TYPE_STATUS", Image_Type_Status)


                );

                return DS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        public DataTable DISPLAY_IMAGE_TYPE_LIST()
        {
            DT = obj_cDataAccess.RunSPReturnDataTable("USP_MANAGE_IMAGE_TYPE",
                 new SqlParameter("@CALL_TYPE", "DISPLAY")
            );

            return DT;
        }

        //delete the Image Type and Price related to Image Id
        public DataTable DeleteImageTypePrice()
        {
            try
            {
                DT = obj_cDataAccess.RunSPReturnDataTable("USP_IMAGE_PRICE",
                    new SqlParameter("@CallType", "DELETE"),
                    new SqlParameter("@IMAGE_PRICE_ID", IMAGE_PRICE_ID));
                return DT;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        //Update the Image Type...
        public DataTable UpdateImageTypeDetails()
        {
            try
            {
                DT = obj_cDataAccess.RunSPReturnDataTable("USP_MANAGE_IMAGE_TYPE",
                     new SqlParameter("@CALL_TYPE", "UPDATE"),
                     new SqlParameter("@IMAGE_TYPE_ID",IMAGE_TYPE_ID),
                     new SqlParameter("@IMAGE_TYPE", IMAGE_TYPE_NAME),
                     new SqlParameter("@DIMENSIONS_PIXELS", Dimensions_Pixels),
                     new SqlParameter("@DIMENSIONS_INCHES", Dimensions_Inches));
                return DT;
            }
            catch (Exception e1)
            {
                throw e1;
            }

        }

        //update the price details for particaular image  and its type
        public DataSet UpdateImagePriceDetails()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_IMAGE_PRICE",
                    new SqlParameter("@CallType", "UPDATE"),
                    new SqlParameter("@IMAGE_PRICE_ID", IMAGE_PRICE_ID),
                    new SqlParameter("@PRICE",Price),
                    new SqlParameter("@DISCOUNT",Discount),
                    new SqlParameter("@NET_PRICE",NetPrice));
                return DS;
            }
            catch (Exception ex1)
            {
                throw ex1;
            }
        }
        #endregion


        #region "To Add Price Details for particular  IMAGE TYPE of Image" 
        public DataSet AddPriceDetailsforImageType()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_IMAGE_PRICE",
                    new SqlParameter("@CallType", "ADD"),
                    new SqlParameter("@IMAGE_TYPE_ID",IMAGE_TYPE_ID),
                    new SqlParameter("@PRICE", Price),
                    new SqlParameter("@DISCOUNT", Discount),
                    new SqlParameter("@NET_PRICE", NetPrice),
                    new SqlParameter("@IMAGE_ID",IMAGE_ID));
                return DS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }
        #endregion

        //TO ADD IMAGE TO LIGHTBOX
        public DataSet AddImageToLightBox()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_LIGHT_BOX",
                    new SqlParameter("@IMAGE_ID",IMAGE_ID),
                    new SqlParameter("@MEMBER_ID", MemberId),
                    new SqlParameter("@CALL_TYPE", "ADD"));
                return DS;
            }
            catch (Exception e)
            {
                throw e;
            }

        }


        //TO ADD IMAGE IN IMAGE_CART TABLE
        public DataSet AddToImageCart()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_CART",
                    new SqlParameter("@IMAGE_ID",IMAGE_ID),
                    new SqlParameter("@IMAGE_TYPE_ID",IMAGE_TYPE_ID),
                    new SqlParameter("@MEMBER_ID", MemberId),
                    new SqlParameter("@CALL_TYPE", "ADD"));
                return DS;
            }
            catch (Exception e)
            {

                throw e;
            }
        }

        #region "Display For Editing Image"
        public DataSet Display_ImageForEdit()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_INFORMATION",
                    new SqlParameter("@CALL_TYPE", "EDIT_DISPLAY"),
                    new SqlParameter("@IMAGE_ID", IMAGE_ID));
                return DS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }
        #endregion

        #region "Add related images"
        public DataSet AddRelatedImages()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_RELATED_IMAGES",
                    new SqlParameter("@IMAGE_ID", IMAGE_ID),
                    new SqlParameter("@REFFERENCE_PHOTO_ID", REFFERENCE_PHOTO_ID),
                    new SqlParameter("@CALL_TYPE", "ADD"));

                return DS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }
        #endregion

        #region "Search Images on ImageTitle"
        public DataSet SearchImagesTitle()
        {
            try
            {
                DS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_IMAGE_INFORMATION",
                    new SqlParameter("@CALL_TYPE", "SEARCH"),
                    new SqlParameter("@IMAGE_TITLE", IMAGE_TITLE));

                return DS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }
        #endregion

        #region CountCartImages
        public string CountCartImages()
        {
            try
            {
                DT = obj_cDataAccess.RunSPReturnDataTable("USP_MANAGE_IMAGE_CART",
                    new SqlParameter("@MEMBER_ID", MemberId),
                    new SqlParameter("@CALL_TYPE","COUNT"));
                return DT.Rows[0][0].ToString();
            }
            catch (Exception e1)
            {
                throw e1;
            }

        }
        #endregion

    }
}
