
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

public partial class LocationsEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "LocationsEdit.aspx?{0}", LocationsDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "LocationsEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Locations.aspx");
		FormUtil.SetDefaultMode(FormView1, "LocationId");
	}
	protected void GridViewScheduleDropoffs1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleDropoffId={0}", GridViewScheduleDropoffs1.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleDropoffsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewRatePickups2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("RatePickupId={0}", GridViewRatePickups2.SelectedDataKey.Values[0]);
		Response.Redirect("RatePickupsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewSchedulePickups3_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("SchedulePickupId={0}", GridViewSchedulePickups3.SelectedDataKey.Values[0]);
		Response.Redirect("SchedulePickupsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewRateDropoffs4_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("RateDropoffId={0}", GridViewRateDropoffs4.SelectedDataKey.Values[0]);
		Response.Redirect("RateDropoffsEdit.aspx?" + urlParams, true);		
	}	
}


