<%@ Control Language="C#" ClassName="HqCompaniesFields" %>


<script runat="server">                    
 protected string inlineImage(string fieldname, object image)
  {
   if (image == null)
     return "No Content Found!";

   byte[] binaryData = image as byte[];
   string imageBase64 = Convert.ToBase64String(binaryData);
   string imageSrc = string.Format("data:image/gif;base64,{0}", imageBase64);                            
   return string.Format("<div id='image{0}'><img height='200px' width='200px' src='{1}' /></div>",fieldname, imageSrc);
  }
</script>



<asp:FormView ID="FormView1" runat="server">
	<ItemTemplate>
		<table border="0" cellpadding="3" cellspacing="1">
			<tr>
        <td class="literal"><asp:Label ID="lbldataHqid" runat="server" Text="Hqid:" AssociatedControlID="dataHqid" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataHqid" DataSourceID="HqidHqsDataSource" DataTextField="Code" DataValueField="Hqid" SelectedValue='<%# Bind("Hqid") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:HqsDataSource ID="HqidHqsDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCompanyId" runat="server" Text="Company Id:" AssociatedControlID="dataCompanyId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataCompanyId" DataSourceID="CompanyIdCompaniesDataSource" DataTextField="Name" DataValueField="CompanyId" SelectedValue='<%# Bind("CompanyId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:CompaniesDataSource ID="CompanyIdCompaniesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


