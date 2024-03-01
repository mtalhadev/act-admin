

#region Using directives
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SAFE.Web.UI;
#endregion

public partial class Drivers : System.Web.UI.Page
{	
    protected void Page_Load(object sender, EventArgs e)
	{
		FormUtil.RedirectAfterUpdate(GridView1, "Drivers.aspx?page={0}");
		FormUtil.SetPageIndex(GridView1, "page");
		FormUtil.SetDefaultButton((Button)GridViewSearchPanel1.FindControl("cmdSearch"));
    }

	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverId={0}", GridView1.SelectedDataKey.Values[0]);
		Response.Redirect("DriversEdit.aspx?" + urlParams, true);
	}
	




	
	[System.Web.Script.Services.ScriptMethod]
	[System.Web.Services.WebMethod]
	public static string GetDriverPhotoContent(string contextKey)
	{        
		System.Int32 key;
		System.Int32.TryParse(contextKey, out key);
        
        SAFE.Entities.Drivers content 
			= SAFE.Data.DataRepository.DriversProvider.GetByDriverId(key);
        
        if (content.DriverPhoto == null)
            return "No Content Found!";


            string imageBase64 = Convert.ToBase64String(content.DriverPhoto);
            string imageSrc = string.Format("data:image/gif;base64,{0}", imageBase64);

            return string.Format("<div id='previewContent'><img src='{0}' /></div>", imageSrc);
               
            
             


	}
	
	[System.Web.Script.Services.ScriptMethod]
	[System.Web.Services.WebMethod]
	public static string GetLicensePhotoContent(string contextKey)
	{        
		System.Int32 key;
		System.Int32.TryParse(contextKey, out key);
        
        SAFE.Entities.Drivers content 
			= SAFE.Data.DataRepository.DriversProvider.GetByDriverId(key);
        
        if (content.LicensePhoto == null)
            return "No Content Found!";


            string imageBase64 = Convert.ToBase64String(content.LicensePhoto);
            string imageSrc = string.Format("data:image/gif;base64,{0}", imageBase64);

            return string.Format("<div id='previewContent'><img src='{0}' /></div>", imageSrc);
               
            
             


	}


}





