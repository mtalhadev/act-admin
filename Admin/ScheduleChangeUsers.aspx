
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="ScheduleChangeUsers.aspx.cs" Inherits="ScheduleChangeUsers" Title="ScheduleChangeUsers List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Schedule Change Users List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="ScheduleChangeUsersDataSource"
				DataKeyNames="ScheduleChangeUsers"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_ScheduleChangeUsers.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Schedule Change Id" DataNavigateUrlFormatString="ScheduleChangesEdit.aspx?ScheduleChangeId={0}" DataNavigateUrlFields="ScheduleChangeId" DataContainer="ScheduleChangeIdSource" DataTextField="ScheduleDate" />
				<data:HyperLinkField HeaderText="Schedule User Id" DataNavigateUrlFormatString="ScheduleUsersEdit.aspx?ScheduleUserId={0}" DataNavigateUrlFields="ScheduleUserId" DataContainer="ScheduleUserIdSource" DataTextField="ScheduleUserId" />
				<data:HyperLinkField HeaderText="User Id" DataNavigateUrlFormatString="UsersEdit.aspx?UserId={0}" DataNavigateUrlFields="UserId" DataContainer="UserIdSource" DataTextField="Email" />
				<data:BoundRadioButtonField DataField="Cancel" HeaderText="Cancel" SortExpression="[Cancel]"  />
			</Columns>
			<EmptyDataTemplate>
				<b>No ScheduleChangeUsers Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnScheduleChangeUsers" OnClientClick="javascript:location.href='ScheduleChangeUsersEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
		<data:ScheduleChangeUsersDataSource ID="ScheduleChangeUsersDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:ScheduleChangeUsersProperty Name="ScheduleChanges"/> 
					<data:ScheduleChangeUsersProperty Name="ScheduleUsers"/> 
					<data:ScheduleChangeUsersProperty Name="Users"/> 
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:ScheduleChangeUsersDataSource>
	    		
</asp:Content>



