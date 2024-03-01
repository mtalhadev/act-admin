
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

public partial class ScheduleEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "ScheduleEdit.aspx?{0}", ScheduleDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "ScheduleEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Schedule.aspx");
		FormUtil.SetDefaultMode(FormView1, "ScheduleId");
	}
	protected void GridViewScheduleNotes1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleNoteId={0}", GridViewScheduleNotes1.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleNotesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleDropoffs2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleDropoffId={0}", GridViewScheduleDropoffs2.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleDropoffsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleUsers3_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleUserId={0}", GridViewScheduleUsers3.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleUsersEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleChanges4_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleChangeId={0}", GridViewScheduleChanges4.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleChangesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewSchedulePickups5_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("SchedulePickupId={0}", GridViewSchedulePickups5.SelectedDataKey.Values[0]);
		Response.Redirect("SchedulePickupsEdit.aspx?" + urlParams, true);		
	}	
}


