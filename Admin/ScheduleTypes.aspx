﻿
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleTypes.aspx.cs" Inherits="ScheduleTypes" Title="ScheduleTypes List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Types List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="ScheduleTypesDataSource"
				DataKeyNames="ScheduleTypeId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_ScheduleTypes.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]"  />
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No ScheduleTypes Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnScheduleTypes" OnClientClick="javascript:location.href='ScheduleTypesEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:ScheduleTypesDataSource ID="ScheduleTypesDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleTypesProperty Name="Companies"/> 
					<%--<data:ScheduleTypesProperty Name="ScheduleCollection" />--%>
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:ScheduleTypesDataSource>
	    		
</asp:Content>



