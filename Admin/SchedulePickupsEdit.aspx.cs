
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

public partial class SchedulePickupsEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "SchedulePickupsEdit.aspx?{0}", SchedulePickupsDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "SchedulePickupsEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "SchedulePickups.aspx");
		FormUtil.SetDefaultMode(FormView1, "SchedulePickupId");
	}
}


