
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

public partial class VehicleStatusesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "VehicleStatusesEdit.aspx?{0}", VehicleStatusesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "VehicleStatusesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "VehicleStatuses.aspx");
		FormUtil.SetDefaultMode(FormView1, "VehicleStatusId");
	}
	protected void GridViewVehicles1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleId={0}", GridViewVehicles1.SelectedDataKey.Values[0]);
		Response.Redirect("VehiclesEdit.aspx?" + urlParams, true);		
	}	
}


