<%@ Control Language="C#" ClassName="ScheduleUsersFields" %>


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
        <td class="literal"><asp:Label ID="lbldataUserId" runat="server" Text="User Id:" AssociatedControlID="dataUserId" /></td>
        <td>
					<data:EntityDropDownList runat="server" ID="dataUserId" DataSourceID="UserIdUsersDataSource" DataTextField="Email" DataValueField="UserId" SelectedValue='<%# Bind("UserId") %>' AppendNullItem="true" Required="true" NullItemText="< Please Choose ...>" ErrorText="Required" />
					<data:UsersDataSource ID="UserIdUsersDataSource" runat="server" SelectMethod="GetAll"  />
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


