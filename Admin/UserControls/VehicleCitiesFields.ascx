<%@ Control Language="C#" ClassName="VehicleCitiesFields" %>


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
        <td class="literal"><asp:Label ID="lbldataVehicleId" runat="server" Text="Vehicle Id:" AssociatedControlID="dataVehicleId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataVehicleId" DataSourceID="VehicleIdVehiclesDataSource" DataTextField="Code" DataValueField="VehicleId" SelectedValue='<%# Bind("VehicleId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:VehiclesDataSource ID="VehicleIdVehiclesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCityId" runat="server" Text="City Id:" AssociatedControlID="dataCityId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataCityId" DataSourceID="CityIdCitiesDataSource" DataTextField="Code" DataValueField="CityId" SelectedValue='<%# Bind("CityId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:CitiesDataSource ID="CityIdCitiesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


