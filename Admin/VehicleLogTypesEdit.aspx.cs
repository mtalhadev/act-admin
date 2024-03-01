
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

public partial class VehicleLogTypesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "VehicleLogTypesEdit.aspx?{0}", VehicleLogTypesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "VehicleLogTypesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "VehicleLogTypes.aspx");
		FormUtil.SetDefaultMode(FormView1, "VehicleLogTypeId");
	}
	protected void GridViewVehicleLogs1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleLogId={0}", GridViewVehicleLogs1.SelectedDataKey.Values[0]);
		Response.Redirect("VehicleLogsEdit.aspx?" + urlParams, true);		
	}	
}


