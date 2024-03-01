<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="UsersEdit.aspx.cs" Inherits="UsersEdit" Title="Users Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Users - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="UserId" runat="server" DataSourceID="UsersDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/UsersFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/UsersFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Users not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:UsersDataSource ID="UsersDataSource" runat="server"
			SelectMethod="GetByUserId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="UserId" QueryStringField="UserId" Type="String" />

			</Parameters>
		</data:UsersDataSource>
		
		<br />

		<asp:Panel ID="UserCompanyRolesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="UserCompanyRolesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">User Company Roles Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="UserCompanyRolesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="UserCompanyRolesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewUserCompanyRoles1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewUserCompanyRoles1_SelectedIndexChanged"			 			 
			DataSourceID="UserCompanyRolesDataSource1"
			DataKeyNames="UserCompanyRoleId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_UserCompanyRoles.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="User Id" DataNavigateUrlFormatString="UsersEdit.aspx?UserId={0}" DataNavigateUrlFields="UserId" DataContainer="UserIdSource" DataTextField="Email" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<data:HyperLinkField HeaderText="Role Id" DataNavigateUrlFormatString="UserRolesEdit.aspx?RoleId={0}" DataNavigateUrlFields="RoleId" DataContainer="RoleIdSource" DataTextField="Code" />
			</Columns>
			<EmptyDataTemplate>
				<b>No User Company Roles Found! </b>
				<asp:HyperLink runat="server" ID="hypUserCompanyRoles" NavigateUrl="~/admin/UserCompanyRolesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:UserCompanyRolesDataSource ID="UserCompanyRolesDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:UserCompanyRolesProperty Name="Companies"/> 
					<data:UserCompanyRolesProperty Name="UserRoles"/> 
					<data:UserCompanyRolesProperty Name="Users"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:UserCompanyRolesFilter  Column="UserId" QueryStringField="UserId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:UserCompanyRolesDataSource>		
		
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
		<data:EntityGridView ID="GridViewScheduleUsers2" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleUsers2_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleUsersDataSource2"
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
		
		<data:ScheduleUsersDataSource ID="ScheduleUsersDataSource2" runat="server" SelectMethod="Find"
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
						<data:ScheduleUsersFilter  Column="UserId" QueryStringField="UserId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleUsersDataSource>		
		
		<br />
		</asp:Panel> <br />
		<asp:Panel ID="ScheduleChangeUsersPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="ScheduleChangeUsersImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Schedule Change Users Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="ScheduleChangeUsersLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="ScheduleChangeUsersPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewScheduleChangeUsers3" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewScheduleChangeUsers3_SelectedIndexChanged"			 			 
			DataSourceID="ScheduleChangeUsersDataSource3"
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
		
		<data:ScheduleChangeUsersDataSource ID="ScheduleChangeUsersDataSource3" runat="server" SelectMethod="Find"
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
						<data:ScheduleChangeUsersFilter  Column="UserId" QueryStringField="UserId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:ScheduleChangeUsersDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeUserCompanyRoles" runat="Server" TargetControlID="UserCompanyRolesPanel1"
            ExpandControlID="UserCompanyRolesPanel2" CollapseControlID="UserCompanyRolesPanel2" Collapsed="True"
            TextLabelID="UserCompanyRolesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="UserCompanyRolesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleUsers" runat="Server" TargetControlID="ScheduleUsersPanel1"
            ExpandControlID="ScheduleUsersPanel2" CollapseControlID="ScheduleUsersPanel2" Collapsed="True"
            TextLabelID="ScheduleUsersLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleUsersImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeScheduleChangeUsers" runat="Server" TargetControlID="ScheduleChangeUsersPanel1"
            ExpandControlID="ScheduleChangeUsersPanel2" CollapseControlID="ScheduleChangeUsersPanel2" Collapsed="True"
            TextLabelID="ScheduleChangeUsersLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="ScheduleChangeUsersImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

