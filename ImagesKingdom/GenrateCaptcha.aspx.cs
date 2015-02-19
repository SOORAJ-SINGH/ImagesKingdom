using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

public partial class GenrateCaptcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();

        int height = 50;
        int width = 150;

        Bitmap bm = new Bitmap(width,height);
        RectangleF rectf = new RectangleF(10, 5, 0, 0);
        Graphics graphic = Graphics.FromImage(bm);
        graphic.Clear(Color.Bisque);

        graphic.SmoothingMode = SmoothingMode.AntiAlias;
        graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
        graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;

        graphic.DrawString(Session["captcha"].ToString(), new Font("Thaoma", 22, FontStyle.Bold | FontStyle.Strikeout), Brushes.Green,rectf);
        graphic.DrawRectangle(new Pen(Color.Red), 1, 1, width - 2, height - 2);
        
        graphic.Flush();

        Response.ContentType = "image/jpeg";
        bm.Save(Response.OutputStream, ImageFormat.Jpeg);

        graphic.Dispose();
        bm.Dispose();
        

    }
}