<%@ Control Language="C#" ClassName="SchedulePickupsFields" %>


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
        <td class="literal"><asp:Label ID="lbldataScheduleId" runat="server" Text="Schedule Id:" AssociatedControlID="dataScheduleId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataScheduleId" DataSourceID="ScheduleIdScheduleDataSource" DataTextField="ScheduleDate" DataValueField="ScheduleId" SelectedValue='<%# Bind("ScheduleId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:ScheduleDataSource ID="ScheduleIdScheduleDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataLocationId" runat="server" Text="Location Id:" AssociatedControlID="dataLocationId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataLocationId" DataSourceID="LocationIdLocationsDataSource" DataTextField="Code" DataValueField="LocationId" SelectedValue='<%# Bind("LocationId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:LocationsDataSource ID="LocationIdLocationsDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataPilots" runat="server" Text="Pilots:" AssociatedControlID="dataPilots" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataPilots" Text='<%# Bind("Pilots") %>'></asp:TextBox><asp:RangeValidator ID="RangeVal_dataPilots" runat="server" Display="Dynamic" ControlToValidate="dataPilots" ErrorMessage="Invalid value" MaximumValue="2147483647" MinimumValue="-2147483648" Type="Integer"></asp:RangeValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataFlightAttendants" runat="server" Text="Flight Attendants:" AssociatedControlID="dataFlightAttendants" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataFlightAttendants" Text='<%# Bind("FlightAttendants") %>'></asp:TextBox><asp:RangeValidator ID="RangeVal_dataFlightAttendants" runat="server" Display="Dynamic" ControlToValidate="dataFlightAttendants" ErrorMessage="Invalid value" MaximumValue="2147483647" MinimumValue="-2147483648" Type="Integer"></asp:RangeValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataPassengers" runat="server" Text="Passengers:" AssociatedControlID="dataPassengers" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataPassengers" Text='<%# Bind("Passengers") %>'></asp:TextBox><asp:RangeValidator ID="RangeVal_dataPassengers" runat="server" Display="Dynamic" ControlToValidate="dataPassengers" ErrorMessage="Invalid value" MaximumValue="2147483647" MinimumValue="-2147483648" Type="Integer"></asp:RangeValidator>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


