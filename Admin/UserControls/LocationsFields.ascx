<%@ Control Language="C#" ClassName="LocationsFields" %>


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
        <td class="literal"><asp:Label ID="lbldataCompanyId" runat="server" Text="Company Id:" AssociatedControlID="dataCompanyId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataCompanyId" DataSourceID="CompanyIdCompaniesDataSource" DataTextField="Name" DataValueField="CompanyId" SelectedValue='<%# Bind("CompanyId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:CompaniesDataSource ID="CompanyIdCompaniesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataLocationTypeId" runat="server" Text="Location Type Id:" AssociatedControlID="dataLocationTypeId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataLocationTypeId" DataSourceID="LocationTypeIdLocationTypesDataSource" DataTextField="Code" DataValueField="LocationTypeId" SelectedValue='<%# Bind("LocationTypeId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:LocationTypesDataSource ID="LocationTypeIdLocationTypesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCode" runat="server" Text="Code:" AssociatedControlID="dataCode" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataCode" Text='<%# Bind("Code") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataCode" runat="server" Display="Dynamic" ControlToValidate="dataCode" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataDescription" runat="server" Text="Description:" AssociatedControlID="dataDescription" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataDescription" Text='<%# Bind("Description") %>' MaxLength="250"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataDescription" runat="server" Display="Dynamic" ControlToValidate="dataDescription" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataMinutesFromAirport" runat="server" Text="Minutes From Airport:" AssociatedControlID="dataMinutesFromAirport" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataMinutesFromAirport" Text='<%# Bind("MinutesFromAirport") %>'></asp:TextBox><asp:RangeValidator ID="RangeVal_dataMinutesFromAirport" runat="server" Display="Dynamic" ControlToValidate="dataMinutesFromAirport" ErrorMessage="Invalid value" MaximumValue="2147483647" MinimumValue="-2147483648" Type="Integer"></asp:RangeValidator>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


