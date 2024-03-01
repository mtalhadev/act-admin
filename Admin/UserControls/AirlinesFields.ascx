<%@ Control Language="C#" ClassName="AirlinesFields" %>


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
        <td class="literal"><asp:Label ID="lbldataAirlineUser" runat="server" Text="Airline User:" AssociatedControlID="dataAirlineUser" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataAirlineUser" Text='<%# Bind("AirlineUser") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataAirlinePass" runat="server" Text="Airline Pass:" AssociatedControlID="dataAirlinePass" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataAirlinePass" Text='<%# Bind("AirlinePass") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataHotelUser" runat="server" Text="Hotel User:" AssociatedControlID="dataHotelUser" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataHotelUser" Text='<%# Bind("HotelUser") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataHotelPass" runat="server" Text="Hotel Pass:" AssociatedControlID="dataHotelPass" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataHotelPass" Text='<%# Bind("HotelPass") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCrewUser" runat="server" Text="Crew User:" AssociatedControlID="dataCrewUser" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataCrewUser" Text='<%# Bind("CrewUser") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCrewPass" runat="server" Text="Crew Pass:" AssociatedControlID="dataCrewPass" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataCrewPass" Text='<%# Bind("CrewPass") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataPortalPassReset" runat="server" Text="Portal Pass Reset:" AssociatedControlID="dataPortalPassReset" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataPortalPassReset" Text='<%# Bind("PortalPassReset", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataPortalPassReset" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataPortalPassReset" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataPortalPassReset" id="calext_dataPortalPassReset" />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataActive" runat="server" Text="Active:" AssociatedControlID="dataActive" /></td>
        <td>
					<asp:RadioButtonList runat="server" ID="dataActive" SelectedValue='<%# Bind("Active") %>' RepeatDirection="Horizontal"><asp:ListItem Value="True" Text="Yes" Selected="True"></asp:ListItem><asp:ListItem Value="False" Text="No"></asp:ListItem></asp:RadioButtonList>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


