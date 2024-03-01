<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleDropoffsEdit.aspx.cs" Inherits="ScheduleDropoffsEdit" Title="ScheduleDropoffs Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Dropoffs - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="ScheduleDropoffId" runat="server" DataSourceID="ScheduleDropoffsDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleDropoffsFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/ScheduleDropoffsFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>ScheduleDropoffs not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:ScheduleDropoffsDataSource ID="ScheduleDropoffsDataSource" runat="server"
			SelectMethod="GetByScheduleDropoffId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="ScheduleDropoffId" QueryStringField="ScheduleDropoffId" Type="String" />

			</Parameters>
		</data:ScheduleDropoffsDataSource>
		
		<br />

		

</asp:Content>

