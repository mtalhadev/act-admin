
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

public partial class CompaniesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "CompaniesEdit.aspx?{0}", CompaniesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "CompaniesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Companies.aspx");
		FormUtil.SetDefaultMode(FormView1, "CompanyId");
	}
	protected void GridViewDriverInfractionTypes1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("InfractionTypeId={0}", GridViewDriverInfractionTypes1.SelectedDataKey.Values[0]);
		Response.Redirect("DriverInfractionTypesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewDrivers2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverId={0}", GridViewDrivers2.SelectedDataKey.Values[0]);
		Response.Redirect("DriversEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleNoteTypes3_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleNoteTypeId={0}", GridViewScheduleNoteTypes3.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleNoteTypesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewRates4_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("RateId={0}", GridViewRates4.SelectedDataKey.Values[0]);
		Response.Redirect("RatesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewDriverCredentialTypes5_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("CredentialTypeId={0}", GridViewDriverCredentialTypes5.SelectedDataKey.Values[0]);
		Response.Redirect("DriverCredentialTypesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewUserCompanyRoles6_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("UserCompanyRoleId={0}", GridViewUserCompanyRoles6.SelectedDataKey.Values[0]);
		Response.Redirect("UserCompanyRolesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewAirlines7_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("AirlineId={0}", GridViewAirlines7.SelectedDataKey.Values[0]);
		Response.Redirect("AirlinesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewLocationTypes8_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("LocationTypeId={0}", GridViewLocationTypes8.SelectedDataKey.Values[0]);
		Response.Redirect("LocationTypesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewHqCompanies9_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("HqCompanyId={0}", GridViewHqCompanies9.SelectedDataKey.Values[0]);
		Response.Redirect("HqCompaniesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewVehicles10_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleId={0}", GridViewVehicles10.SelectedDataKey.Values[0]);
		Response.Redirect("VehiclesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleTypes11_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleTypeId={0}", GridViewScheduleTypes11.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleTypesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewSchedule12_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleId={0}", GridViewSchedule12.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewUserRoles13_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("RoleId={0}", GridViewUserRoles13.SelectedDataKey.Values[0]);
		Response.Redirect("UserRolesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewCities14_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("CityId={0}", GridViewCities14.SelectedDataKey.Values[0]);
		Response.Redirect("CitiesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewVehicleLogTypes15_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleLogTypeId={0}", GridViewVehicleLogTypes15.SelectedDataKey.Values[0]);
		Response.Redirect("VehicleLogTypesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleStatuses16_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleStatusId={0}", GridViewScheduleStatuses16.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleStatusesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewLocations17_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("LocationId={0}", GridViewLocations17.SelectedDataKey.Values[0]);
		Response.Redirect("LocationsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleTransportationTypes18_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("TransportationTypeId={0}", GridViewScheduleTransportationTypes18.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleTransportationTypesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewVehicleStatuses19_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleStatusId={0}", GridViewVehicleStatuses19.SelectedDataKey.Values[0]);
		Response.Redirect("VehicleStatusesEdit.aspx?" + urlParams, true);		
	}	
}


