<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleChangesEdit.aspx.cs" Inherits="ScheduleChangesEdit" Title="ScheduleChanges Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Changes - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="ScheduleChangeId" runat="server" DataSourceID="ScheduleChangesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleChangesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleChangesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>ScheduleChanges not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:ScheduleChangesDataSource ID="ScheduleChangesDataSource" runat="server"
			SelectMethod="GetByScheduleChangeId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="ScheduleChangeId" QueryStringField="ScheduleChangeId" Type="String" />

			</Parameters>
		</data:ScheduleChangesDataSource>
		
		<br />

		<asp:Panel ID="ScheduleChangeUsersPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleChangeUsersImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Change Users Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleChangeUsersLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleChangeUsersPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleChangeUsers1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleChangeUsers1_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleChangeUsersDataSource1"
			DataKeyNames="ScheduleChangeUsers"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_ScheduleChangeUsers.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Schedule Change Id" DataNavigateUrlFormatString="ScheduleChangesEdit.aspx?ScheduleChangeId={0}" DataNavigateUrlFields="ScheduleChangeId" DataContainer="ScheduleChangeIdSource" DataTextField="ScheduleDate" />
				<data:HyperLinkField HeaderText="Schedule User Id" DataNavigateUrlFormatString="ScheduleUsersEdit.aspx?ScheduleUserId={0}" DataNavigateUrlFields="ScheduleUserId" DataContainer="ScheduleUserIdSource" DataTextField="ScheduleUserId" />
				<data:HyperLinkField HeaderText="User Id" DataNavigateUrlFormatString="UsersEdit.aspx?UserId={0}" DataNavigateUrlFields="UserId" DataContainer="UserIdSource" DataTextField="Email" />
				<asp:BoundField DataField="Cancel" HeaderText="Cancel" SortExpression="[Cancel]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Change Users Found! </b>
				<asp:HyperLink runat="server" ID="hypScheduleChangeUsers" NavigateUrl="~/admin/ScheduleChangeUsersEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:ScheduleChangeUsersDataSource ID="ScheduleChangeUsersDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleChangeUsersProperty Name="ScheduleChanges"/> 
					<data:ScheduleChangeUsersProperty Name="ScheduleUsers"/> 
					<data:ScheduleChangeUsersProperty Name="Users"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:ScheduleChangeUsersFilter  Column="ScheduleChangeId" QueryStringField="ScheduleChangeId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleChangeUsersDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleChangeUsers" runat="Server" TargetControlID="ScheduleChangeUsersPanel1"
            ExpandControlID="ScheduleChangeUsersPanel2" CollapseControlID="ScheduleChangeUsersPanel2" Collapsed="True"
            TextLabelID="ScheduleChangeUsersLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleChangeUsersImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

