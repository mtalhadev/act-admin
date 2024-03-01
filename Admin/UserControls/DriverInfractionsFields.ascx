<%@ Control Language="C#" ClassName="DriverInfractionsFields" %>


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
        <td class="literal"><asp:Label ID="lbldataInfractionTypeId" runat="server" Text="Infraction Type Id:" AssociatedControlID="dataInfractionTypeId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataInfractionTypeId" DataSourceID="InfractionTypeIdDriverInfractionTypesDataSource" DataTextField="Code" DataValueField="InfractionTypeId" SelectedValue='<%# Bind("InfractionTypeId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:DriverInfractionTypesDataSource ID="InfractionTypeIdDriverInfractionTypesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataDriverId" runat="server" Text="Driver Id:" AssociatedControlID="dataDriverId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataDriverId" DataSourceID="DriverIdDriversDataSource" DataTextField="DriverCode" DataValueField="DriverId" SelectedValue='<%# Bind("DriverId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:DriversDataSource ID="DriverIdDriversDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataInfractionDate" runat="server" Text="Infraction Date:" AssociatedControlID="dataInfractionDate" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataInfractionDate" Text='<%# Bind("InfractionDate", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataInfractionDate" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataInfractionDate" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataInfractionDate" id="calext_dataInfractionDate" />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataDescription" runat="server" Text="Description:" AssociatedControlID="dataDescription" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataDescription" Text='<%# Bind("Description") %>'  TextMode="MultiLine"  Width="250px" Rows="5"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataDescription" runat="server" Display="Dynamic" ControlToValidate="dataDescription" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


