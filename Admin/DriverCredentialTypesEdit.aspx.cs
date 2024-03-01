
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

public partial class DriverCredentialTypesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "DriverCredentialTypesEdit.aspx?{0}", DriverCredentialTypesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "DriverCredentialTypesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "DriverCredentialTypes.aspx");
		FormUtil.SetDefaultMode(FormView1, "CredentialTypeId");
	}
	protected void GridViewDriverCredentials1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverCredentialId={0}", GridViewDriverCredentials1.SelectedDataKey.Values[0]);
		Response.Redirect("DriverCredentialsEdit.aspx?" + urlParams, true);		
	}	
}


