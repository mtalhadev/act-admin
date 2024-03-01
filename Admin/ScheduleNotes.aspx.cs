﻿

#region Using directives
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SAFE.Web.UI;
#endregion

public partial class ScheduleNotes : System.Web.UI.Page
{	
    protected void Page_Load(object sender, EventArgs e)
	{
		FormUtil.RedirectAfterUpdate(GridView1, "ScheduleNotes.aspx?page={0}");
		FormUtil.SetPageIndex(GridView1, "page");
		FormUtil.SetDefaultButton((Button)GridViewSearchPanel1.FindControl("cmdSearch"));
    }

	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("ScheduleNoteId={0}", GridView1.SelectedDataKey.Values[0]);
		Response.Redirect("ScheduleNotesEdit.aspx?" + urlParams, true);
	}
	

	
	[System.Web.Script.Services.ScriptMethod]
	[System.Web.Services.WebMethod]
	public static string GetMemoContent(string contextKey)
	{        
		System.Int32 key;
		System.Int32.TryParse(contextKey, out key);
        
        SAFE.Entities.ScheduleNotes content 
			= SAFE.Data.DataRepository.ScheduleNotesProvider.GetByScheduleNoteId(key);
        
        if (content.Memo == null)
            return "No Content Found!";



	 
        return string.Format("<div id='previewContent'>{0}</div>", content.Memo);
               
        

	}





}





