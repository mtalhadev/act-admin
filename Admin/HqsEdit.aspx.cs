
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

public partial class HqsEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "HqsEdit.aspx?{0}", HqsDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "HqsEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Hqs.aspx");
		FormUtil.SetDefaultMode(FormView1, "Hqid");
	}
	protected void GridViewHqCompanies1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("HqCompanyId={0}", GridViewHqCompanies1.SelectedDataKey.Values[0]);
		Response.Redirect("HqCompaniesEdit.aspx?" + urlParams, true);		
	}	
}


