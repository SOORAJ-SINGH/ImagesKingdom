using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using System.Data.SqlClient;
using System.Data;


namespace BusinessLayer.Admin
{
    public class clsCategory
    {
        #region "Variables Declaration"
        cDataAccess obj_cDataAccess;
        private DataSet objDS;
        private DataTable objDT;
        #endregion

        #region Constructor
        public clsCategory()
        {
            obj_cDataAccess = new cDataAccess();
        }
        #endregion

        #region "Properties"
        public string MAIN_CATEGORY_NAME { get; set; }
        public int MAIN_CATEGORY_ID { get; set; }
        public int SUB_CATEGORY_ID { get; set; }
        public string SUB_CATEGORY_NAME { get; set; }

        public int STATUS { get; set; }
        #endregion

        //Manage  Main Category
        #region "Manage Main Category"
        public DataSet AddMainCategory()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_MAIN_CATEGORY",
                 new SqlParameter("@CALL_TYPE", "ADD")
               , new SqlParameter("@MAIN_CATEGORY_NAME", MAIN_CATEGORY_NAME)
               , new SqlParameter("@STATUS", STATUS)
            );

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
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_MAIN_CATEGORY",
                    new SqlParameter("@CALL_TYPE", "DISPLAY"));
                return objDS;

            }

            catch (Exception e1)
            {
                throw e1;
            }

        }

        public DataSet DeleteMainCategory()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_MAIN_CATEGORY",
                    new SqlParameter("MAIN_CATEGORY_ID", MAIN_CATEGORY_ID),
                    new SqlParameter("CALL_TYPE", "DELETE"));

                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet Change_MainCategoryStatus()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_MAIN_CATEGORY",
                    new SqlParameter("MAIN_CATEGORY_ID", MAIN_CATEGORY_ID),
                    new SqlParameter("CALL_TYPE", "CHANGE_STATUS"));

                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet UpdateMainCategory()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_MAIN_CATEGORY",
                    new SqlParameter("@MAIN_CATEGORY_ID", MAIN_CATEGORY_ID),
                    new SqlParameter("@MAIN_CATEGORY_NAME", MAIN_CATEGORY_NAME),
                    new SqlParameter("@CALL_TYPE", "UPDATE"));

                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        #endregion



        //Manage Sub Category
        #region "Manage Sub Category"
        public DataSet AddSubCategory()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_SUB_CATEGORY",
                    new SqlParameter("@SUB_CATEGORY_NAME", SUB_CATEGORY_NAME),
                    new SqlParameter("@MAIN_CATEGORY_ID", MAIN_CATEGORY_ID),
                    new SqlParameter("@STATUS", STATUS),
                    new SqlParameter("@CALL_TYPE", "ADD"));
                return objDS;
            }
            catch (Exception e1)
            {
                throw e1;
            }

        }


        public DataSet GetSubCategoryInfo()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_SUB_CATEGORY",
                    new SqlParameter("@CALL_TYPE", "DISPLAY"));
                return objDS;

            }

            catch (Exception e1)
            {
                throw e1;
            }

        }

        //GET RESULT FOR LEFT MENU
        public DataSet GetSubCategoryInfomMenu()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_SUB_CATEGORY",
                    new SqlParameter("@MAIN_CATEGORY_ID", MAIN_CATEGORY_ID),
                    new SqlParameter("@CALL_TYPE", "DISPLAY_MENU"));
                return objDS;

            }

            catch (Exception e1)
            {
                throw e1;
            }

        }

        //Get Subcategory for Main Category
        public DataSet GetSubCategoryforMainCateID()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_SUB_CATEGORY",
                    new SqlParameter("@MAIN_CATEGORY_ID", MAIN_CATEGORY_ID),
                    new SqlParameter("@CALL_TYPE", "DISPLAY_ONLY"));
                return objDS;

            }

            catch (Exception e1)
            {
                throw e1;
            }

        }
        public DataSet DeleteSubCategory()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_SUB_CATEGORY",
                    new SqlParameter("SUB_CATEGORY_ID", SUB_CATEGORY_ID),
                    new SqlParameter("MAIN_CATEGORY_ID", MAIN_CATEGORY_ID),
                    new SqlParameter("CALL_TYPE", "DELETE"));

                return objDS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }


        public DataSet Change_SubCategoryStatus()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_SUB_CATEGORY",
                    new SqlParameter("@SUB_CATEGORY_ID", SUB_CATEGORY_ID),
                    new SqlParameter("@CALL_TYPE", "CHANGE_STATUS"));

                return objDS;
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }

        public DataSet UpdateSubCategory()
        {
            try
            {
                objDS = obj_cDataAccess.RunSPReturnDataSet("USP_MANAGE_SUB_CATEGORY",
                    new SqlParameter("@SUB_CATEGORY_ID", SUB_CATEGORY_ID),
                    new SqlParameter("@SUB_CATEGORY_NAME", SUB_CATEGORY_NAME),
                    new SqlParameter("@MAIN_CATEGORY_ID", MAIN_CATEGORY_ID),
                    new SqlParameter("@CALL_TYPE", "UPDATE"));

                return objDS;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        #endregion














        #region "Display left Menu-- Main Category / Sub Category "
        public DataTable BindLeftMenuMainCategory()
        {
            objDT = obj_cDataAccess.RunSPReturnDataTable("USP_MANAGE_MAIN_CATEGORY",
                 new SqlParameter("@CALL_TYPE", "DISPLAY_MENU")
                  );

            return objDT;
        }
        #endregion

        #region "Display Sub-Items"
        public DataTable DisplaySubitems()
        {
            try
            {
                objDT = obj_cDataAccess.RunSPReturnDataTable("USP_MANAGE_SUB_CATEGORY"
                     , new SqlParameter("@MAIN_CATEGORY_ID", MAIN_CATEGORY_ID)
                     , new SqlParameter("@CALL_TYPE", "DISPLAY_MENU")
                    );

            }
            catch (Exception ex)
            {

            }
            return objDT;
        }
        #endregion


    }   
    
}
