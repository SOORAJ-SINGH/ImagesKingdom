using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BusinessLayer.Admin;
using System.Web.Services;
using System.Text;
using System.Configuration;
using System.Net.Mail; ///to send mail

public partial class Login : System.Web.UI.Page
{
    #region "Variable Declaration"
    clsMember objMember = new clsMember();
    DataSet objDS;
    int userId;
    string status = "";
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            status = Request.QueryString["status"];
            if (status == "LoginFirst")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Login First!');</script>", false);
                //Response.Write("<script>alert('Login First!');</script>");
            }
            else
            {

            }

        }
    }

    #region "This method called through jQuery.Ajax for forgot password"
    [WebMethod]
    public static string SentPasswordToMail(string EmailId)
    {
        //genrate the random number which will be sent as password to EmailId
        string Combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        Random rand = new Random();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < 6; i++)
        {
            password.Append(Combination[rand.Next(Combination.Length)]);
        }


        //check email id exists on not
        clsMember objMemberForgot = new clsMember();
        objMemberForgot.Email_Id = EmailId;
        objMemberForgot.Password = password.ToString();
        string status = objMemberForgot.ForgotPassword();

        if (status == "UPDATED")
        {
            //SENTS THE PASSWORD TO EMAIL
            MailMessage mail = new MailMessage();
            var fromEmailAddress = ConfigurationManager.AppSettings["FromEmailAddress"].ToString();
            var fromEmailDisplayName = ConfigurationManager.AppSettings["FromEmailDisplayName"].ToString();
            var fromEmailPassword = ConfigurationManager.AppSettings["FromEmailPassword"].ToString();
            var smtpHost = ConfigurationManager.AppSettings["SMTPHost"].ToString();
            var smtpPort = ConfigurationManager.AppSettings["SMTPPort"].ToString();

            mail.To.Add(EmailId);
            //mail.To.Add(txt
            mail.From = new MailAddress(fromEmailAddress, fromEmailDisplayName, System.Text.Encoding.UTF8);
            mail.Subject = "[ImagesKingdom] - Password Change Request"; //"This mail is send from asp.net application";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "<h3>Dear Guest</h3>,Thanks for your interest in Image Kingdom. Your password for your account is" +
                password.ToString() + ".Please take time to visit our website to checkout latest new offers on new Images.Thanks,Team ImagesKingdom"; //"This is Email Body Text";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;

            //mail.Attachments = FileUploadAttachment.FileContent; 
            mail.Priority = MailPriority.High;

            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential(fromEmailAddress, fromEmailPassword);
            client.Port = Convert.ToInt32(smtpPort);
            client.Host = smtpHost;

            client.EnableSsl = true;
            try
            {
                client.Send(mail);
                return "sent";
                //Page.RegisterStartupScript("UserMsg", "<script>alert('Successfully Send...');if(alert){ window.location='SendMail.aspx';}</script>");
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
                return "notsent";
                //Page.RegisterStartupScript("UserMsg", "<script>alert('Sending Failed...');if(alert){ window.location='SendMail.aspx';}</script>");
            }
        }


        return "sucess";
        
    }
    #endregion

    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        objMember.Email_Id = txtEmailID.Text;
        objMember.LoginPassword = txtPassword.Text;

        userId = objMember.LoginCheckmethod();

        //Session["SessionUserID"] = userId;
        switch (userId)
        {
            case -1:
                lblMsg.Text = "Password is incorrect for Username.";
                break;
            case -2:
                lblMsg.Text = "Invalid Account(User does not exist)";
                break;
            default:
                Session["USER_NAME"] = txtEmailID.Text.ToString();
                Session["SessionUserID"] = userId;
                Response.Redirect("~/Default.aspx");
                //Response.Redirect("~/MemberLightBox.aspx");
                break;
        }
        
        
    }

    protected void btnForgot_click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>popUp('#divPopUp','Login First!');</script>", false);
                
    }
}