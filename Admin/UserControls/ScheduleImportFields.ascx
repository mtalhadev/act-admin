<%@ Control Language="C#" ClassName="ScheduleImportFields" %>


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
        <td class="literal"><asp:Label ID="lbldataArriveDate" runat="server" Text="Arrive Date:" AssociatedControlID="dataArriveDate" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataArriveDate" Text='<%# Bind("ArriveDate") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataArriveTime" runat="server" Text="Arrive Time:" AssociatedControlID="dataArriveTime" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataArriveTime" Text='<%# Bind("ArriveTime") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataArriveFlight" runat="server" Text="Arrive Flight:" AssociatedControlID="dataArriveFlight" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataArriveFlight" Text='<%# Bind("ArriveFlight") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataReportDate" runat="server" Text="Report Date:" AssociatedControlID="dataReportDate" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataReportDate" Text='<%# Bind("ReportDate") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataReportTime" runat="server" Text="Report Time:" AssociatedControlID="dataReportTime" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataReportTime" Text='<%# Bind("ReportTime") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataReportFlight" runat="server" Text="Report Flight:" AssociatedControlID="dataReportFlight" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataReportFlight" Text='<%# Bind("ReportFlight") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataCrew" runat="server" Text="Crew:" AssociatedControlID="dataCrew" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataCrew" Text='<%# Bind("Crew") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataType" runat="server" Text="Type:" AssociatedControlID="dataType" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataType" Text='<%# Bind("Type") %>' MaxLength="50"></asp:TextBox>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


