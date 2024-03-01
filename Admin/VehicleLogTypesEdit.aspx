<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="VehicleLogTypesEdit.aspx.cs" Inherits="VehicleLogTypesEdit" Title="VehicleLogTypes Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Vehicle Log Types - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="VehicleLogTypeId" runat="server" DataSourceID="VehicleLogTypesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/VehicleLogTypesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/VehicleLogTypesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>VehicleLogTypes not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:VehicleLogTypesDataSource ID="VehicleLogTypesDataSource" runat="server"
			SelectMethod="GetByVehicleLogTypeId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="VehicleLogTypeId" QueryStringField="VehicleLogTypeId" Type="String" />

			</Parameters>
		</data:VehicleLogTypesDataSource>
		
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
						<data:VehicleLogsFilter  Column="VehicleLogTypeId" QueryStringField="VehicleLogTypeId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehicleLogsDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicleLogs" runat="Server" TargetControlID="VehicleLogsPanel1"
            ExpandControlID="VehicleLogsPanel2" CollapseControlID="VehicleLogsPanel2" Collapsed="True"
            TextLabelID="VehicleLogsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehicleLogsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

