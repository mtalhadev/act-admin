<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="UserCompanyRolesEdit.aspx.cs" Inherits="UserCompanyRolesEdit" Title="UserCompanyRoles Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">User Company Roles - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="UserCompanyRoleId" runat="server" DataSourceID="UserCompanyRolesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/UserCompanyRolesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/UserCompanyRolesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>UserCompanyRoles not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:UserCompanyRolesDataSource ID="UserCompanyRolesDataSource" runat="server"
			SelectMethod="GetByUserCompanyRoleId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="UserCompanyRoleId" QueryStringField="UserCompanyRoleId" Type="String" />

			</Parameters>
		</data:UserCompanyRolesDataSource>
		
		<br />

		

</asp:Content>

