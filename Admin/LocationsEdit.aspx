<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="LocationsEdit.aspx.cs" Inherits="LocationsEdit" Title="Locations Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Locations - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="LocationId" runat="server" DataSourceID="LocationsDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/LocationsFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/LocationsFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Locations not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:LocationsDataSource ID="LocationsDataSource" runat="server"
			SelectMethod="GetByLocationId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="LocationId" QueryStringField="LocationId" Type="String" />

			</Parameters>
		</data:LocationsDataSource>
		
		<br />

		<asp:Panel ID="ScheduleDropoffsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleDropoffsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Dropoffs Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleDropoffsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleDropoffsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleDropoffs1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleDropoffs1_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleDropoffsDataSource1"
			DataKeyNames="ScheduleDropoffId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleDropoffs.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Schedule Id" DataNavigateUrlFormatString="ScheduleEdit.aspx?ScheduleId={0}" DataNavigateUrlFields="ScheduleId" DataContainer="ScheduleIdSource" DataTextField="ScheduleDate" />
				<data:HyperLinkField HeaderText="Location Id" DataNavigateUrlFormatString="LocationsEdit.aspx?LocationId={0}" DataNavigateUrlFields="LocationId" DataContainer="LocationIdSource" DataTextField="Code" />
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Dropoffs Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleDropoffs" NavigateUrl="~/admin/ScheduleDropoffsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleDropoffsDataSource ID="ScheduleDropoffsDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleDropoffsProperty Name="Locations"/> 
					<data:ScheduleDropoffsProperty Name="Schedule"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleDropoffsFilter  Column="LocationId" QueryStringField="LocationId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleDropoffsDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="RatePickupsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="RatePickupsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Rate Pickups Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="RatePickupsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="RatePickupsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewRatePickups2" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewRatePickups2_SelectedIndexChanged"			 			 
			DataSourceID="RatePickupsDataSource2"
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
		
		<data:RatePickupsDataSource ID="RatePickupsDataSource2" runat="server" SelectMethod="Find"
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
						<data:RatePickupsFilter  Column="LocationId" QueryStringField="LocationId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:RatePickupsDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="SchedulePickupsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="SchedulePickupsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Pickups Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="SchedulePickupsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="SchedulePickupsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewSchedulePickups3" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewSchedulePickups3_SelectedIndexChanged"			 			 
			DataSourceID="SchedulePickupsDataSource3"
			DataKeyNames="SchedulePickupId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_SchedulePickups.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Schedule Id" DataNavigateUrlFormatString="ScheduleEdit.aspx?ScheduleId={0}" DataNavigateUrlFields="ScheduleId" DataContainer="ScheduleIdSource" DataTextField="ScheduleDate" />
				<data:HyperLinkField HeaderText="Location Id" DataNavigateUrlFormatString="LocationsEdit.aspx?LocationId={0}" DataNavigateUrlFields="LocationId" DataContainer="LocationIdSource" DataTextField="Code" />
				<asp:BoundField DataField="Pilots" HeaderText="Pilots" SortExpression="[Pilots]" />				
				<asp:BoundField DataField="FlightAttendants" HeaderText="Flight Attendants" SortExpression="[FlightAttendants]" />				
				<asp:BoundField DataField="Passengers" HeaderText="Passengers" SortExpression="[Passengers]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Pickups Found! </b>
				<asp:HyperLink runat="server" ID="hypSchedulePickups" NavigateUrl="~/admin/SchedulePickupsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:SchedulePickupsDataSource ID="SchedulePickupsDataSource3" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:SchedulePickupsProperty Name="Locations"/> 
					<data:SchedulePickupsProperty Name="Schedule"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:SchedulePickupsFilter  Column="LocationId" QueryStringField="LocationId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:SchedulePickupsDataSource>		
		
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
		<data:EntityGridView ID="GridViewRateDropoffs4" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewRateDropoffs4_SelectedIndexChanged"			 			 
			DataSourceID="RateDropoffsDataSource4"
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
		
		<data:RateDropoffsDataSource ID="RateDropoffsDataSource4" runat="server" SelectMethod="Find"
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
						<data:RateDropoffsFilter  Column="LocationId" QueryStringField="LocationId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:RateDropoffsDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleDropoffs" runat="Server" TargetControlID="ScheduleDropoffsPanel1"
            ExpandControlID="ScheduleDropoffsPanel2" CollapseControlID="ScheduleDropoffsPanel2" Collapsed="True"
            TextLabelID="ScheduleDropoffsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleDropoffsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeRatePickups" runat="Server" TargetControlID="RatePickupsPanel1"
            ExpandControlID="RatePickupsPanel2" CollapseControlID="RatePickupsPanel2" Collapsed="True"
            TextLabelID="RatePickupsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="RatePickupsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeSchedulePickups" runat="Server" TargetControlID="SchedulePickupsPanel1"
            ExpandControlID="SchedulePickupsPanel2" CollapseControlID="SchedulePickupsPanel2" Collapsed="True"
            TextLabelID="SchedulePickupsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="SchedulePickupsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeRateDropoffs" runat="Server" TargetControlID="RateDropoffsPanel1"
            ExpandControlID="RateDropoffsPanel2" CollapseControlID="RateDropoffsPanel2" Collapsed="True"
            TextLabelID="RateDropoffsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="RateDropoffsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

