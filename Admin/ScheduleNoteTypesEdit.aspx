<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleNoteTypesEdit.aspx.cs" Inherits="ScheduleNoteTypesEdit" Title="ScheduleNoteTypes Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Note Types - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="ScheduleNoteTypeId" runat="server" DataSourceID="ScheduleNoteTypesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleNoteTypesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleNoteTypesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>ScheduleNoteTypes not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:ScheduleNoteTypesDataSource ID="ScheduleNoteTypesDataSource" runat="server"
			SelectMethod="GetByScheduleNoteTypeId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="ScheduleNoteTypeId" QueryStringField="ScheduleNoteTypeId" Type="String" />

			</Parameters>
		</data:ScheduleNoteTypesDataSource>
		
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
						<data:ScheduleNotesFilter  Column="ScheduleNoteTypeId" QueryStringField="ScheduleNoteTypeId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleNotesDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleNotes" runat="Server" TargetControlID="ScheduleNotesPanel1"
            ExpandControlID="ScheduleNotesPanel2" CollapseControlID="ScheduleNotesPanel2" Collapsed="True"
            TextLabelID="ScheduleNotesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleNotesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

