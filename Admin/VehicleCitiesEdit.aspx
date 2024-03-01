<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="VehicleCitiesEdit.aspx.cs" Inherits="VehicleCitiesEdit" Title="VehicleCities Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Vehicle Cities - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="VehicleCityId" runat="server" DataSourceID="VehicleCitiesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/VehicleCitiesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/VehicleCitiesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>VehicleCities not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:VehicleCitiesDataSource ID="VehicleCitiesDataSource" runat="server"
			SelectMethod="GetByVehicleCityId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="VehicleCityId" QueryStringField="VehicleCityId" Type="String" />

			</Parameters>
		</data:VehicleCitiesDataSource>
		
		<br />

		

</asp:Content>

