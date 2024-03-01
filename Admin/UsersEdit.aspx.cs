
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

public partial class UsersEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "UsersEdit.aspx?{0}", UsersDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "UsersEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Users.aspx");
		FormUtil.SetDefaultMode(FormView1, "UserId");
	}
	protected void GridViewUserCompanyRoles1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("UserCompanyRoleId={0}", GridViewUserCompanyRoles1.SelectedDataKey.Values[0]);
		Response.Redirect("UserCompanyRolesEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleUsers2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleUserId={0}", GridViewScheduleUsers2.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleUsersEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewScheduleChangeUsers3_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleChangeUsers={0}", GridViewScheduleChangeUsers3.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleChangeUsersEdit.aspx?" + urlParams, true);		
	}	
}


