<%@ Control Language="C#" ClassName="DriverMedicalFields" %>


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
        <td class="literal"><asp:Label ID="lbldataEvaluationDate" runat="server" Text="Evaluation Date:" AssociatedControlID="dataEvaluationDate" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataEvaluationDate" Text='<%# Bind("EvaluationDate", "{0:d}") %>' MaxLength="10"></asp:TextBox><asp:ImageButton ID="cal_dataEvaluationDate" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:return false;" /><ajaxToolkit:CalendarExtender runat="server" TargetControlID="dataEvaluationDate" CssClass="ajaxToolkit-CalendarExtender" Format="MM/dd/yyyy" PopupButtonID="cal_dataEvaluationDate" id="calext_dataEvaluationDate" />
				</td>
			</tr>
			<tr>
        <td class="literal"><asp:Label ID="lbldataEvalulationNotes" runat="server" Text="Evalulation Notes:" AssociatedControlID="dataEvalulationNotes" /></td>
        <td>
					<asp:TextBox runat="server" ID="dataEvalulationNotes" Text='<%# Bind("EvalulationNotes") %>'  TextMode="MultiLine"  Width="250px" Rows="5"></asp:TextBox><asp:RequiredFieldValidator ID="ReqVal_dataEvalulationNotes" runat="server" Display="Dynamic" ControlToValidate="dataEvalulationNotes" ErrorMessage="Required"></asp:RequiredFieldValidator>
				</td>
			</tr>
			
		</table>

	</ItemTemplate>
</asp:FormView>


