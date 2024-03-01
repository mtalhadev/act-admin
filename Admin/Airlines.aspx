
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="Airlines.aspx.cs" Inherits="Airlines" Title="Airlines List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Airlines List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="AirlinesDataSource"
				DataKeyNames="AirlineId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_Airlines.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Company Id" DataNavigateUrlFormatString="CompaniesEdit.aspx?CompanyId={0}" DataNavigateUrlFields="CompanyId" DataContainer="CompanyIdSource" DataTextField="Name" />
				<asp:BoundField DataField="Code" HeaderText="Code" SortExpression="[Code]"  />
				<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="[Description]"  />
				<asp:BoundField DataField="AirlineUser" HeaderText="Airline User" SortExpression="[AirlineUser]"  />
				<asp:BoundField DataField="AirlinePass" HeaderText="Airline Pass" SortExpression="[AirlinePass]"  />
				<asp:BoundField DataField="HotelUser" HeaderText="Hotel User" SortExpression="[HotelUser]"  />
				<asp:BoundField DataField="HotelPass" HeaderText="Hotel Pass" SortExpression="[HotelPass]"  />
				<asp:BoundField DataField="CrewUser" HeaderText="Crew User" SortExpression="[CrewUser]"  />
				<asp:BoundField DataField="CrewPass" HeaderText="Crew Pass" SortExpression="[CrewPass]"  />
				<asp:BoundField DataField="PortalPassReset" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Portal Pass Reset" SortExpression="[PortalPassReset]"  />
				<data:BoundRadioButtonField DataField="Active" HeaderText="Active" SortExpression="[Active]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No Airlines Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnAirlines" OnClientClick="javascript:location.href='AirlinesEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:AirlinesDataSource ID="AirlinesDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:AirlinesProperty Name="Companies"/> 
					<%--<data:AirlinesProperty Name="ScheduleCollection" />--%>
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:AirlinesDataSource>
	    		
</asp:Content>



