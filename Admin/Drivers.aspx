
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="Drivers.aspx.cs" Inherits="Drivers" Title="Drivers List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Drivers List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="DriversDataSource"
				DataKeyNames="DriverId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_Drivers.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="DriverCode" HeaderText="Driver Code" SortExpression="[DriverCode]"  />
				<asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="[FirstName]"  />
				<asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="[LastName]"  />

				<asp:templatefield headertext='Driver Photo Preview'>
				<itemtemplate>
					<ajaxToolkit:ModalPopupExtender id='ModalPopupExtender2' runat='server'
						TargetControlID='LinkButton2' 
						PopupControlID='Panel1' 
						OkControlID='Button1'
						BackgroundCssClass='ModalBackground' 
						DynamicControlID='lblPreview'
						DynamicContextKey='<%# DataBinder.Eval(Container.DataItem, "DriverId") %>'
						DynamicServiceMethod='GetDriverPhotoContent' />
					<asp:LinkButton ID='LinkButton2' runat='server' Text='Preview' />
				</itemtemplate>
				</asp:templatefield>
	

				<asp:templatefield headertext='License Photo Preview'>
				<itemtemplate>
					<ajaxToolkit:ModalPopupExtender id='ModalPopupExtender3' runat='server'
						TargetControlID='LinkButton3' 
						PopupControlID='Panel1' 
						OkControlID='Button1'
						BackgroundCssClass='ModalBackground' 
						DynamicControlID='lblPreview'
						DynamicContextKey='<%# DataBinder.Eval(Container.DataItem, "DriverId") %>'
						DynamicServiceMethod='GetLicensePhotoContent' />
					<asp:LinkButton ID='LinkButton3' runat='server' Text='Preview' />
				</itemtemplate>
				</asp:templatefield>
	
				<asp:BoundField DataField="Dob" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Dob" SortExpression="[DOB]"  />
				<asp:BoundField DataField="HireDate" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Hire Date" SortExpression="[HireDate]"  />
				<asp:BoundField DataField="Ssn" HeaderText="Ssn" SortExpression="[SSN]"  />
				<asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="[Mobile]"  />
				<asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="[Phone]"  />
				<asp:BoundField DataField="Address" HeaderText="Address" SortExpression="[Address]"  />
				<asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="[Address2]"  />
				<asp:BoundField DataField="City" HeaderText="City" SortExpression="[City]"  />
				<asp:BoundField DataField="State" HeaderText="State" SortExpression="[State]"  />
				<asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="[Zipcode]"  />
				<asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="[UserName]"  />
				<asp:BoundField DataField="Password" HeaderText="Password" SortExpression="[Password]"  />
				<data:BoundRadioButtonField DataField="Active" HeaderText="Active" SortExpression="[Active]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No Drivers Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnDrivers" OnClientClick="javascript:location.href='DriversEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
	<asp:Panel ID="Panel1" runat="server" CssClass="popup" >
	    <h2>Content Preview <asp:Button ID="Button1" runat="server"  Text="Close Preview"/></h2><hr /> 
	    <asp:Label ID='lblPreview' runat="server" ></asp:Label>
	</asp:Panel>
		<data:DriversDataSource ID="DriversDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriversProperty Name="Companies"/> 
					<%--<data:DriversProperty Name="DriverCredentialsCollection" />--%>
					<%--<data:DriversProperty Name="VehicleLogsCollection" />--%>
					<%--<data:DriversProperty Name="ScheduleCollection" />--%>
					<%--<data:DriversProperty Name="DriverInfractionsCollection" />--%>
					<%--<data:DriversProperty Name="DriverMedicalCollection" />--%>
					<%--<data:DriversProperty Name="DriverNotesCollection" />--%>
					<%--<data:DriversProperty Name="DriverCitiesCollection" />--%>
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:DriversDataSource>
	    		
</asp:Content>



