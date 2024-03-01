
#region Imports...
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SAFE.Web.UI;
#endregion

public partial class LocationTypesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "LocationTypesEdit.aspx?{0}", LocationTypesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "LocationTypesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "LocationTypes.aspx");
		FormUtil.SetDefaultMode(FormView1, "LocationTypeId");
	}
	protected void GridViewLocations1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("LocationId={0}", GridViewLocations1.SelectedDataKey.Values[0]);
		Response.Redirect("LocationsEdit.aspx?" + urlParams, true);		
	}	
}


