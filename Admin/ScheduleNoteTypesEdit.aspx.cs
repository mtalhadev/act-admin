
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

public partial class ScheduleNoteTypesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "ScheduleNoteTypesEdit.aspx?{0}", ScheduleNoteTypesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "ScheduleNoteTypesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "ScheduleNoteTypes.aspx");
		FormUtil.SetDefaultMode(FormView1, "ScheduleNoteTypeId");
	}
	protected void GridViewScheduleNotes1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleNoteId={0}", GridViewScheduleNotes1.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleNotesEdit.aspx?" + urlParams, true);		
	}	
}


