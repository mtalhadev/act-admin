<%@ Control Language="C#" ClassName="DriversFields" %>


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
        <td class="literal"><asp:Label ID="lbldataDriverCode" runat="server" Text="Driver Code:" AssociatedControlID="dataDriverCode" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataDriverCode" Text='<%# Bind("DriverCode") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataDriverCode" runat="server" Display="Dynamic" ControlToValidate="dataDriverCode" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataFirstName" runat="server" Text="First Name:" AssociatedControlID="dataFirstName" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataFirstName" Text='<%# Bind("FirstName") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataFirstName" runat="server" Display="Dynamic" ControlToValidate="dataFirstName" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataLastName" runat="server" Text="Last Name:" AssociatedControlID="dataLastName" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataLastName" Text='<%# Bind("LastName") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataLastName" runat="server" Display="Dynamic" ControlToValidate="dataLastName" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataDriverPhoto" runat="server" Text="Driver Photo:" AssociatedControlID="dataDriverPhoto" /></td>
        <td>
					<%# inlineImage("DriverPhoto", Eval("DriverPhoto"))%> <br /><asp:FileUpload ID="dataDriverPhoto" runat="server" Filebytes='<%# Bind("DriverPhoto") %>' /> 
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataLicensePhoto" runat="server" Text="License Photo:" AssociatedControlID="dataLicensePhoto" /></td>
        <td>
					<%# inlineImage("LicensePhoto", Eval("LicensePhoto"))%> <br /><asp:FileUpload ID="dataLicensePhoto" runat="server" Filebytes='<%# Bind("LicensePhoto") %>' /> 
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataDob" runat="server" Text="Dob:" AssociatedControlID="dataDob" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataDob" Text='<%# Bind("Dob", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataDob" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataDob" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataDob" id="calext_dataDob" /><asp:RequiredFieldValidator ID="ReqVal_dataDob" runat="server" Display="Dynamic" ControlToValidate="dataDob" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataHireDate" runat="server" Text="Hire Date:" AssociatedControlID="dataHireDate" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataHireDate" Text='<%# Bind("HireDate", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataHireDate" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataHireDate" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataHireDate" id="calext_dataHireDate" /><asp:RequiredFieldValidator ID="ReqVal_dataHireDate" runat="server" Display="Dynamic" ControlToValidate="dataHireDate" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataSsn" runat="server" Text="Ssn:" AssociatedControlID="dataSsn" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataSsn" Text='<%# Bind("Ssn") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataSsn" runat="server" Display="Dynamic" ControlToValidate="dataSsn" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataMobile" runat="server" Text="Mobile:" AssociatedControlID="dataMobile" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataMobile" Text='<%# Bind("Mobile") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataPhone" runat="server" Text="Phone:" AssociatedControlID="dataPhone" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataPhone" Text='<%# Bind("Phone") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataAddress" runat="server" Text="Address:" AssociatedControlID="dataAddress" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataAddress" Text='<%# Bind("Address") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataAddress" runat="server" Display="Dynamic" ControlToValidate="dataAddress" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataAddress2" runat="server" Text="Address2:" AssociatedControlID="dataAddress2" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataAddress2" Text='<%# Bind("Address2") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCity" runat="server" Text="City:" AssociatedControlID="dataCity" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataCity" Text='<%# Bind("City") %>' MaxLength="100"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataCity" runat="server" Display="Dynamic" ControlToValidate="dataCity" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataState" runat="server" Text="State:" AssociatedControlID="dataState" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataState" Text='<%# Bind("State") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataState" runat="server" Display="Dynamic" ControlToValidate="dataState" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataZipcode" runat="server" Text="Zipcode:" AssociatedControlID="dataZipcode" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataZipcode" Text='<%# Bind("Zipcode") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataZipcode" runat="server" Display="Dynamic" ControlToValidate="dataZipcode" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataUserName" runat="server" Text="User Name:" AssociatedControlID="dataUserName" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataUserName" Text='<%# Bind("UserName") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataPassword" runat="server" Text="Password:" AssociatedControlID="dataPassword" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataPassword" Text='<%# Bind("Password") %>' MaxLength="50"></asp:TextBox>
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


