
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

public partial class RatesEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{		
		FormUtil.RedirectAfterInsertUpdate(FormView1, "RatesEdit.aspx?{0}", RatesDataSource);
		FormUtil.RedirectAfterAddNew(FormView1, "RatesEdit.aspx");
		FormUtil.RedirectAfterCancel(FormView1, "Rates.aspx");
		FormUtil.SetDefaultMode(FormView1, "RateId");
	}
	protected void GridViewRatePickups1_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("RatePickupId={0}", GridViewRatePickups1.SelectedDataKey.Values[0]);
		Response.Redirect("RatePickupsEdit.aspx?" + urlParams, true);		
	}	
	protected void GridViewRateDropoffs2_SelectedIndexChanged(object sender, EventArgs e)
	{
		string urlParams = string.Format("RateDropoffId={0}", GridViewRateDropoffs2.SelectedDataKey.Values[0]);
		Response.Redirect("RateDropoffsEdit.aspx?" + urlParams, true);		
	}	
}


