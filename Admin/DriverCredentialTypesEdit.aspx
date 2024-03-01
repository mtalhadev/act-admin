<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="DriverCredentialTypesEdit.aspx.cs" Inherits="DriverCredentialTypesEdit" Title="DriverCredentialTypes Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Driver Credential Types - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="CredentialTypeId" runat="server" DataSourceID="DriverCredentialTypesDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/DriverCredentialTypesFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/DriverCredentialTypesFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>DriverCredentialTypes not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:DriverCredentialTypesDataSource ID="DriverCredentialTypesDataSource" runat="server"
			SelectMethod="GetByCredentialTypeId"
		>
			<Parameters>
				<asp:QueryStringParameter Name="CredentialTypeId" QueryStringField="CredentialTypeId" Type="String" />

			</Parameters>
		</data:DriverCredentialTypesDataSource>
		
		<br />

		<asp:Panel ID="DriverCredentialsPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="DriverCredentialsImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Driver Credentials Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="DriverCredentialsLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="DriverCredentialsPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewDriverCredentials1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewDriverCredentials1_SelectedIndexChanged"			 			 
			DataSourceID="DriverCredentialsDataSource1"
			DataKeyNames="DriverCredentialId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_DriverCredentials.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<data:HyperLinkField HeaderText="Credential Type Id" DataNavigateUrlFormatString="DriverCredentialTypesEdit.aspx?CredentialTypeId={0}" DataNavigateUrlFields="CredentialTypeId" DataContainer="CredentialTypeIdSource" DataTextField="Code" />
				<asp:BoundField DataField="Number" HeaderText="Number" SortExpression="[Number]" />				
				<asp:BoundField DataField="Expiration" HeaderText="Expiration" SortExpression="[Expiration]" />				
				<asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="[Photo]" />				
			</Columns>
			<EmptyDataTemplate>
				<b>No Driver Credentials Found! </b>
				<asp:HyperLink runat="server" ID="hypDriverCredentials" NavigateUrl="~/admin/DriverCredentialsEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:DriverCredentialsDataSource ID="DriverCredentialsDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverCredentialsProperty Name="DriverCredentialTypes"/> 
					<data:DriverCredentialsProperty Name="Drivers"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:DriverCredentialsFilter  Column="CredentialTypeId" QueryStringField="CredentialTypeId" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:DriverCredentialsDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeDriverCredentials" runat="Server" TargetControlID="DriverCredentialsPanel1"
            ExpandControlID="DriverCredentialsPanel2" CollapseControlID="DriverCredentialsPanel2" Collapsed="True"
            TextLabelID="DriverCredentialsLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="DriverCredentialsImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

