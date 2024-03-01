<%@ Control Language="C#" ClassName="ScheduleFields" %>


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
        <td class="literal"><asp:Label ID="lbldataScheduleStatusId" runat="server" Text="Schedule Status Id:" AssociatedControlID="dataScheduleStatusId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataScheduleStatusId" DataSourceID="ScheduleStatusIdScheduleStatusesDataSource" DataTextField="Code" DataValueField="ScheduleStatusId" SelectedValue='<%# Bind("ScheduleStatusId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:ScheduleStatusesDataSource ID="ScheduleStatusIdScheduleStatusesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataScheduleTypeId" runat="server" Text="Schedule Type Id:" AssociatedControlID="dataScheduleTypeId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataScheduleTypeId" DataSourceID="ScheduleTypeIdScheduleTypesDataSource" DataTextField="Code" DataValueField="ScheduleTypeId" SelectedValue='<%# Bind("ScheduleTypeId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:ScheduleTypesDataSource ID="ScheduleTypeIdScheduleTypesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataTransportationTypeId" runat="server" Text="Transportation Type Id:" AssociatedControlID="dataTransportationTypeId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataTransportationTypeId" DataSourceID="TransportationTypeIdScheduleTransportationTypesDataSource" DataTextField="Code" DataValueField="TransportationTypeId" SelectedValue='<%# Bind("TransportationTypeId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:ScheduleTransportationTypesDataSource ID="TransportationTypeIdScheduleTransportationTypesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataAirlineId" runat="server" Text="Airline Id:" AssociatedControlID="dataAirlineId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataAirlineId" DataSourceID="AirlineIdAirlinesDataSource" DataTextField="Code" DataValueField="AirlineId" SelectedValue='<%# Bind("AirlineId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:AirlinesDataSource ID="AirlineIdAirlinesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataDriverId" runat="server" Text="Driver Id:" AssociatedControlID="dataDriverId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataDriverId" DataSourceID="DriverIdDriversDataSource" DataTextField="DriverCode" DataValueField="DriverId" SelectedValue='<%# Bind("DriverId") %>' AppendNullItem="true" Required="false" NullItemText="< Please Choose ...>" />
					<data:DriversDataSource ID="DriverIdDriversDataSource" runat="server" SelectMethod="GetAll"  />
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
        <td class="literal"><asp:Label ID="lbldataScheduleDate" runat="server" Text="Schedule Date:" AssociatedControlID="dataScheduleDate" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataScheduleDate" Text='<%# Bind("ScheduleDate", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataScheduleDate" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataScheduleDate" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataScheduleDate" id="calext_dataScheduleDate" /><asp:RequiredFieldValidator ID="ReqVal_dataScheduleDate" runat="server" Display="Dynamic" ControlToValidate="dataScheduleDate" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataFlightNo" runat="server" Text="Flight No:" AssociatedControlID="dataFlightNo" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataFlightNo" Text='<%# Bind("FlightNo") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataRateOverride" runat="server" Text="Rate Override:" AssociatedControlID="dataRateOverride" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataRateOverride" Text='<%# Bind("RateOverride") %>'></asp:TextBox><asp:RangeValidator ID="RangeVal_dataRateOverride" runat="server" Display="Dynamic" ControlToValidate="dataRateOverride" ErrorMessage="Invalid value" MaximumValue="999999999" MinimumValue="-999999999" Type="Double"></asp:RangeValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataRotationNo" runat="server" Text="Rotation No:" AssociatedControlID="dataRotationNo" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataRotationNo" Text='<%# Bind("RotationNo") %>'></asp:TextBox><asp:RangeValidator ID="RangeVal_dataRotationNo" runat="server" Display="Dynamic" ControlToValidate="dataRotationNo" ErrorMessage="Invalid value" MaximumValue="2147483647" MinimumValue="-2147483648" Type="Integer"></asp:RangeValidator>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


