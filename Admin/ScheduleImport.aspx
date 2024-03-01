
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleImport.aspx.cs" Inherits="ScheduleImport" Title="ScheduleImport List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Import List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="ScheduleImportDataSource"
				DataKeyNames="Id"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_ScheduleImport.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<asp:BoundField DataField="ArriveDate" HeaderText="Arrive Date" SortExpression="[ArriveDate]"  />
				<asp:BoundField DataField="ArriveTime" HeaderText="Arrive Time" SortExpression="[ArriveTime]"  />
				<asp:BoundField DataField="ArriveFlight" HeaderText="Arrive Flight" SortExpression="[ArriveFlight]"  />
				<asp:BoundField DataField="ReportDate" HeaderText="Report Date" SortExpression="[ReportDate]"  />
				<asp:BoundField DataField="ReportTime" HeaderText="Report Time" SortExpression="[ReportTime]"  />
				<asp:BoundField DataField="ReportFlight" HeaderText="Report Flight" SortExpression="[ReportFlight]"  />
				<asp:BoundField DataField="Crew" HeaderText="Crew" SortExpression="[Crew]"  />
				<asp:BoundField DataField="Type" HeaderText="Type" SortExpression="[Type]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No ScheduleImport Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnScheduleImport" OnClientClick="javascript:location.href='ScheduleImportEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:ScheduleImportDataSource ID="ScheduleImportDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
		>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:ScheduleImportDataSource>
	    		
</asp:Content>



