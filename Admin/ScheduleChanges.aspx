
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleChanges.aspx.cs" Inherits="ScheduleChanges" Title="ScheduleChanges List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Changes List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="ScheduleChangesDataSource"
				DataKeyNames="ScheduleChangeId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_ScheduleChanges.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Schedule Id" DataNavigateUrlFormatString="ScheduleEdit.aspx?ScheduleId={0}" DataNavigateUrlFields="ScheduleId" DataContainer="ScheduleIdSource" DataTextField="ScheduleDate" />
				<data:HyperLinkField HeaderText="Schedule Status Id" DataNavigateUrlFormatString="ScheduleStatusesEdit.aspx?ScheduleStatusId={0}" DataNavigateUrlFields="ScheduleStatusId" DataContainer="ScheduleStatusIdSource" DataTextField="Code" />
				<asp:BoundField DataField="ScheduleDate" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Schedule Date" SortExpression="[ScheduleDate]"  />
				<asp:BoundField DataField="FlightNo" HeaderText="Flight No" SortExpression="[FlightNo]"  />
				<asp:BoundField DataField="Pilots" HeaderText="Pilots" SortExpression="[Pilots]"  />
				<asp:BoundField DataField="FlightAttendants" HeaderText="Flight Attendants" SortExpression="[FlightAttendants]"  />
				<asp:BoundField DataField="Passengers" HeaderText="Passengers" SortExpression="[Passengers]"  />
				<data:BoundRadioButtonField DataField="Approved" HeaderText="Approved" SortExpression="[Approved]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No ScheduleChanges Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnScheduleChanges" OnClientClick="javascript:location.href='ScheduleChangesEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:ScheduleChangesDataSource ID="ScheduleChangesDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleChangesProperty Name="Schedule"/> 
					<data:ScheduleChangesProperty Name="ScheduleStatuses"/> 
					<%--<data:ScheduleChangesProperty Name="ScheduleChangeUsersCollection" />--%>
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:ScheduleChangesDataSource>
	    		
</asp:Content>



