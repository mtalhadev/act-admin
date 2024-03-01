<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="CompaniesEdit.aspx.cs" Inherits="CompaniesEdit" Title="Companies Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Companies - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="CompanyId" runat="server" DataSourceID="CompaniesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/CompaniesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/CompaniesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Companies not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:CompaniesDataSource ID="CompaniesDataSource" runat="server"
			SelectMethod="GetByCompanyId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="CompanyId" QueryStringField="CompanyId" Type="String" />

			</Parameters>
		</data:CompaniesDataSource>
		
		<br />

		<asp:Panel ID="DriverInfractionTypesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverInfractionTypesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Infraction Types Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverInfractionTypesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverInfractionTypesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverInfractionTypes1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverInfractionTypes1_SelectedIndexChanged"			 			 
			DataSourceID="DriverInfractionTypesDataSource1"
			DataKeyNames="InfractionTypeId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_DriverInfractionTypes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Driver Infraction Types Found! </b>
				<asp:HyperLink runat="server" ID="hypDriverInfractionTypes" NavigateUrl="~/admin/DriverInfractionTypesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriverInfractionTypesDataSource ID="DriverInfractionTypesDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverInfractionTypesProperty Name="Companies"/> 
					<%--<data:DriverInfractionTypesProperty Name="DriverInfractionsCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriverInfractionTypesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverInfractionTypesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="DriversPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriversImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Drivers Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriversLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriversPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDrivers2" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDrivers2_SelectedIndexChanged"			 			 
			DataSourceID="DriversDataSource2"
			DataKeyNames="DriverId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_Drivers.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="DriverCode" HeaderText="Driver Code" SortExpression="[DriverCode]" />				
				<asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="[FirstName]" />				
				<asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="[LastName]" />				
				<asp:BoundField DataField="DriverPhoto" HeaderText="Driver Photo" SortExpression="[DriverPhoto]" />				
				<asp:BoundField DataField="LicensePhoto" HeaderText="License Photo" SortExpression="[LicensePhoto]" />				
				<asp:BoundField DataField="Dob" HeaderText="Dob" SortExpression="[DOB]" />				
				<asp:BoundField DataField="HireDate" HeaderText="Hire Date" SortExpression="[HireDate]" />				
				<asp:BoundField DataField="Ssn" HeaderText="Ssn" SortExpression="[SSN]" />				
				<asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="[Mobile]" />				
				<asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="[Phone]" />				
				<asp:BoundField DataField="Address" HeaderText="Address" SortExpression="[Address]" />				
				<asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="[Address2]" />				
				<asp:BoundField DataField="City" HeaderText="City" SortExpression="[City]" />				
				<asp:BoundField DataField="State" HeaderText="State" SortExpression="[State]" />				
				<asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="[Zipcode]" />				
				<asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="[UserName]" />				
				<asp:BoundField DataField="Password" HeaderText="Password" SortExpression="[Password]" />				
				<asp:BoundField DataField="Active" HeaderText="Active" SortExpression="[Active]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Drivers Found! </b>
				<asp:HyperLink runat="server" ID="hypDrivers" NavigateUrl="~/admin/DriversEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriversDataSource ID="DriversDataSource2" runat="server" SelectMethod="Find"
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
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriversFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriversDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="ScheduleNoteTypesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleNoteTypesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Note Types Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleNoteTypesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleNoteTypesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleNoteTypes3" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleNoteTypes3_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleNoteTypesDataSource3"
			DataKeyNames="ScheduleNoteTypeId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleNoteTypes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Note Types Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleNoteTypes" NavigateUrl="~/admin/ScheduleNoteTypesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleNoteTypesDataSource ID="ScheduleNoteTypesDataSource3" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleNoteTypesProperty Name="Companies"/> 
					<%--<data:ScheduleNoteTypesProperty Name="ScheduleNotesCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleNoteTypesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleNoteTypesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="RatesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="RatesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Rates Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="RatesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="RatesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewRates4" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewRates4_SelectedIndexChanged"			 			 
			DataSourceID="RatesDataSource4"
			DataKeyNames="RateId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_Rates.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
				<asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="[Rate]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Rates Found! </b>
				<asp:HyperLink runat="server" ID="hypRates" NavigateUrl="~/admin/RatesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:RatesDataSource ID="RatesDataSource4" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:RatesProperty Name="Companies"/> 
					<%--<data:RatesProperty Name="RatePickupsCollection" />--%>
					<%--<data:RatesProperty Name="RateDropoffsCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:RatesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:RatesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="DriverCredentialTypesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverCredentialTypesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Credential Types Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverCredentialTypesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverCredentialTypesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverCredentialTypes5" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverCredentialTypes5_SelectedIndexChanged"			 			 
			DataSourceID="DriverCredentialTypesDataSource5"
			DataKeyNames="CredentialTypeId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_DriverCredentialTypes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Driver Credential Types Found! </b>
				<asp:HyperLink runat="server" ID="hypDriverCredentialTypes" NavigateUrl="~/admin/DriverCredentialTypesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriverCredentialTypesDataSource ID="DriverCredentialTypesDataSource5" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverCredentialTypesProperty Name="Companies"/> 
					<%--<data:DriverCredentialTypesProperty Name="DriverCredentialsCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriverCredentialTypesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverCredentialTypesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="UserCompanyRolesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="UserCompanyRolesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">User Company Roles Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="UserCompanyRolesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="UserCompanyRolesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewUserCompanyRoles6" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewUserCompanyRoles6_SelectedIndexChanged"			 			 
			DataSourceID="UserCompanyRolesDataSource6"
			DataKeyNames="UserCompanyRoleId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_UserCompanyRoles.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="User Id" DataNavigateUrlFormatString="UsersEdit.aspx?UserId={0}" DataNavigateUrlFields="UserId" DataContainer="UserIdSource" DataTextField="Email" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<data:HyperLinkField HeaderText="Role Id" DataNavigateUrlFormatString="UserRolesEdit.aspx?RoleId={0}" DataNavigateUrlFields="RoleId" DataContainer="RoleIdSource" DataTextField="Code" />
			</Columns>
			<EmptyDataTemplate>
				<b>No User Company Roles Found! </b>
				<asp:HyperLink runat="server" ID="hypUserCompanyRoles" NavigateUrl="~/admin/UserCompanyRolesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:UserCompanyRolesDataSource ID="UserCompanyRolesDataSource6" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:UserCompanyRolesProperty Name="Companies"/> 
					<data:UserCompanyRolesProperty Name="UserRoles"/> 
					<data:UserCompanyRolesProperty Name="Users"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:UserCompanyRolesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:UserCompanyRolesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="AirlinesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="AirlinesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Airlines Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="AirlinesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="AirlinesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewAirlines7" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewAirlines7_SelectedIndexChanged"			 			 
			DataSourceID="AirlinesDataSource7"
			DataKeyNames="AirlineId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_Airlines.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
				<asp:BoundField DataField="AirlineUser" HeaderText="Airline User" SortExpression="[AirlineUser]" />				
				<asp:BoundField DataField="AirlinePass" HeaderText="Airline Pass" SortExpression="[AirlinePass]" />				
				<asp:BoundField DataField="HotelUser" HeaderText="Hotel User" SortExpression="[HotelUser]" />				
				<asp:BoundField DataField="HotelPass" HeaderText="Hotel Pass" SortExpression="[HotelPass]" />				
				<asp:BoundField DataField="CrewUser" HeaderText="Crew User" SortExpression="[CrewUser]" />				
				<asp:BoundField DataField="CrewPass" HeaderText="Crew Pass" SortExpression="[CrewPass]" />				
				<asp:BoundField DataField="PortalPassReset" HeaderText="Portal Pass Reset" SortExpression="[PortalPassReset]" />				
				<asp:BoundField DataField="Active" HeaderText="Active" SortExpression="[Active]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Airlines Found! </b>
				<asp:HyperLink runat="server" ID="hypAirlines" NavigateUrl="~/admin/AirlinesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:AirlinesDataSource ID="AirlinesDataSource7" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:AirlinesProperty Name="Companies"/> 
					<%--<data:AirlinesProperty Name="ScheduleCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:AirlinesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:AirlinesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="LocationTypesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="LocationTypesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Location Types Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="LocationTypesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="LocationTypesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewLocationTypes8" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewLocationTypes8_SelectedIndexChanged"			 			 
			DataSourceID="LocationTypesDataSource8"
			DataKeyNames="LocationTypeId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_LocationTypes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Location Types Found! </b>
				<asp:HyperLink runat="server" ID="hypLocationTypes" NavigateUrl="~/admin/LocationTypesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:LocationTypesDataSource ID="LocationTypesDataSource8" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:LocationTypesProperty Name="Companies"/> 
					<%--<data:LocationTypesProperty Name="LocationsCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:LocationTypesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:LocationTypesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="HqCompaniesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="HqCompaniesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Hq Companies Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="HqCompaniesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="HqCompaniesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewHqCompanies9" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewHqCompanies9_SelectedIndexChanged"			 			 
			DataSourceID="HqCompaniesDataSource9"
			DataKeyNames="HqCompanyId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_HqCompanies.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Hqid" DataNavigateUrlFormatString="HqsEdit.aspx?Hqid={0}" DataNavigateUrlFields="Hqid" DataContainer="HqidSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
			</Columns>
			<EmptyDataTemplate>
				<b>No Hq Companies Found! </b>
				<asp:HyperLink runat="server" ID="hypHqCompanies" NavigateUrl="~/admin/HqCompaniesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:HqCompaniesDataSource ID="HqCompaniesDataSource9" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:HqCompaniesProperty Name="Companies"/> 
					<data:HqCompaniesProperty Name="Hqs"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:HqCompaniesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:HqCompaniesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="VehiclesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="VehiclesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Vehicles Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="VehiclesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="VehiclesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewVehicles10" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewVehicles10_SelectedIndexChanged"			 			 
			DataSourceID="VehiclesDataSource10"
			DataKeyNames="VehicleId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_Vehicles.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<data:HyperLinkField HeaderText="Vehicle Status Id" DataNavigateUrlFormatString="VehicleStatusesEdit.aspx?VehicleStatusId={0}" DataNavigateUrlFields="VehicleStatusId" DataContainer="VehicleStatusIdSource" DataTextField="Code" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Make" HeaderText="Make" SortExpression="[Make]" />				
				<asp:BoundField DataField="Model" HeaderText="Model" SortExpression="[Model]" />				
				<asp:BoundField DataField="Vin" HeaderText="Vin" SortExpression="[VIN]" />				
				<asp:BoundField DataField="PlateNumber" HeaderText="Plate Number" SortExpression="[PlateNumber]" />				
				<asp:BoundField DataField="TollTag" HeaderText="Toll Tag" SortExpression="[TollTag]" />				
				<asp:BoundField DataField="TrackingCode" HeaderText="Tracking Code" SortExpression="[TrackingCode]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Vehicles Found! </b>
				<asp:HyperLink runat="server" ID="hypVehicles" NavigateUrl="~/admin/VehiclesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:VehiclesDataSource ID="VehiclesDataSource10" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:VehiclesProperty Name="Companies"/> 
					<data:VehiclesProperty Name="VehicleStatuses"/> 
					<%--<data:VehiclesProperty Name="VehicleLogsCollection" />--%>
					<%--<data:VehiclesProperty Name="VehicleCitiesCollection" />--%>
					<%--<data:VehiclesProperty Name="ScheduleCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:VehiclesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehiclesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="ScheduleTypesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleTypesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Types Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleTypesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleTypesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleTypes11" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleTypes11_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleTypesDataSource11"
			DataKeyNames="ScheduleTypeId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleTypes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Types Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleTypes" NavigateUrl="~/admin/ScheduleTypesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleTypesDataSource ID="ScheduleTypesDataSource11" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleTypesProperty Name="Companies"/> 
					<%--<data:ScheduleTypesProperty Name="ScheduleCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleTypesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleTypesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="SchedulePanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="SchedulePanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewSchedule12" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewSchedule12_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleDataSource12"
			DataKeyNames="ScheduleId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_Schedule.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<data:HyperLinkField HeaderText="Schedule Status Id" DataNavigateUrlFormatString="ScheduleStatusesEdit.aspx?ScheduleStatusId={0}" DataNavigateUrlFields="ScheduleStatusId" DataContainer="ScheduleStatusIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Schedule Type Id" DataNavigateUrlFormatString="ScheduleTypesEdit.aspx?ScheduleTypeId={0}" DataNavigateUrlFields="ScheduleTypeId" DataContainer="ScheduleTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Transportation Type Id" DataNavigateUrlFormatString="ScheduleTransportationTypesEdit.aspx?TransportationTypeId={0}" DataNavigateUrlFields="TransportationTypeId" DataContainer="TransportationTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Airline Id" DataNavigateUrlFormatString="AirlinesEdit.aspx?AirlineId={0}" DataNavigateUrlFields="AirlineId" DataContainer="AirlineIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<data:HyperLinkField HeaderText="Vehicle Id" DataNavigateUrlFormatString="VehiclesEdit.aspx?VehicleId={0}" DataNavigateUrlFields="VehicleId" DataContainer="VehicleIdSource" DataTextField="Code" />
				<asp:BoundField DataField="ScheduleDate" HeaderText="Schedule Date" SortExpression="[ScheduleDate]" />				
				<asp:BoundField DataField="FlightNo" HeaderText="Flight No" SortExpression="[FlightNo]" />				
				<asp:BoundField DataField="RateOverride" HeaderText="Rate Override" SortExpression="[RateOverride]" />				
				<asp:BoundField DataField="RotationNo" HeaderText="Rotation No" SortExpression="[RotationNo]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Found! </b>
				<asp:HyperLink runat="server" ID="hypSchedule" NavigateUrl="~/admin/ScheduleEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleDataSource ID="ScheduleDataSource12" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleProperty Name="Airlines"/> 
					<data:ScheduleProperty Name="Companies"/> 
					<data:ScheduleProperty Name="Drivers"/> 
					<data:ScheduleProperty Name="ScheduleStatuses"/> 
					<data:ScheduleProperty Name="ScheduleTypes"/> 
					<data:ScheduleProperty Name="ScheduleTransportationTypes"/> 
					<data:ScheduleProperty Name="Vehicles"/> 
					<%--<data:ScheduleProperty Name="ScheduleNotesCollection" />--%>
					<%--<data:ScheduleProperty Name="ScheduleDropoffsCollection" />--%>
					<%--<data:ScheduleProperty Name="ScheduleUsersCollection" />--%>
					<%--<data:ScheduleProperty Name="ScheduleChangesCollection" />--%>
					<%--<data:ScheduleProperty Name="SchedulePickupsCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="UserRolesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="UserRolesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">User Roles Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="UserRolesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="UserRolesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewUserRoles13" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewUserRoles13_SelectedIndexChanged"			 			 
			DataSourceID="UserRolesDataSource13"
			DataKeyNames="RoleId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_UserRoles.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No User Roles Found! </b>
				<asp:HyperLink runat="server" ID="hypUserRoles" NavigateUrl="~/admin/UserRolesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:UserRolesDataSource ID="UserRolesDataSource13" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:UserRolesProperty Name="Companies"/> 
					<%--<data:UserRolesProperty Name="UserCompanyRolesCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:UserRolesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:UserRolesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="CitiesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="CitiesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Cities Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="CitiesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="CitiesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewCities14" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewCities14_SelectedIndexChanged"			 			 
			DataSourceID="CitiesDataSource14"
			DataKeyNames="CityId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_Cities.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Cities Found! </b>
				<asp:HyperLink runat="server" ID="hypCities" NavigateUrl="~/admin/CitiesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:CitiesDataSource ID="CitiesDataSource14" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:CitiesProperty Name="Companies"/> 
					<%--<data:CitiesProperty Name="VehicleCitiesCollection" />--%>
					<%--<data:CitiesProperty Name="DriverCitiesCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:CitiesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:CitiesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="VehicleLogTypesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="VehicleLogTypesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Vehicle Log Types Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="VehicleLogTypesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="VehicleLogTypesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewVehicleLogTypes15" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewVehicleLogTypes15_SelectedIndexChanged"			 			 
			DataSourceID="VehicleLogTypesDataSource15"
			DataKeyNames="VehicleLogTypeId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_VehicleLogTypes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Vehicle Log Types Found! </b>
				<asp:HyperLink runat="server" ID="hypVehicleLogTypes" NavigateUrl="~/admin/VehicleLogTypesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:VehicleLogTypesDataSource ID="VehicleLogTypesDataSource15" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:VehicleLogTypesProperty Name="Companies"/> 
					<%--<data:VehicleLogTypesProperty Name="VehicleLogsCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:VehicleLogTypesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehicleLogTypesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="ScheduleStatusesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleStatusesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Statuses Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleStatusesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleStatusesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleStatuses16" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleStatuses16_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleStatusesDataSource16"
			DataKeyNames="ScheduleStatusId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleStatuses.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Statuses Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleStatuses" NavigateUrl="~/admin/ScheduleStatusesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleStatusesDataSource ID="ScheduleStatusesDataSource16" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleStatusesProperty Name="Companies"/> 
					<%--<data:ScheduleStatusesProperty Name="ScheduleCollection" />--%>
					<%--<data:ScheduleStatusesProperty Name="ScheduleChangesCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleStatusesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleStatusesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="LocationsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="LocationsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Locations Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="LocationsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="LocationsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewLocations17" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewLocations17_SelectedIndexChanged"			 			 
			DataSourceID="LocationsDataSource17"
			DataKeyNames="LocationId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_Locations.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<data:HyperLinkField HeaderText="Location Type Id" DataNavigateUrlFormatString="LocationTypesEdit.aspx?LocationTypeId={0}" DataNavigateUrlFields="LocationTypeId" DataContainer="LocationTypeIdSource" DataTextField="Code" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
				<asp:BoundField DataField="MinutesFromAirport" HeaderText="Minutes From Airport" SortExpression="[MinutesFromAirport]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Locations Found! </b>
				<asp:HyperLink runat="server" ID="hypLocations" NavigateUrl="~/admin/LocationsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:LocationsDataSource ID="LocationsDataSource17" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:LocationsProperty Name="Companies"/> 
					<data:LocationsProperty Name="LocationTypes"/> 
					<%--<data:LocationsProperty Name="ScheduleDropoffsCollection" />--%>
					<%--<data:LocationsProperty Name="RatePickupsCollection" />--%>
					<%--<data:LocationsProperty Name="SchedulePickupsCollection" />--%>
					<%--<data:LocationsProperty Name="RateDropoffsCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:LocationsFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:LocationsDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="ScheduleTransportationTypesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleTransportationTypesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Transportation Types Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleTransportationTypesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleTransportationTypesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleTransportationTypes18" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleTransportationTypes18_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleTransportationTypesDataSource18"
			DataKeyNames="TransportationTypeId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleTransportationTypes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Transportation Types Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleTransportationTypes" NavigateUrl="~/admin/ScheduleTransportationTypesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleTransportationTypesDataSource ID="ScheduleTransportationTypesDataSource18" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleTransportationTypesProperty Name="Companies"/> 
					<%--<data:ScheduleTransportationTypesProperty Name="ScheduleCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleTransportationTypesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleTransportationTypesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="VehicleStatusesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="VehicleStatusesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Vehicle Statuses Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="VehicleStatusesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="VehicleStatusesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewVehicleStatuses19" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewVehicleStatuses19_SelectedIndexChanged"			 			 
			DataSourceID="VehicleStatusesDataSource19"
			DataKeyNames="VehicleStatusId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_VehicleStatuses.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Vehicle Statuses Found! </b>
				<asp:HyperLink runat="server" ID="hypVehicleStatuses" NavigateUrl="~/admin/VehicleStatusesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:VehicleStatusesDataSource ID="VehicleStatusesDataSource19" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:VehicleStatusesProperty Name="Companies"/> 
					<%--<data:VehicleStatusesProperty Name="VehiclesCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:VehicleStatusesFilter  Column="CompanyId" QueryStringField="CompanyId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehicleStatusesDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverInfractionTypes" runat="Server" TargetControlID="DriverInfractionTypesPanel1"
            ExpandControlID="DriverInfractionTypesPanel2" CollapseControlID="DriverInfractionTypesPanel2" Collapsed="True"
            TextLabelID="DriverInfractionTypesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverInfractionTypesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeDrivers" runat="Server" TargetControlID="DriversPanel1"
            ExpandControlID="DriversPanel2" CollapseControlID="DriversPanel2" Collapsed="True"
            TextLabelID="DriversLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriversImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleNoteTypes" runat="Server" TargetControlID="ScheduleNoteTypesPanel1"
            ExpandControlID="ScheduleNoteTypesPanel2" CollapseControlID="ScheduleNoteTypesPanel2" Collapsed="True"
            TextLabelID="ScheduleNoteTypesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleNoteTypesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeRates" runat="Server" TargetControlID="RatesPanel1"
            ExpandControlID="RatesPanel2" CollapseControlID="RatesPanel2" Collapsed="True"
            TextLabelID="RatesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="RatesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverCredentialTypes" runat="Server" TargetControlID="DriverCredentialTypesPanel1"
            ExpandControlID="DriverCredentialTypesPanel2" CollapseControlID="DriverCredentialTypesPanel2" Collapsed="True"
            TextLabelID="DriverCredentialTypesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverCredentialTypesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeUserCompanyRoles" runat="Server" TargetControlID="UserCompanyRolesPanel1"
            ExpandControlID="UserCompanyRolesPanel2" CollapseControlID="UserCompanyRolesPanel2" Collapsed="True"
            TextLabelID="UserCompanyRolesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="UserCompanyRolesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeAirlines" runat="Server" TargetControlID="AirlinesPanel1"
            ExpandControlID="AirlinesPanel2" CollapseControlID="AirlinesPanel2" Collapsed="True"
            TextLabelID="AirlinesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="AirlinesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeLocationTypes" runat="Server" TargetControlID="LocationTypesPanel1"
            ExpandControlID="LocationTypesPanel2" CollapseControlID="LocationTypesPanel2" Collapsed="True"
            TextLabelID="LocationTypesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="LocationTypesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeHqCompanies" runat="Server" TargetControlID="HqCompaniesPanel1"
            ExpandControlID="HqCompaniesPanel2" CollapseControlID="HqCompaniesPanel2" Collapsed="True"
            TextLabelID="HqCompaniesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="HqCompaniesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicles" runat="Server" TargetControlID="VehiclesPanel1"
            ExpandControlID="VehiclesPanel2" CollapseControlID="VehiclesPanel2" Collapsed="True"
            TextLabelID="VehiclesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehiclesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleTypes" runat="Server" TargetControlID="ScheduleTypesPanel1"
            ExpandControlID="ScheduleTypesPanel2" CollapseControlID="ScheduleTypesPanel2" Collapsed="True"
            TextLabelID="ScheduleTypesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleTypesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeSchedule" runat="Server" TargetControlID="SchedulePanel1"
            ExpandControlID="SchedulePanel2" CollapseControlID="SchedulePanel2" Collapsed="True"
            TextLabelID="ScheduleLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeUserRoles" runat="Server" TargetControlID="UserRolesPanel1"
            ExpandControlID="UserRolesPanel2" CollapseControlID="UserRolesPanel2" Collapsed="True"
            TextLabelID="UserRolesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="UserRolesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeCities" runat="Server" TargetControlID="CitiesPanel1"
            ExpandControlID="CitiesPanel2" CollapseControlID="CitiesPanel2" Collapsed="True"
            TextLabelID="CitiesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="CitiesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicleLogTypes" runat="Server" TargetControlID="VehicleLogTypesPanel1"
            ExpandControlID="VehicleLogTypesPanel2" CollapseControlID="VehicleLogTypesPanel2" Collapsed="True"
            TextLabelID="VehicleLogTypesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehicleLogTypesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleStatuses" runat="Server" TargetControlID="ScheduleStatusesPanel1"
            ExpandControlID="ScheduleStatusesPanel2" CollapseControlID="ScheduleStatusesPanel2" Collapsed="True"
            TextLabelID="ScheduleStatusesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleStatusesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeLocations" runat="Server" TargetControlID="LocationsPanel1"
            ExpandControlID="LocationsPanel2" CollapseControlID="LocationsPanel2" Collapsed="True"
            TextLabelID="LocationsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="LocationsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleTransportationTypes" runat="Server" TargetControlID="ScheduleTransportationTypesPanel1"
            ExpandControlID="ScheduleTransportationTypesPanel2" CollapseControlID="ScheduleTransportationTypesPanel2" Collapsed="True"
            TextLabelID="ScheduleTransportationTypesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleTransportationTypesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicleStatuses" runat="Server" TargetControlID="VehicleStatusesPanel1"
            ExpandControlID="VehicleStatusesPanel2" CollapseControlID="VehicleStatusesPanel2" Collapsed="True"
            TextLabelID="VehicleStatusesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehicleStatusesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

