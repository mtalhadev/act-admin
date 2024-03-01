
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="Vehicles.aspx.cs" Inherits="Vehicles" Title="Vehicles List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Vehicles List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="VehiclesDataSource"
				DataKeyNames="VehicleId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_Vehicles.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<data:HyperLinkField HeaderText="Vehicle Status Id" DataNavigateUrlFormatString="VehicleStatusesEdit.aspx?VehicleStatusId={0}" DataNavigateUrlFields="VehicleStatusId" DataContainer="VehicleStatusIdSource" DataTextField="Code" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]"  />
				<asp:BoundField DataField="Make" HeaderText="Make" SortExpression="[Make]"  />
				<asp:BoundField DataField="Model" HeaderText="Model" SortExpression="[Model]"  />
				<asp:BoundField DataField="Vin" HeaderText="Vin" SortExpression="[VIN]"  />
				<asp:BoundField DataField="PlateNumber" HeaderText="Plate Number" SortExpression="[PlateNumber]"  />
				<asp:BoundField DataField="TollTag" HeaderText="Toll Tag" SortExpression="[TollTag]"  />
				<asp:BoundField DataField="TrackingCode" HeaderText="Tracking Code" SortExpression="[TrackingCode]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No Vehicles Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnVehicles" OnClientClick="javascript:location.href='VehiclesEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:VehiclesDataSource ID="VehiclesDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:VehiclesProperty Name="Companies"/> 
					<data:VehiclesProperty Name="VehicleStatuses"/> 
					<%--<data:VehiclesProperty Name="VehicleLogsCollection" />--%>
					<%--<data:VehiclesProperty Name="VehicleCitiesCollection" />--%>
					<%--<data:VehiclesProperty Name="ScheduleCollection" />--%>
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:VehiclesDataSource>
	    		
</asp:Content>



