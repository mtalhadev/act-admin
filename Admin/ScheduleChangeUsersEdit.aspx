<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleChangeUsersEdit.aspx.cs" Inherits="ScheduleChangeUsersEdit" Title="ScheduleChangeUsers Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Change Users - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="ScheduleChangeUsers" runat="server" DataSourceID="ScheduleChangeUsersDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleChangeUsersFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleChangeUsersFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>ScheduleChangeUsers not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:ScheduleChangeUsersDataSource ID="ScheduleChangeUsersDataSource" runat="server"
			SelectMethod="GetByScheduleChangeUsers"
		>
			<Parameters>
				<asp:QueryStringParameter Name="ScheduleChangeUsers" QueryStringField="ScheduleChangeUsers" Type="String" />

			</Parameters>
		</data:ScheduleChangeUsersDataSource>
		
		<br />

		

</asp:Content>

