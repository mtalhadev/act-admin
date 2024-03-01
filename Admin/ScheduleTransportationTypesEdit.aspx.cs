
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

public partial class ScheduleTransportationTypesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "ScheduleTransportationTypesEdit.aspx?{0}", ScheduleTransportationTypesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "ScheduleTransportationTypesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "ScheduleTransportationTypes.aspx");
		FormUtil.SetDefaultMode(FormView1, "TransportationTypeId");
	}
	protected void GridViewSchedule1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleId={0}", GridViewSchedule1.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleEdit.aspx?" + urlParams, true);		
	}	
}


