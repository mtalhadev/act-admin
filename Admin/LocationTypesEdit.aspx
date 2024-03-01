<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="LocationTypesEdit.aspx.cs" Inherits="LocationTypesEdit" Title="LocationTypes Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Location Types - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="LocationTypeId" runat="server" DataSourceID="LocationTypesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/LocationTypesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/LocationTypesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>LocationTypes not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:LocationTypesDataSource ID="LocationTypesDataSource" runat="server"
			SelectMethod="GetByLocationTypeId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="LocationTypeId" QueryStringField="LocationTypeId" Type="String" />

			</Parameters>
		</data:LocationTypesDataSource>
		
		<br />

		<asp:Panel ID="LocationsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="LocationsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Locations Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="LocationsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="LocationsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewLocations1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewLocations1_SelectedIndexChanged"			 			 
			DataSourceID="LocationsDataSource1"
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
		
		<data:LocationsDataSource ID="LocationsDataSource1" runat="server" SelectMethod="Find"
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
						<data:LocationsFilter  Column="LocationTypeId" QueryStringField="LocationTypeId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:LocationsDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeLocations" runat="Server" TargetControlID="LocationsPanel1"
            ExpandControlID="LocationsPanel2" CollapseControlID="LocationsPanel2" Collapsed="True"
            TextLabelID="LocationsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="LocationsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

