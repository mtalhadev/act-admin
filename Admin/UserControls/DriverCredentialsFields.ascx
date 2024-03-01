<%@ Control Language="C#" ClassName="DriverCredentialsFields" %>


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
        <td class="literal"><asp:Label ID="lbldataCredentialTypeId" runat="server" Text="Credential Type Id:" AssociatedControlID="dataCredentialTypeId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataCredentialTypeId" DataSourceID="CredentialTypeIdDriverCredentialTypesDataSource" DataTextField="Code" DataValueField="CredentialTypeId" SelectedValue='<%# Bind("CredentialTypeId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:DriverCredentialTypesDataSource ID="CredentialTypeIdDriverCredentialTypesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataNumber" runat="server" Text="Number:" AssociatedControlID="dataNumber" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataNumber" Text='<%# Bind("Number") %>' MaxLength="100"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataExpiration" runat="server" Text="Expiration:" AssociatedControlID="dataExpiration" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataExpiration" Text='<%# Bind("Expiration", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataExpiration" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataExpiration" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataExpiration" id="calext_dataExpiration" />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataPhoto" runat="server" Text="Photo:" AssociatedControlID="dataPhoto" /></td>
        <td>
					<%# inlineImage("Photo", Eval("Photo"))%> <br /><asp:FileUpload ID="dataPhoto" runat="server" Filebytes='<%# Bind("Photo") %>' /> 
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


