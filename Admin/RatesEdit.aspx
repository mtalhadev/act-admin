<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="RatesEdit.aspx.cs" Inherits="RatesEdit" Title="Rates Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Rates - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="RateId" runat="server" DataSourceID="RatesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/RatesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/RatesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Rates not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:RatesDataSource ID="RatesDataSource" runat="server"
			SelectMethod="GetByRateId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="RateId" QueryStringField="RateId" Type="String" />

			</Parameters>
		</data:RatesDataSource>
		
		<br />

		<asp:Panel ID="RatePickupsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="RatePickupsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Rate Pickups Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="RatePickupsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="RatePickupsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewRatePickups1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewRatePickups1_SelectedIndexChanged"			 			 
			DataSourceID="RatePickupsDataSource1"
			DataKeyNames="RatePickupId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_RatePickups.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Rate Id" DataNavigateUrlFormatString="RatesEdit.aspx?RateId={0}" DataNavigateUrlFields="RateId" DataContainer="RateIdSource" DataTextField="Description" />
				<data:HyperLinkField HeaderText="Location Id" DataNavigateUrlFormatString="LocationsEdit.aspx?LocationId={0}" DataNavigateUrlFields="LocationId" DataContainer="LocationIdSource" DataTextField="Code" />
			</Columns>
			<EmptyDataTemplate>
				<b>No Rate Pickups Found! </b>
				<asp:HyperLink runat="server" ID="hypRatePickups" NavigateUrl="~/admin/RatePickupsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:RatePickupsDataSource ID="RatePickupsDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:RatePickupsProperty Name="Locations"/> 
					<data:RatePickupsProperty Name="Rates"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:RatePickupsFilter  Column="RateId" QueryStringField="RateId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:RatePickupsDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="RateDropoffsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="RateDropoffsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Rate Dropoffs Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="RateDropoffsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="RateDropoffsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewRateDropoffs2" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewRateDropoffs2_SelectedIndexChanged"			 			 
			DataSourceID="RateDropoffsDataSource2"
			DataKeyNames="RateDropoffId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_RateDropoffs.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Rate Id" DataNavigateUrlFormatString="RatesEdit.aspx?RateId={0}" DataNavigateUrlFields="RateId" DataContainer="RateIdSource" DataTextField="Description" />
				<data:HyperLinkField HeaderText="Location Id" DataNavigateUrlFormatString="LocationsEdit.aspx?LocationId={0}" DataNavigateUrlFields="LocationId" DataContainer="LocationIdSource" DataTextField="Code" />
			</Columns>
			<EmptyDataTemplate>
				<b>No Rate Dropoffs Found! </b>
				<asp:HyperLink runat="server" ID="hypRateDropoffs" NavigateUrl="~/admin/RateDropoffsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:RateDropoffsDataSource ID="RateDropoffsDataSource2" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:RateDropoffsProperty Name="Locations"/> 
					<data:RateDropoffsProperty Name="Rates"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:RateDropoffsFilter  Column="RateId" QueryStringField="RateId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:RateDropoffsDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeRatePickups" runat="Server" TargetControlID="RatePickupsPanel1"
            ExpandControlID="RatePickupsPanel2" CollapseControlID="RatePickupsPanel2" Collapsed="True"
            TextLabelID="RatePickupsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="RatePickupsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeRateDropoffs" runat="Server" TargetControlID="RateDropoffsPanel1"
            ExpandControlID="RateDropoffsPanel2" CollapseControlID="RateDropoffsPanel2" Collapsed="True"
            TextLabelID="RateDropoffsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="RateDropoffsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

