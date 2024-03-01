<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="VehicleStatusesEdit.aspx.cs" Inherits="VehicleStatusesEdit" Title="VehicleStatuses Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Vehicle Statuses - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="VehicleStatusId" runat="server" DataSourceID="VehicleStatusesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/VehicleStatusesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/VehicleStatusesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>VehicleStatuses not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:VehicleStatusesDataSource ID="VehicleStatusesDataSource" runat="server"
			SelectMethod="GetByVehicleStatusId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="VehicleStatusId" QueryStringField="VehicleStatusId" Type="String" />

			</Parameters>
		</data:VehicleStatusesDataSource>
		
		<br />

		<asp:Panel ID="VehiclesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="VehiclesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Vehicles Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="VehiclesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="VehiclesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewVehicles1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewVehicles1_SelectedIndexChanged"			 			 
			DataSourceID="VehiclesDataSource1"
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
		
		<data:VehiclesDataSource ID="VehiclesDataSource1" runat="server" SelectMethod="Find"
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
						<data:VehiclesFilter  Column="VehicleStatusId" QueryStringField="VehicleStatusId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehiclesDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicles" runat="Server" TargetControlID="VehiclesPanel1"
            ExpandControlID="VehiclesPanel2" CollapseControlID="VehiclesPanel2" Collapsed="True"
            TextLabelID="VehiclesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehiclesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

