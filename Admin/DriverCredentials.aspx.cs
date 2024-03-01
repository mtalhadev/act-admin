

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

public partial class DriverCredentials : System.Web.UI.Page
{	
    protected void Page_Load(object sender, EventArgs e)
	{
		FormUtil.RedirectAfterUpdate(GridView1, "DriverCredentials.aspx?page={0}");
		FormUtil.SetPageIndex(GridView1, "page");
		FormUtil.SetDefaultButton((Button)GridViewSearchPanel1.FindControl("cmdSearch"));
    }

	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverCredentialId={0}", GridView1.SelectedDataKey.Values[0]);
		Response.Redirect("DriverCredentialsEdit.aspx?" + urlParams, true);
	}
	




	
	[System.Web.Script.Services.ScriptMethod]
	[System.Web.Services.WebMethod]
	public static string GetPhotoContent(string contextKey)
	{        
		System.Int32 key;
		System.Int32.TryParse(contextKey, out key);
        
        SAFE.Entities.DriverCredentials content 
			= SAFE.Data.DataRepository.DriverCredentialsProvider.GetByDriverCredentialId(key);
        
        if (content.Photo == null)
            return "No Content Found!";


            string imageBase64 = Convert.ToBase64String(content.Photo);
            string imageSrc = string.Format("data:image/gif;base64,{0}", imageBase64);

            return string.Format("<div id='previewContent'><img src='{0}' /></div>", imageSrc);
               
            
             


	}


}





