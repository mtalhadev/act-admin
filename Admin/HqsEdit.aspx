<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="HqsEdit.aspx.cs" Inherits="HqsEdit" Title="Hqs Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Hqs - Add/Edit</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<data:MultiFormView ID="FormView1" DataKeyNames="Hqid" runat="server" DataSourceID="HqsDataSource">
		
			<EditItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/HqsFields.ascx" />
			</EditItemTemplatePaths>
		
			<InsertItemTemplatePaths>
				<data:TemplatePath Path="~/Admin/UserControls/HqsFields.ascx" />
			</InsertItemTemplatePaths>
		
			<EmptyDataTemplate>
				<b>Hqs not found!</b>
			</EmptyDataTemplate>
			
			<FooterTemplate>
				<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
				<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</FooterTemplate>

		</data:MultiFormView>
		
		<data:HqsDataSource ID="HqsDataSource" runat="server"
			SelectMethod="GetByHqid"
		>
			<Parameters>
				<asp:QueryStringParameter Name="Hqid" QueryStringField="Hqid" Type="String" />

			</Parameters>
		</data:HqsDataSource>
		
		<br />

		<asp:Panel ID="HqCompaniesPanel2" runat="server" CssClass="collapsePanelHeader"> 
			<div style="padding:5px; cursor: pointer; vertical-align: middle;">
				<div style="float: left; vertical-align: middle;"><asp:Image ID="HqCompaniesImage" runat="server" ImageUrl="~/images/expand_blue.jpg"/></div>
				<div style="float: left; padding-left: 5px;">Hq Companies Details</div>
				<div style="float: left; margin-left: 20px;"><asp:Label ID="HqCompaniesLabel" runat="server" /></div>
			</div>
		</asp:Panel>	<br />
		<asp:Panel ID="HqCompaniesPanel1" runat="server" CssClass="collapsePanel" Height="0">
		<data:EntityGridView ID="GridViewHqCompanies1" runat="server"
			AutoGenerateColumns="False"	
			OnSelectedIndexChanged="GridViewHqCompanies1_SelectedIndexChanged"			 			 
			DataSourceID="HqCompaniesDataSource1"
			DataKeyNames="HqCompanyId"
			AllowMultiColumnSorting="false"
			DefaultSortColumnName="" 
			DefaultSortDirection="Ascending"	
			ExcelExportFileName="Export_HqCompanies.xls"  		
			Visible='<%# (FormView1.DefaultMode == FormViewMode.Insert) ? false : true %>'	
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<data:HyperLinkField HeaderText="Hqid" DataNavigateUrlFormatString="HqsEdit.aspx?Hqid={0}" DataNavigateUrlFields="Hqid" DataContainer="HqidSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
			</Columns>
			<EmptyDataTemplate>
				<b>No Hq Companies Found! </b>
				<asp:HyperLink runat="server" ID="hypHqCompanies" NavigateUrl="~/admin/HqCompaniesEdit.aspx">Add New</asp:HyperLink>
			</EmptyDataTemplate>
		</data:EntityGridView>					
		
		<data:HqCompaniesDataSource ID="HqCompaniesDataSource1" runat="server" SelectMethod="Find"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:HqCompaniesProperty Name="Companies"/> 
					<data:HqCompaniesProperty Name="Hqs"/> 
				</Types>
			</DeepLoadProperties>
			
		    <Parameters>
				<data:SqlParameter Name="Parameters">
					<Filters>
						<data:HqCompaniesFilter  Column="Hqid" QueryStringField="Hqid" /> 
					</Filters>
				</data:SqlParameter>
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" /> 
		    </Parameters>
		</data:HqCompaniesDataSource>		
		
		<br />
		</asp:Panel> <br />
		
<ajaxToolkit:CollapsiblePanelExtender ID="cpeHqCompanies" runat="Server" TargetControlID="HqCompaniesPanel1"
            ExpandControlID="HqCompaniesPanel2" CollapseControlID="HqCompaniesPanel2" Collapsed="True"
            TextLabelID="HqCompaniesLabel" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
            ImageControlID="HqCompaniesImage" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true"/>


</asp:Content>

