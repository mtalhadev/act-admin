﻿
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

public partial class DriverNotesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "DriverNotesEdit.aspx?{0}", DriverNotesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "DriverNotesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "DriverNotes.aspx");
		FormUtil.SetDefaultMode(FormView1, "DriverNoteId");
	}
}


