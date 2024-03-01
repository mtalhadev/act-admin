<%@ Control Language="C#" ClassName="DriverCitiesFields" %>


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
        <td class="literal"><asp:Label ID="lbldataDriverId" runat="server" Text="Driver Id:" AssociatedControlID="dataDriverId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataDriverId" DataSourceID="DriverIdDriversDataSource" DataTextField="DriverCode" DataValueField="DriverId" SelectedValue='<%# Bind("DriverId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:DriversDataSource ID="DriverIdDriversDataSource" runat="server" SelectMethod="GetAll"  />
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


