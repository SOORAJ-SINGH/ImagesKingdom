using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using System.Data.SqlClient;
using System.Data;

namespace BusinessLayer.Admin
{
 
   public class clsAdminLogin
    {
       #region "Variables Declaration"
        cDataAccess obj_cDataAccess;
        private DataSet DS;
        private SqlDataReader DR;
        private int RecordStatus;
        #endregion
       
       #region Constructor
        public clsAdminLogin()
        {
            obj_cDataAccess = new cDataAccess();            
        }
        #endregion

       #region "Properties"
        public string ADMIN_LOGIN_NAME { get; set; }
        
        public string ADMIN_PASSWORD { get; set; }

        //for adding the New User
        //public string Email_Id { get; set; }
        //public string Password { get; set; }
        //public string FirstName { get; set; }
        //public string LastName { get; set; }
        //public int JobDescription { get; set; }
        //public string CompanyName { get; set; }
        //public int BusinessType { get; set; }
        //public int Country { get; set; }
        //public string Address { get; set; }
        //public int State { get; set; }
        //public string Zip { get; set; }
        //public string Phone { get; set; }
        //public string Mobile { get; set; }
        //public int WhereHeard { get; set; }
        //public string Other { get; set; }
        // public string 

        #endregion
       
       #region "ADMIN LOGIN CHECK"
        public SqlDataReader ADMIN_LOGIN_CHECK()
        {
            DR = obj_cDataAccess.RunSPReturnDR("SP_ADMIN_INFO",
                 new SqlParameter("@CALL_TYPE", 2)
               , new SqlParameter("@LOGIN_NAME", ADMIN_LOGIN_NAME)
               , new SqlParameter("@LOGIN_PASSWORD", ADMIN_PASSWORD)

            );

            return DR;
        }
        #endregion

        //#region AddNewUser/Registration
        //public DataSet Add_New_User()
        //{
        //    try
        //    {
        //        DS = obj_cDataAccess.RunSPReturnDataSet("USP_MEMBERS_PROCESS",
        //            new SqlParameter("@CALL_TYPE","ADD"),
        //            new SqlParameter("@EMAIL_ID", Email_Id),
        //            new SqlParameter("@PASSWORD", Password),
        //            new SqlParameter("@FIRST_NAME", FirstName),
        //            new SqlParameter("@LAST_NAME", LastName),
        //            new SqlParameter("@JOB_DESCRIPTION", JobDescription),
        //            new SqlParameter("@COMPANY_NAME", CompanyName),
        //            new SqlParameter("@BUSINESS_TYPE", BusinessType),
        //            new SqlParameter("@COUNTRY", Country),
        //            new SqlParameter("@ADDRESS", Address),
        //            new SqlParameter("@STATE", State),
        //            new SqlParameter("@ZIP", Zip),
        //            new SqlParameter("@PHONE", Phone),
        //            new SqlParameter("@MOBILE", Mobile),
        //            new SqlParameter("@WHERE_HERE_US", WhereHeard),
        //            new SqlParameter("@OTHER", Other)
        //            );
        //        return DS;
        //    }
        //    catch (Exception e)
        //    {
        //        return DS;

        //    }

        //}
        //#endregion


    }

}
