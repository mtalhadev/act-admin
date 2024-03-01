<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="UserRolesEdit.aspx.cs" Inherits="UserRolesEdit" Title="UserRoles Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">User Roles - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="RoleId" runat="server" DataSourceID="UserRolesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/UserRolesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/UserRolesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>UserRoles not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:UserRolesDataSource ID="UserRolesDataSource" runat="server"
			SelectMethod="GetByRoleId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="RoleId" QueryStringField="RoleId" Type="String" />

			</Parameters>
		</data:UserRolesDataSource>
		
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
						<data:UserCompanyRolesFilter  Column="RoleId" QueryStringField="RoleId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:UserCompanyRolesDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeUserCompanyRoles" runat="Server" TargetControlID="UserCompanyRolesPanel1"
            ExpandControlID="UserCompanyRolesPanel2" CollapseControlID="UserCompanyRolesPanel2" Collapsed="True"
            TextLabelID="UserCompanyRolesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="UserCompanyRolesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

