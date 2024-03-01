
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

public partial class VehiclesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "VehiclesEdit.aspx?{0}", VehiclesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "VehiclesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Vehicles.aspx");
		FormUtil.SetDefaultMode(FormView1, "VehicleId");
	}
	protected void GridViewVehicleLogs1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleLogId={0}", GridViewVehicleLogs1.SelectedDataKey.Values[0]);
		Response.Redirect("VehicleLogsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewVehicleCities2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleCityId={0}", GridViewVehicleCities2.SelectedDataKey.Values[0]);
		Response.Redirect("VehicleCitiesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewSchedule3_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleId={0}", GridViewSchedule3.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleEdit.aspx?" + urlParams, true);		
	}	
}


