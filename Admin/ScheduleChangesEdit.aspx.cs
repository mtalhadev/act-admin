
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

public partial class ScheduleChangesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "ScheduleChangesEdit.aspx?{0}", ScheduleChangesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "ScheduleChangesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "ScheduleChanges.aspx");
		FormUtil.SetDefaultMode(FormView1, "ScheduleChangeId");
	}
	protected void GridViewScheduleChangeUsers1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleChangeUsers={0}", GridViewScheduleChangeUsers1.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleChangeUsersEdit.aspx?" + urlParams, true);		
	}	
}


