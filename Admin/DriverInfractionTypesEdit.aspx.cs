
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

public partial class DriverInfractionTypesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "DriverInfractionTypesEdit.aspx?{0}", DriverInfractionTypesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "DriverInfractionTypesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "DriverInfractionTypes.aspx");
		FormUtil.SetDefaultMode(FormView1, "InfractionTypeId");
	}
	protected void GridViewDriverInfractions1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("DriverInfractionId={0}", GridViewDriverInfractions1.SelectedDataKey.Values[0]);
		Response.Redirect("DriverInfractionsEdit.aspx?" + urlParams, true);		
	}	
}


