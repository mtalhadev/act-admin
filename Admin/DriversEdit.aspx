<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="DriversEdit.aspx.cs" Inherits="DriversEdit" Title="Drivers Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Drivers - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="DriverId" runat="server" DataSourceID="DriversDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/DriversFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/DriversFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Drivers not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:DriversDataSource ID="DriversDataSource" runat="server"
			SelectMethod="GetByDriverId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="DriverId" QueryStringField="DriverId" Type="String" />

			</Parameters>
		</data:DriversDataSource>
		
		<br />

		<asp:Panel ID="DriverCredentialsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverCredentialsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Credentials Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverCredentialsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverCredentialsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverCredentials1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverCredentials1_SelectedIndexChanged"			 			 
			DataSourceID="DriverCredentialsDataSource1"
			DataKeyNames="DriverCredentialId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_DriverCredentials.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<data:HyperLinkField HeaderText="Credential Type Id" DataNavigateUrlFormatString="DriverCredentialTypesEdit.aspx?CredentialTypeId={0}" DataNavigateUrlFields="CredentialTypeId" DataContainer="CredentialTypeIdSource" DataTextField="Code" />
				<asp:BoundField DataField="Number" HeaderText="Number" SortExpression="[Number]" />				
				<asp:BoundField DataField="Expiration" HeaderText="Expiration" SortExpression="[Expiration]" />				
				<asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="[Photo]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Driver Credentials Found! </b>
				<asp:HyperLink runat="server" ID="hypDriverCredentials" NavigateUrl="~/admin/DriverCredentialsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriverCredentialsDataSource ID="DriverCredentialsDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverCredentialsProperty Name="DriverCredentialTypes"/> 
					<data:DriverCredentialsProperty Name="Drivers"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriverCredentialsFilter  Column="DriverId" QueryStringField="DriverId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverCredentialsDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="VehicleLogsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="VehicleLogsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Vehicle Logs Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="VehicleLogsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="VehicleLogsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewVehicleLogs2" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewVehicleLogs2_SelectedIndexChanged"			 			 
			DataSourceID="VehicleLogsDataSource2"
			DataKeyNames="VehicleLogId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_VehicleLogs.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Vehicle Log Type Id" DataNavigateUrlFormatString="VehicleLogTypesEdit.aspx?VehicleLogTypeId={0}" DataNavigateUrlFields="VehicleLogTypeId" DataContainer="VehicleLogTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Vehicle Id" DataNavigateUrlFormatString="VehiclesEdit.aspx?VehicleId={0}" DataNavigateUrlFields="VehicleId" DataContainer="VehicleIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="User Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="UserIdSource" DataTextField="DriverCode" />
				<asp:BoundField DataField="LogDate" HeaderText="Log Date" SortExpression="[LogDate]" />				
				<asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="[Mileage]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Vehicle Logs Found! </b>
				<asp:HyperLink runat="server" ID="hypVehicleLogs" NavigateUrl="~/admin/VehicleLogsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:VehicleLogsDataSource ID="VehicleLogsDataSource2" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:VehicleLogsProperty Name="Drivers"/> 
					<data:VehicleLogsProperty Name="VehicleLogTypes"/> 
					<data:VehicleLogsProperty Name="Vehicles"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:VehicleLogsFilter  Column="UserId" QueryStringField="DriverId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehicleLogsDataSource>		
		
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
		<data:EntityGridView ID="GridViewSchedule3" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewSchedule3_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleDataSource3"
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
		
		<data:ScheduleDataSource ID="ScheduleDataSource3" runat="server" SelectMethod="Find"
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
						<data:ScheduleFilter  Column="DriverId" QueryStringField="DriverId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="DriverInfractionsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverInfractionsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Infractions Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverInfractionsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverInfractionsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverInfractions4" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverInfractions4_SelectedIndexChanged"			 			 
			DataSourceID="DriverInfractionsDataSource4"
			DataKeyNames="DriverInfractionId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_DriverInfractions.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Infraction Type Id" DataNavigateUrlFormatString="DriverInfractionTypesEdit.aspx?InfractionTypeId={0}" DataNavigateUrlFields="InfractionTypeId" DataContainer="InfractionTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<asp:BoundField DataField="InfractionDate" HeaderText="Infraction Date" SortExpression="[InfractionDate]" />				
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Driver Infractions Found! </b>
				<asp:HyperLink runat="server" ID="hypDriverInfractions" NavigateUrl="~/admin/DriverInfractionsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriverInfractionsDataSource ID="DriverInfractionsDataSource4" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverInfractionsProperty Name="Drivers"/> 
					<data:DriverInfractionsProperty Name="DriverInfractionTypes"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriverInfractionsFilter  Column="DriverId" QueryStringField="DriverId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverInfractionsDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="DriverMedicalPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverMedicalImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Medical Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverMedicalLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverMedicalPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverMedical5" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverMedical5_SelectedIndexChanged"			 			 
			DataSourceID="DriverMedicalDataSource5"
			DataKeyNames="DriverMedicalId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_DriverMedical.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<asp:BoundField DataField="EvaluationDate" HeaderText="Evaluation Date" SortExpression="[EvaluationDate]" />				
				<asp:BoundField DataField="EvalulationNotes" HeaderText="Evalulation Notes" SortExpression="[EvalulationNotes]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Driver Medical Found! </b>
				<asp:HyperLink runat="server" ID="hypDriverMedical" NavigateUrl="~/admin/DriverMedicalEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriverMedicalDataSource ID="DriverMedicalDataSource5" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverMedicalProperty Name="Drivers"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriverMedicalFilter  Column="DriverId" QueryStringField="DriverId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverMedicalDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="DriverNotesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverNotesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Notes Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverNotesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverNotesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverNotes6" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverNotes6_SelectedIndexChanged"			 			 
			DataSourceID="DriverNotesDataSource6"
			DataKeyNames="DriverNoteId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_DriverNotes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<asp:BoundField DataField="Memo" HeaderText="Memo" SortExpression="[Memo]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Driver Notes Found! </b>
				<asp:HyperLink runat="server" ID="hypDriverNotes" NavigateUrl="~/admin/DriverNotesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriverNotesDataSource ID="DriverNotesDataSource6" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverNotesProperty Name="Drivers"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriverNotesFilter  Column="DriverId" QueryStringField="DriverId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverNotesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="DriverCitiesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverCitiesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Cities Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverCitiesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverCitiesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverCities7" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverCities7_SelectedIndexChanged"			 			 
			DataSourceID="DriverCitiesDataSource7"
			DataKeyNames="DriverCityId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_DriverCities.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<data:HyperLinkField HeaderText="City Id" DataNavigateUrlFormatString="CitiesEdit.aspx?CityId={0}" DataNavigateUrlFields="CityId" DataContainer="CityIdSource" DataTextField="Code" />
			</Columns>
			<EmptyDataTemplate>
				<b>No Driver Cities Found! </b>
				<asp:HyperLink runat="server" ID="hypDriverCities" NavigateUrl="~/admin/DriverCitiesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriverCitiesDataSource ID="DriverCitiesDataSource7" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverCitiesProperty Name="Cities"/> 
					<data:DriverCitiesProperty Name="Drivers"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriverCitiesFilter  Column="DriverId" QueryStringField="DriverId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverCitiesDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverCredentials" runat="Server" TargetControlID="DriverCredentialsPanel1"
            ExpandControlID="DriverCredentialsPanel2" CollapseControlID="DriverCredentialsPanel2" Collapsed="True"
            TextLabelID="DriverCredentialsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverCredentialsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicleLogs" runat="Server" TargetControlID="VehicleLogsPanel1"
            ExpandControlID="VehicleLogsPanel2" CollapseControlID="VehicleLogsPanel2" Collapsed="True"
            TextLabelID="VehicleLogsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehicleLogsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeSchedule" runat="Server" TargetControlID="SchedulePanel1"
            ExpandControlID="SchedulePanel2" CollapseControlID="SchedulePanel2" Collapsed="True"
            TextLabelID="ScheduleLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverInfractions" runat="Server" TargetControlID="DriverInfractionsPanel1"
            ExpandControlID="DriverInfractionsPanel2" CollapseControlID="DriverInfractionsPanel2" Collapsed="True"
            TextLabelID="DriverInfractionsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverInfractionsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverMedical" runat="Server" TargetControlID="DriverMedicalPanel1"
            ExpandControlID="DriverMedicalPanel2" CollapseControlID="DriverMedicalPanel2" Collapsed="True"
            TextLabelID="DriverMedicalLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverMedicalImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverNotes" runat="Server" TargetControlID="DriverNotesPanel1"
            ExpandControlID="DriverNotesPanel2" CollapseControlID="DriverNotesPanel2" Collapsed="True"
            TextLabelID="DriverNotesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverNotesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverCities" runat="Server" TargetControlID="DriverCitiesPanel1"
            ExpandControlID="DriverCitiesPanel2" CollapseControlID="DriverCitiesPanel2" Collapsed="True"
            TextLabelID="DriverCitiesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverCitiesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

