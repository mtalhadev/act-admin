
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="VehicleLogs.aspx.cs" Inherits="VehicleLogs" Title="VehicleLogs List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Vehicle Logs List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="VehicleLogsDataSource"
				DataKeyNames="VehicleLogId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_VehicleLogs.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Vehicle Log Type Id" DataNavigateUrlFormatString="VehicleLogTypesEdit.aspx?VehicleLogTypeId={0}" DataNavigateUrlFields="VehicleLogTypeId" DataContainer="VehicleLogTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Vehicle Id" DataNavigateUrlFormatString="VehiclesEdit.aspx?VehicleId={0}" DataNavigateUrlFields="VehicleId" DataContainer="VehicleIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="User Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="UserIdSource" DataTextField="DriverCode" />
				<asp:BoundField DataField="LogDate" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Log Date" SortExpression="[LogDate]"  />
				<asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="[Mileage]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No VehicleLogs Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnVehicleLogs" OnClientClick="javascript:location.href='VehicleLogsEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:VehicleLogsDataSource ID="VehicleLogsDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:VehicleLogsProperty Name="Drivers"/> 
					<data:VehicleLogsProperty Name="VehicleLogTypes"/> 
					<data:VehicleLogsProperty Name="Vehicles"/> 
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:VehicleLogsDataSource>
	    		
</asp:Content>



