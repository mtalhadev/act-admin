
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="Schedule.aspx.cs" Inherits="Schedule" Title="Schedule List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="ScheduleDataSource"
				DataKeyNames="ScheduleId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_Schedule.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<data:HyperLinkField HeaderText="Schedule Status Id" DataNavigateUrlFormatString="ScheduleStatusesEdit.aspx?ScheduleStatusId={0}" DataNavigateUrlFields="ScheduleStatusId" DataContainer="ScheduleStatusIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Schedule Type Id" DataNavigateUrlFormatString="ScheduleTypesEdit.aspx?ScheduleTypeId={0}" DataNavigateUrlFields="ScheduleTypeId" DataContainer="ScheduleTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Transportation Type Id" DataNavigateUrlFormatString="ScheduleTransportationTypesEdit.aspx?TransportationTypeId={0}" DataNavigateUrlFields="TransportationTypeId" DataContainer="TransportationTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Airline Id" DataNavigateUrlFormatString="AirlinesEdit.aspx?AirlineId={0}" DataNavigateUrlFields="AirlineId" DataContainer="AirlineIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<data:HyperLinkField HeaderText="Vehicle Id" DataNavigateUrlFormatString="VehiclesEdit.aspx?VehicleId={0}" DataNavigateUrlFields="VehicleId" DataContainer="VehicleIdSource" DataTextField="Code" />
				<asp:BoundField DataField="ScheduleDate" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Schedule Date" SortExpression="[ScheduleDate]"  />
				<asp:BoundField DataField="FlightNo" HeaderText="Flight No" SortExpression="[FlightNo]"  />
				<asp:BoundField DataField="RateOverride" HeaderText="Rate Override" SortExpression="[RateOverride]"  />
				<asp:BoundField DataField="RotationNo" HeaderText="Rotation No" SortExpression="[RotationNo]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No Schedule Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnSchedule" OnClientClick="javascript:location.href='ScheduleEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:ScheduleDataSource ID="ScheduleDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleProperty Name="Airlines"/> 
					<data:ScheduleProperty Name="Companies"/> 
					<data:ScheduleProperty Name="Drivers"/> 
					<data:ScheduleProperty Name="ScheduleStatuses"/> 
					<data:ScheduleProperty Name="ScheduleTypes"/> 
					<data:ScheduleProperty Name="ScheduleTransportationTypes"/> 
					<data:ScheduleProperty Name="Vehicles"/> 
					<%--<data:ScheduleProperty Name="ScheduleNotesCollection" />--%>
					<%--<data:ScheduleProperty Name="ScheduleDropoffsCollection" />--%>
					<%--<data:ScheduleProperty Name="ScheduleUsersCollection" />--%>
					<%--<data:ScheduleProperty Name="ScheduleChangesCollection" />--%>
					<%--<data:ScheduleProperty Name="SchedulePickupsCollection" />--%>
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:ScheduleDataSource>
	    		
</asp:Content>



