﻿<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="AirlinesEdit.aspx.cs" Inherits="AirlinesEdit" Title="Airlines Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Airlines - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="AirlineId" runat="server" DataSourceID="AirlinesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/AirlinesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/AirlinesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Airlines not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:AirlinesDataSource ID="AirlinesDataSource" runat="server"
			SelectMethod="GetByAirlineId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="AirlineId" QueryStringField="AirlineId" Type="String" />

			</Parameters>
		</data:AirlinesDataSource>
		
		<br />

		<asp:Panel ID="SchedulePanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="SchedulePanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewSchedule1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewSchedule1_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleDataSource1"
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
		
		<data:ScheduleDataSource ID="ScheduleDataSource1" runat="server" SelectMethod="Find"
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
						<data:ScheduleFilter  Column="AirlineId" QueryStringField="AirlineId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeSchedule" runat="Server" TargetControlID="SchedulePanel1"
            ExpandControlID="SchedulePanel2" CollapseControlID="SchedulePanel2" Collapsed="True"
            TextLabelID="ScheduleLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

