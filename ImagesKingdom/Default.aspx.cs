using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.IO; // to delete the file
using System.Web.Services;

using System.Configuration;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //this method is called through jquery AJAX....................to retrive the image Code
    [WebMethod]
    public static string[] GetImageCode(string keyword)
    {
        List<string> ImageCode = new List<string>();
        string query = string.Format("select IMAGE_TITLE from TBL_IMAGES_INFORMATION where IMAGE_TITLE LIKE '%{0}%'", keyword);

        using (SqlConnection con =
                new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ImageCode.Add(reader.GetString(0));
                }
            }
        }

        return ImageCode.ToArray();
    }

}