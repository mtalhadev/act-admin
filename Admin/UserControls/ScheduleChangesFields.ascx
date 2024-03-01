<%@ Control Language="C#" ClassName="ScheduleChangesFields" %>


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
        <td class="literal"><asp:Label ID="lbldataScheduleStatusId" runat="server" Text="Schedule Status Id:" AssociatedControlID="dataScheduleStatusId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataScheduleStatusId" DataSourceID="ScheduleStatusIdScheduleStatusesDataSource" DataTextField="Code" DataValueField="ScheduleStatusId" SelectedValue='<%# Bind("ScheduleStatusId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:ScheduleStatusesDataSource ID="ScheduleStatusIdScheduleStatusesDataSource" runat="server" SelectMethod="GetAll"  />
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
					<asp:TextBox runat="server" ID="dataFlightNo" Text='<%# Bind("FlightNo") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataFlightNo" runat="server" Display="Dynamic" ControlToValidate="dataFlightNo" ErrorMessage="Required"></asp:RequiredFieldValidator>
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
			<tr>
        <td class="literal"><asp:Label ID="lbldataApproved" runat="server" Text="Approved:" AssociatedControlID="dataApproved" /></td>
        <td>
					<asp:RadioButtonList runat="server" ID="dataApproved" SelectedValue='<%# Bind("Approved") %>' RepeatDirection="Horizontal"><asp:ListItem Value="True" Text="Yes" Selected="True"></asp:ListItem><asp:ListItem Value="False" Text="No"></asp:ListItem></asp:RadioButtonList>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


