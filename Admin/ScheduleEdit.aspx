<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleEdit.aspx.cs" Inherits="ScheduleEdit" Title="Schedule Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="ScheduleId" runat="server" DataSourceID="ScheduleDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Schedule not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:ScheduleDataSource ID="ScheduleDataSource" runat="server"
			SelectMethod="GetByScheduleId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="ScheduleId" QueryStringField="ScheduleId" Type="String" />

			</Parameters>
		</data:ScheduleDataSource>
		
		<br />

		<asp:Panel ID="ScheduleNotesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleNotesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Notes Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleNotesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleNotesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleNotes1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleNotes1_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleNotesDataSource1"
			DataKeyNames="ScheduleNoteId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleNotes.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Schedule Note Type Id" DataNavigateUrlFormatString="ScheduleNoteTypesEdit.aspx?ScheduleNoteTypeId={0}" DataNavigateUrlFields="ScheduleNoteTypeId" DataContainer="ScheduleNoteTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Schedule Id" DataNavigateUrlFormatString="ScheduleEdit.aspx?ScheduleId={0}" DataNavigateUrlFields="ScheduleId" DataContainer="ScheduleIdSource" DataTextField="ScheduleDate" />
				<asp:BoundField DataField="Memo" HeaderText="Memo" SortExpression="[Memo]" />				
				<asp:BoundField DataField="SafeNamePrivate" HeaderText="Private" SortExpression="[Private]" />				
				<asp:BoundField DataField="Active" HeaderText="Active" SortExpression="[Active]" />				
				<asp:BoundField DataField="CreatedDate" HeaderText="Created Date" SortExpression="[CreatedDate]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Notes Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleNotes" NavigateUrl="~/admin/ScheduleNotesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleNotesDataSource ID="ScheduleNotesDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleNotesProperty Name="Schedule"/> 
					<data:ScheduleNotesProperty Name="ScheduleNoteTypes"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleNotesFilter  Column="ScheduleId" QueryStringField="ScheduleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleNotesDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="ScheduleDropoffsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleDropoffsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Dropoffs Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleDropoffsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleDropoffsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleDropoffs2" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleDropoffs2_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleDropoffsDataSource2"
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
		
		<data:ScheduleDropoffsDataSource ID="ScheduleDropoffsDataSource2" runat="server" SelectMethod="Find"
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
						<data:ScheduleDropoffsFilter  Column="ScheduleId" QueryStringField="ScheduleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleDropoffsDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="ScheduleUsersPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleUsersImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Users Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleUsersLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleUsersPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleUsers3" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleUsers3_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleUsersDataSource3"
			DataKeyNames="ScheduleUserId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleUsers.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Schedule Id" DataNavigateUrlFormatString="ScheduleEdit.aspx?ScheduleId={0}" DataNavigateUrlFields="ScheduleId" DataContainer="ScheduleIdSource" DataTextField="ScheduleDate" />
				<data:HyperLinkField HeaderText="User Id" DataNavigateUrlFormatString="UsersEdit.aspx?UserId={0}" DataNavigateUrlFields="UserId" DataContainer="UserIdSource" DataTextField="Email" />
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Users Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleUsers" NavigateUrl="~/admin/ScheduleUsersEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleUsersDataSource ID="ScheduleUsersDataSource3" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleUsersProperty Name="Schedule"/> 
					<data:ScheduleUsersProperty Name="Users"/> 
					<%--<data:ScheduleUsersProperty Name="ScheduleChangeUsersCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleUsersFilter  Column="ScheduleId" QueryStringField="ScheduleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleUsersDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="ScheduleChangesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleChangesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Changes Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleChangesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleChangesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleChanges4" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleChanges4_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleChangesDataSource4"
			DataKeyNames="ScheduleChangeId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleChanges.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Schedule Id" DataNavigateUrlFormatString="ScheduleEdit.aspx?ScheduleId={0}" DataNavigateUrlFields="ScheduleId" DataContainer="ScheduleIdSource" DataTextField="ScheduleDate" />
				<data:HyperLinkField HeaderText="Schedule Status Id" DataNavigateUrlFormatString="ScheduleStatusesEdit.aspx?ScheduleStatusId={0}" DataNavigateUrlFields="ScheduleStatusId" DataContainer="ScheduleStatusIdSource" DataTextField="Code" />
				<asp:BoundField DataField="ScheduleDate" HeaderText="Schedule Date" SortExpression="[ScheduleDate]" />				
				<asp:BoundField DataField="FlightNo" HeaderText="Flight No" SortExpression="[FlightNo]" />				
				<asp:BoundField DataField="Pilots" HeaderText="Pilots" SortExpression="[Pilots]" />				
				<asp:BoundField DataField="FlightAttendants" HeaderText="Flight Attendants" SortExpression="[FlightAttendants]" />				
				<asp:BoundField DataField="Passengers" HeaderText="Passengers" SortExpression="[Passengers]" />				
				<asp:BoundField DataField="Approved" HeaderText="Approved" SortExpression="[Approved]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Changes Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleChanges" NavigateUrl="~/admin/ScheduleChangesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleChangesDataSource ID="ScheduleChangesDataSource4" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleChangesProperty Name="Schedule"/> 
					<data:ScheduleChangesProperty Name="ScheduleStatuses"/> 
					<%--<data:ScheduleChangesProperty Name="ScheduleChangeUsersCollection" />--%>
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleChangesFilter  Column="ScheduleId" QueryStringField="ScheduleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleChangesDataSource>		
		
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
		<data:EntityGridView ID="GridViewSchedulePickups5" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewSchedulePickups5_SelectedIndexChanged"			 			 
			DataSourceID="SchedulePickupsDataSource5"
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
		
		<data:SchedulePickupsDataSource ID="SchedulePickupsDataSource5" runat="server" SelectMethod="Find"
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
						<data:SchedulePickupsFilter  Column="ScheduleId" QueryStringField="ScheduleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:SchedulePickupsDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleNotes" runat="Server" TargetControlID="ScheduleNotesPanel1"
            ExpandControlID="ScheduleNotesPanel2" CollapseControlID="ScheduleNotesPanel2" Collapsed="True"
            TextLabelID="ScheduleNotesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleNotesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleDropoffs" runat="Server" TargetControlID="ScheduleDropoffsPanel1"
            ExpandControlID="ScheduleDropoffsPanel2" CollapseControlID="ScheduleDropoffsPanel2" Collapsed="True"
            TextLabelID="ScheduleDropoffsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleDropoffsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleUsers" runat="Server" TargetControlID="ScheduleUsersPanel1"
            ExpandControlID="ScheduleUsersPanel2" CollapseControlID="ScheduleUsersPanel2" Collapsed="True"
            TextLabelID="ScheduleUsersLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleUsersImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleChanges" runat="Server" TargetControlID="ScheduleChangesPanel1"
            ExpandControlID="ScheduleChangesPanel2" CollapseControlID="ScheduleChangesPanel2" Collapsed="True"
            TextLabelID="ScheduleChangesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleChangesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeSchedulePickups" runat="Server" TargetControlID="SchedulePickupsPanel1"
            ExpandControlID="SchedulePickupsPanel2" CollapseControlID="SchedulePickupsPanel2" Collapsed="True"
            TextLabelID="SchedulePickupsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="SchedulePickupsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

