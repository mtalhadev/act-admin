<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="DriverInfractionTypesEdit.aspx.cs" Inherits="DriverInfractionTypesEdit" Title="DriverInfractionTypes Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Driver Infraction Types - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="InfractionTypeId" runat="server" DataSourceID="DriverInfractionTypesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/DriverInfractionTypesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/DriverInfractionTypesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>DriverInfractionTypes not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:DriverInfractionTypesDataSource ID="DriverInfractionTypesDataSource" runat="server"
			SelectMethod="GetByInfractionTypeId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="InfractionTypeId" QueryStringField="InfractionTypeId" Type="String" />

			</Parameters>
		</data:DriverInfractionTypesDataSource>
		
		<br />

		<asp:Panel ID="DriverInfractionsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverInfractionsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Infractions Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverInfractionsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverInfractionsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverInfractions1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverInfractions1_SelectedIndexChanged"			 			 
			DataSourceID="DriverInfractionsDataSource1"
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
		
		<data:DriverInfractionsDataSource ID="DriverInfractionsDataSource1" runat="server" SelectMethod="Find"
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
						<data:DriverInfractionsFilter  Column="InfractionTypeId" QueryStringField="InfractionTypeId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverInfractionsDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverInfractions" runat="Server" TargetControlID="DriverInfractionsPanel1"
            ExpandControlID="DriverInfractionsPanel2" CollapseControlID="DriverInfractionsPanel2" Collapsed="True"
            TextLabelID="DriverInfractionsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverInfractionsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

