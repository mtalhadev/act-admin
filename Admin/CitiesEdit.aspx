<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="CitiesEdit.aspx.cs" Inherits="CitiesEdit" Title="Cities Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Cities - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="CityId" runat="server" DataSourceID="CitiesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/CitiesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/CitiesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Cities not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:CitiesDataSource ID="CitiesDataSource" runat="server"
			SelectMethod="GetByCityId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="CityId" QueryStringField="CityId" Type="String" />

			</Parameters>
		</data:CitiesDataSource>
		
		<br />

		<asp:Panel ID="VehicleCitiesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="VehicleCitiesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Vehicle Cities Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="VehicleCitiesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="VehicleCitiesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewVehicleCities1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewVehicleCities1_SelectedIndexChanged"			 			 
			DataSourceID="VehicleCitiesDataSource1"
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
		
		<data:VehicleCitiesDataSource ID="VehicleCitiesDataSource1" runat="server" SelectMethod="Find"
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
						<data:VehicleCitiesFilter  Column="CityId" QueryStringField="CityId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:VehicleCitiesDataSource>		
		
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
		<data:EntityGridView ID="GridViewDriverCities2" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverCities2_SelectedIndexChanged"			 			 
			DataSourceID="DriverCitiesDataSource2"
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
		
		<data:DriverCitiesDataSource ID="DriverCitiesDataSource2" runat="server" SelectMethod="Find"
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
						<data:DriverCitiesFilter  Column="CityId" QueryStringField="CityId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverCitiesDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeVehicleCities" runat="Server" TargetControlID="VehicleCitiesPanel1"
            ExpandControlID="VehicleCitiesPanel2" CollapseControlID="VehicleCitiesPanel2" Collapsed="True"
            TextLabelID="VehicleCitiesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="VehicleCitiesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverCities" runat="Server" TargetControlID="DriverCitiesPanel1"
            ExpandControlID="DriverCitiesPanel2" CollapseControlID="DriverCitiesPanel2" Collapsed="True"
            TextLabelID="DriverCitiesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverCitiesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

