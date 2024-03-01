<%@ Control Language="C#" ClassName="ScheduleChangeUsersFields" %>


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
        <td class="literal"><asp:Label ID="lbldataScheduleChangeId" runat="server" Text="Schedule Change Id:" AssociatedControlID="dataScheduleChangeId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataScheduleChangeId" DataSourceID="ScheduleChangeIdScheduleChangesDataSource" DataTextField="ScheduleDate" DataValueField="ScheduleChangeId" SelectedValue='<%# Bind("ScheduleChangeId") %>' AppendNullItem="true" Required="false" NullItemText="< Please Choose ...>" />
					<data:ScheduleChangesDataSource ID="ScheduleChangeIdScheduleChangesDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataScheduleUserId" runat="server" Text="Schedule User Id:" AssociatedControlID="dataScheduleUserId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataScheduleUserId" DataSourceID="ScheduleUserIdScheduleUsersDataSource" DataTextField="ScheduleUserId" DataValueField="ScheduleUserId" SelectedValue='<%# Bind("ScheduleUserId") %>' AppendNullItem="true" Required="false" NullItemText="< Please Choose ...>" />
					<data:ScheduleUsersDataSource ID="ScheduleUserIdScheduleUsersDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataUserId" runat="server" Text="User Id:" AssociatedControlID="dataUserId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataUserId" DataSourceID="UserIdUsersDataSource" DataTextField="Email" DataValueField="UserId" SelectedValue='<%# Bind("UserId") %>' AppendNullItem="true" Required="false" NullItemText="< Please Choose ...>" />
					<data:UsersDataSource ID="UserIdUsersDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCancel" runat="server" Text="Cancel:" AssociatedControlID="dataCancel" /></td>
        <td>
					<asp:RadioButtonList runat="server" ID="dataCancel" SelectedValue='<%# Bind("Cancel") %>' RepeatDirection="Horizontal"><asp:ListItem Value="True" Text="Yes" Selected="True"></asp:ListItem><asp:ListItem Value="False" Text="No"></asp:ListItem></asp:RadioButtonList>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


