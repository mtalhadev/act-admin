﻿
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleDropoffs.aspx.cs" Inherits="ScheduleDropoffs" Title="ScheduleDropoffs List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Dropoffs List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="ScheduleDropoffsDataSource"
				DataKeyNames="ScheduleDropoffId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_ScheduleDropoffs.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Schedule Id" DataNavigateUrlFormatString="ScheduleEdit.aspx?ScheduleId={0}" DataNavigateUrlFields="ScheduleId" DataContainer="ScheduleIdSource" DataTextField="ScheduleDate" />
				<data:HyperLinkField HeaderText="Location Id" DataNavigateUrlFormatString="LocationsEdit.aspx?LocationId={0}" DataNavigateUrlFields="LocationId" DataContainer="LocationIdSource" DataTextField="Code" />
			</Columns>
			<EmptyDataTemplate>
				<b>No ScheduleDropoffs Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnScheduleDropoffs" OnClientClick="javascript:location.href='ScheduleDropoffsEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:ScheduleDropoffsDataSource ID="ScheduleDropoffsDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleDropoffsProperty Name="Locations"/> 
					<data:ScheduleDropoffsProperty Name="Schedule"/> 
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:ScheduleDropoffsDataSource>
	    		
</asp:Content>



