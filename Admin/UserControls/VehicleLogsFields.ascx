<%@ Control Language="C#" ClassName="VehicleLogsFields" %>


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
        <td class="literal"><asp:Label ID="lbldataVehicleLogTypeId" runat="server" Text="Vehicle Log Type Id:" AssociatedControlID="dataVehicleLogTypeId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataVehicleLogTypeId" DataSourceID="VehicleLogTypeIdVehicleLogTypesDataSource" DataTextField="Code" DataValueField="VehicleLogTypeId" SelectedValue='<%# Bind("VehicleLogTypeId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:VehicleLogTypesDataSource ID="VehicleLogTypeIdVehicleLogTypesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataVehicleId" runat="server" Text="Vehicle Id:" AssociatedControlID="dataVehicleId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataVehicleId" DataSourceID="VehicleIdVehiclesDataSource" DataTextField="Code" DataValueField="VehicleId" SelectedValue='<%# Bind("VehicleId") %>' AppendNullItem="true" Required="false" NullItemText="< Please Choose ...>" />
					<data:VehiclesDataSource ID="VehicleIdVehiclesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataUserId" runat="server" Text="User Id:" AssociatedControlID="dataUserId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataUserId" DataSourceID="UserIdDriversDataSource" DataTextField="DriverCode" DataValueField="DriverId" SelectedValue='<%# Bind("UserId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:DriversDataSource ID="UserIdDriversDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataLogDate" runat="server" Text="Log Date:" AssociatedControlID="dataLogDate" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataLogDate" Text='<%# Bind("LogDate", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataLogDate" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataLogDate" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataLogDate" id="calext_dataLogDate" />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataMileage" runat="server" Text="Mileage:" AssociatedControlID="dataMileage" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataMileage" Text='<%# Bind("Mileage") %>'></asp:TextBox><asp:RangeValidator ID="RangeVal_dataMileage" runat="server" Display="Dynamic" ControlToValidate="dataMileage" ErrorMessage="Invalid value" MaximumValue="999999999" MinimumValue="-999999999" Type="Double"></asp:RangeValidator>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


