using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DataAccess;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer.Admin
{
    public class clsMember
    {

        #region Variable delcaration
        cDataAccess DataAccessObj;
        int i;
        DataSet DS;
        DataTable DT;
        #endregion

        #region properties
        //public string EmailID { set; get; }
        public string LoginPassword { set; get; }

        public string MainCategory { set; get; }
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }
        public int MemberId { get; set; }

        //for adding the New User
        public string Email_Id { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int JobDescription { get; set; }
        public string CompanyName { get; set; }
        public int BusinessType { get; set; }
        public int Country { get; set; }
        public string Address { get; set; }
        public int State { get; set; }
        public string Zip { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public int WhereHeard { get; set; }
        public string Other { get; set; }
        #endregion

        #region constructor
        public clsMember()
        {
            DataAccessObj = new cDataAccess();
        }
        #endregion


        #region AddNewUser/Registration
        public DataSet Add_New_User()
        {
            try
            {
                DS = DataAccessObj.RunSPReturnDataSet("USP_MEMBERS_PROCESS",
                    new SqlParameter("@CALL_TYPE", "ADD"),
                    new SqlParameter("@EMAIL_ID", Email_Id),
                    new SqlParameter("@PASSWORD", Password),
                    new SqlParameter("@FIRST_NAME", FirstName),
                    new SqlParameter("@LAST_NAME", LastName),
                    new SqlParameter("@JOB_DESCRIPTION", JobDescription),
                    new SqlParameter("@COMPANY_NAME", CompanyName),
                    new SqlParameter("@BUSINESS_TYPE", BusinessType),
                    new SqlParameter("@COUNTRY", Country),
                    new SqlParameter("@ADDRESS", Address),
                    new SqlParameter("@STATE", State),
                    new SqlParameter("@ZIP", Zip),
                    new SqlParameter("@PHONE", Phone),
                    new SqlParameter("@MOBILE", Mobile),
                    new SqlParameter("@WHERE_HERE_US", WhereHeard),
                    new SqlParameter("@OTHER", Other)
                    );
                return DS;
            }
            catch (Exception e)
            {
                return DS;

            }

        }
        #endregion

        #region Update User Details
        public DataSet Update_UserDetails()
        {
            try
            {
                DS = DataAccessObj.RunSPReturnDataSet("USP_MEMBERS_PROCESS",
                    new SqlParameter("@CALL_TYPE", "UPDATE"),
                    new SqlParameter("@USER_ID", MemberId),
                    new SqlParameter("@FIRST_NAME", FirstName),
                    new SqlParameter("@LAST_NAME", LastName),
                    new SqlParameter("@JOB_DESCRIPTION", JobDescription),
                    new SqlParameter("@COMPANY_NAME", CompanyName),
                    new SqlParameter("@BUSINESS_TYPE", BusinessType),
                    new SqlParameter("@COUNTRY", Country),
                    new SqlParameter("@ADDRESS", Address),
                    new SqlParameter("@STATE", State),
                    new SqlParameter("@ZIP", Zip),
                    new SqlParameter("@PHONE", Phone),
                    new SqlParameter("@MOBILE", Mobile)
                    );
                return DS;
            }
            catch (Exception e)
            {
                return DS;

            }

        }
        #endregion


        #region LoginCheck
        public int LoginCheckmethod()
        {
            try
            {

                DS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_USER",
                    new SqlParameter("@EMAIL_ID", Email_Id),
                    new SqlParameter("@PASSWORD", LoginPassword),
                    new SqlParameter("@CALL_TYPE", "CHECK"));
                i = Convert.ToInt32(DS.Tables[0].Rows[0][0]);
                return i;

            }
            catch (Exception e)
            {
                return i;

            }

        }
        #endregion

        #region "CheckUserEmailExist"
        public string CheckEmailId()
        {
            try
            {
                DS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_USER",
                    new SqlParameter("@EMAIL_ID", Email_Id),
                    new SqlParameter("@CALL_TYPE", "EXIST"));
                if (DS.Tables[0].Rows.Count > 0)
                    return DS.Tables[0].Rows[0][0].ToString();
                else
                    return "null";
            }
            catch (Exception e1)
            {
                throw e1;
            }
        }
        #endregion


        #region "Change The Password"
        public string ChangePassword()
            {
                try
                {
                    DS = DataAccessObj.RunSPReturnDataSet("USP_MANAGE_USER",
                        new SqlParameter("@OLD_PASSWORD", OldPassword),
                        new SqlParameter("@NEW_PASSWORD", NewPassword),
                        new SqlParameter("@MEMBER_ID", MemberId),
                        new SqlParameter("@CALL_TYPE", "CHANGE_PASS"));

                    return DS.Tables[0].Rows[0][0].ToString();
                }
                catch (Exception e1)
                {
                    throw e1;
                }
            }

        #endregion

        #region ForgotPassword:Checks the emailid exists
        public string ForgotPassword()
        {
            try
            {
                DT = DataAccessObj.RunSPReturnDataTable("USP_MEMBERS_PROCESS",
                    new SqlParameter("@CALL_TYPE", "FORGOT"),
                    new SqlParameter("@PASSWORD", Password),
                    new SqlParameter("@EMAIL_ID", Email_Id));
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

