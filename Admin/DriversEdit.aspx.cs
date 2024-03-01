
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

public partial class DriversEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "DriversEdit.aspx?{0}", DriversDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "DriversEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Drivers.aspx");
		FormUtil.SetDefaultMode(FormView1, "DriverId");
	}
	protected void GridViewDriverCredentials1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverCredentialId={0}", GridViewDriverCredentials1.SelectedDataKey.Values[0]);
		Response.Redirect("DriverCredentialsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewVehicleLogs2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleLogId={0}", GridViewVehicleLogs2.SelectedDataKey.Values[0]);
		Response.Redirect("VehicleLogsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewSchedule3_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleId={0}", GridViewSchedule3.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewDriverInfractions4_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverInfractionId={0}", GridViewDriverInfractions4.SelectedDataKey.Values[0]);
		Response.Redirect("DriverInfractionsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewDriverMedical5_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverMedicalId={0}", GridViewDriverMedical5.SelectedDataKey.Values[0]);
		Response.Redirect("DriverMedicalEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewDriverNotes6_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverNoteId={0}", GridViewDriverNotes6.SelectedDataKey.Values[0]);
		Response.Redirect("DriverNotesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewDriverCities7_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverCityId={0}", GridViewDriverCities7.SelectedDataKey.Values[0]);
		Response.Redirect("DriverCitiesEdit.aspx?" + urlParams, true);		
	}	
}


