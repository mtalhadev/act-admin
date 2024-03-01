<%@ Control Language="C#" ClassName="ScheduleNotesFields" %>


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
        <td class="literal"><asp:Label ID="lbldataScheduleNoteTypeId" runat="server" Text="Schedule Note Type Id:" AssociatedControlID="dataScheduleNoteTypeId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataScheduleNoteTypeId" DataSourceID="ScheduleNoteTypeIdScheduleNoteTypesDataSource" DataTextField="Code" DataValueField="ScheduleNoteTypeId" SelectedValue='<%# Bind("ScheduleNoteTypeId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:ScheduleNoteTypesDataSource ID="ScheduleNoteTypeIdScheduleNoteTypesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataScheduleId" runat="server" Text="Schedule Id:" AssociatedControlID="dataScheduleId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataScheduleId" DataSourceID="ScheduleIdScheduleDataSource" DataTextField="ScheduleDate" DataValueField="ScheduleId" SelectedValue='<%# Bind("ScheduleId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:ScheduleDataSource ID="ScheduleIdScheduleDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataMemo" runat="server" Text="Memo:" AssociatedControlID="dataMemo" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataMemo" Text='<%# Bind("Memo") %>'  TextMode="MultiLine"  Width="250px" Rows="5"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataMemo" runat="server" Display="Dynamic" ControlToValidate="dataMemo" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataSafeNamePrivate" runat="server" Text="Private:" AssociatedControlID="dataSafeNamePrivate" /></td>
        <td>
					<asp:RadioButtonList runat="server" ID="dataSafeNamePrivate" SelectedValue='<%# Bind("SafeNamePrivate") %>' RepeatDirection="Horizontal"><asp:ListItem Value="True" Text="Yes" Selected="True"></asp:ListItem><asp:ListItem Value="False" Text="No"></asp:ListItem></asp:RadioButtonList>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataActive" runat="server" Text="Active:" AssociatedControlID="dataActive" /></td>
        <td>
					<asp:RadioButtonList runat="server" ID="dataActive" SelectedValue='<%# Bind("Active") %>' RepeatDirection="Horizontal"><asp:ListItem Value="True" Text="Yes" Selected="True"></asp:ListItem><asp:ListItem Value="False" Text="No"></asp:ListItem></asp:RadioButtonList>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCreatedDate" runat="server" Text="Created Date:" AssociatedControlID="dataCreatedDate" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataCreatedDate" Text='<%# Bind("CreatedDate", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataCreatedDate" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataCreatedDate" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataCreatedDate" id="calext_dataCreatedDate" /><asp:RequiredFieldValidator ID="ReqVal_dataCreatedDate" runat="server" Display="Dynamic" ControlToValidate="dataCreatedDate" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


