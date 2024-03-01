<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="SchedulePickupsEdit.aspx.cs" Inherits="SchedulePickupsEdit" Title="SchedulePickups Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Pickups - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="SchedulePickupId" runat="server" DataSourceID="SchedulePickupsDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/SchedulePickupsFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/SchedulePickupsFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>SchedulePickups not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:SchedulePickupsDataSource ID="SchedulePickupsDataSource" runat="server"
			SelectMethod="GetBySchedulePickupId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="SchedulePickupId" QueryStringField="SchedulePickupId" Type="String" />

			</Parameters>
		</data:SchedulePickupsDataSource>
		
		<br />

		

</asp:Content>

