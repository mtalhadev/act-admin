<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="VehiclesEdit.aspx.cs" Inherits="VehiclesEdit" Title="Vehicles Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Vehicles - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="VehicleId" runat="server" DataSourceID="VehiclesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/VehiclesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/VehiclesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Vehicles not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:VehiclesDataSource ID="VehiclesDataSource" runat="server"
			SelectMethod="GetByVehicleId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="VehicleId" QueryStringField="VehicleId" Type="String" />

			</Parameters>
		</data:VehiclesDataSource>
		
		<br />

		<asp:Panel ID="VehicleLogsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="VehicleLogsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Vehicle Logs Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="VehicleLogsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="VehicleLogsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewVehicleLogs1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewVehicleLogs1_SelectedIndexChanged"			 			 
			DataSourceID="VehicleLogsDataSource1"
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
		
		<data:VehicleLogsDataSource ID="VehicleLogsDataSource1" runat="server" SelectMethod="Find"
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
						<data:VehicleLogsFilter  Column="VehicleId" QueryStringField="VehicleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehicleLogsDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="VehicleCitiesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="VehicleCitiesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Vehicle Cities Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="VehicleCitiesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="VehicleCitiesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewVehicleCities2" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewVehicleCities2_SelectedIndexChanged"			 			 
			DataSourceID="VehicleCitiesDataSource2"
			DataKeyNames="VehicleCityId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_VehicleCities.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Vehicle Id" DataNavigateUrlFormatString="VehiclesEdit.aspx?VehicleId={0}" DataNavigateUrlFields="VehicleId" DataContainer="VehicleIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="City Id" DataNavigateUrlFormatString="CitiesEdit.aspx?CityId={0}" DataNavigateUrlFields="CityId" DataContainer="CityIdSource" DataTextField="Code" />
			</Columns>
			<EmptyDataTemplate>
				<b>No Vehicle Cities Found! </b>
				<asp:HyperLink runat="server" ID="hypVehicleCities" NavigateUrl="~/admin/VehicleCitiesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:VehicleCitiesDataSource ID="VehicleCitiesDataSource2" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:VehicleCitiesProperty Name="Cities"/> 
					<data:VehicleCitiesProperty Name="Vehicles"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:VehicleCitiesFilter  Column="VehicleId" QueryStringField="VehicleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehicleCitiesDataSource>		
		
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
						<data:ScheduleFilter  Column="VehicleId" QueryStringField="VehicleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicleLogs" runat="Server" TargetControlID="VehicleLogsPanel1"
            ExpandControlID="VehicleLogsPanel2" CollapseControlID="VehicleLogsPanel2" Collapsed="True"
            TextLabelID="VehicleLogsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehicleLogsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicleCities" runat="Server" TargetControlID="VehicleCitiesPanel1"
            ExpandControlID="VehicleCitiesPanel2" CollapseControlID="VehicleCitiesPanel2" Collapsed="True"
            TextLabelID="VehicleCitiesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehicleCitiesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeSchedule" runat="Server" TargetControlID="SchedulePanel1"
            ExpandControlID="SchedulePanel2" CollapseControlID="SchedulePanel2" Collapsed="True"
            TextLabelID="ScheduleLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

