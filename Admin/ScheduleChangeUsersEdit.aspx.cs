
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

public partial class ScheduleChangeUsersEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "ScheduleChangeUsersEdit.aspx?{0}", ScheduleChangeUsersDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "ScheduleChangeUsersEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "ScheduleChangeUsers.aspx");
		FormUtil.SetDefaultMode(FormView1, "ScheduleChangeUsers");
	}
}


