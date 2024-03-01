<%@ Control Language="C#" ClassName="VehiclesFields" %>


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
        <td class="literal"><asp:Label ID="lbldataVehicleStatusId" runat="server" Text="Vehicle Status Id:" AssociatedControlID="dataVehicleStatusId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataVehicleStatusId" DataSourceID="VehicleStatusIdVehicleStatusesDataSource" DataTextField="Code" DataValueField="VehicleStatusId" SelectedValue='<%# Bind("VehicleStatusId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:VehicleStatusesDataSource ID="VehicleStatusIdVehicleStatusesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCode" runat="server" Text="Code:" AssociatedControlID="dataCode" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataCode" Text='<%# Bind("Code") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataCode" runat="server" Display="Dynamic" ControlToValidate="dataCode" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataMake" runat="server" Text="Make:" AssociatedControlID="dataMake" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataMake" Text='<%# Bind("Make") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataModel" runat="server" Text="Model:" AssociatedControlID="dataModel" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataModel" Text='<%# Bind("Model") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataVin" runat="server" Text="Vin:" AssociatedControlID="dataVin" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataVin" Text='<%# Bind("Vin") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataPlateNumber" runat="server" Text="Plate Number:" AssociatedControlID="dataPlateNumber" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataPlateNumber" Text='<%# Bind("PlateNumber") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataTollTag" runat="server" Text="Toll Tag:" AssociatedControlID="dataTollTag" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataTollTag" Text='<%# Bind("TollTag") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataTrackingCode" runat="server" Text="Tracking Code:" AssociatedControlID="dataTrackingCode" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataTrackingCode" Text='<%# Bind("TrackingCode") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


