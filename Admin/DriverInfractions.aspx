
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="DriverInfractions.aspx.cs" Inherits="DriverInfractions" Title="DriverInfractions List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Driver Infractions List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="DriverInfractionsDataSource"
				DataKeyNames="DriverInfractionId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_DriverInfractions.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Infraction Type Id" DataNavigateUrlFormatString="DriverInfractionTypesEdit.aspx?InfractionTypeId={0}" DataNavigateUrlFields="InfractionTypeId" DataContainer="InfractionTypeIdSource" DataTextField="Code" />
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<asp:BoundField DataField="InfractionDate" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Infraction Date" SortExpression="[InfractionDate]"  />

				<asp:templatefield headertext='Description Preview'>
				<itemtemplate>
					<ajaxToolkit:ModalPopupExtender id='ModalPopupExtender3' runat='server'
						TargetControlID='LinkButton3' 
						PopupControlID='Panel1' 
						OkControlID='Button1'
						BackgroundCssClass='ModalBackground' 
						DynamicControlID='lblPreview'
						DynamicContextKey='<%# DataBinder.Eval(Container.DataItem, "DriverInfractionId") %>'
						DynamicServiceMethod='GetDescriptionContent' />
					<asp:LinkButton ID='LinkButton3' runat='server' Text='Preview' />
				</itemtemplate>
				</asp:templatefield>
	
			</Columns>
			<EmptyDataTemplate>
				<b>No DriverInfractions Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnDriverInfractions" OnClientClick="javascript:location.href='DriverInfractionsEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
	<asp:Panel ID="Panel1" runat="server" CssClass="popup" >
	    <h2>Content Preview <asp:Button ID="Button1" runat="server"  Text="Close Preview"/></h2><hr /> 
	    <asp:Label ID='lblPreview' runat="server" ></asp:Label>
	</asp:Panel>
		<data:DriverInfractionsDataSource ID="DriverInfractionsDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverInfractionsProperty Name="Drivers"/> 
					<data:DriverInfractionsProperty Name="DriverInfractionTypes"/> 
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:DriverInfractionsDataSource>
	    		
</asp:Content>



