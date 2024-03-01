
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

public partial class ScheduleStatusesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "ScheduleStatusesEdit.aspx?{0}", ScheduleStatusesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "ScheduleStatusesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "ScheduleStatuses.aspx");
		FormUtil.SetDefaultMode(FormView1, "ScheduleStatusId");
	}
	protected void GridViewSchedule1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleId={0}", GridViewSchedule1.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleChanges2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleChangeId={0}", GridViewScheduleChanges2.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleChangesEdit.aspx?" + urlParams, true);		
	}	
}


