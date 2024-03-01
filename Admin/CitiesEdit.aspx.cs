
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

public partial class CitiesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "CitiesEdit.aspx?{0}", CitiesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "CitiesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Cities.aspx");
		FormUtil.SetDefaultMode(FormView1, "CityId");
	}
	protected void GridViewVehicleCities1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("VehicleCityId={0}", GridViewVehicleCities1.SelectedDataKey.Values[0]);
		Response.Redirect("VehicleCitiesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewDriverCities2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverCityId={0}", GridViewDriverCities2.SelectedDataKey.Values[0]);
		Response.Redirect("DriverCitiesEdit.aspx?" + urlParams, true);		
	}	
}


