
<%@ Page Language="C#" Theme="Default" MasterPageFile="~/MasterPages/admin.master" AutoEventWireup="true"  CodeFile="DriverCredentials.aspx.cs" Inherits="DriverCredentials" Title="DriverCredentials List" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">Driver Credentials List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<data:GridViewSearchPanel ID="GridViewSearchPanel1" runat="server" GridViewControlID="GridView1" PersistenceMethod="Session" />
		<br />
		<data:EntityGridView ID="GridView1" runat="server"			
				AutoGenerateColumns="False"					
				OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
				DataSourceID="DriverCredentialsDataSource"
				DataKeyNames="DriverCredentialId"
				AllowMultiColumnSorting="false"
				DefaultSortColumnName="" 
				DefaultSortDirection="Ascending"	
				ExcelExportFileName="Export_DriverCredentials.xls"  		
			>
			<Columns>
				<asp:CommandField ShowSelectButton="True" ShowEditButton="True" />				
				<data:HyperLinkField HeaderText="Driver Id" DataNavigateUrlFormatString="DriversEdit.aspx?DriverId={0}" DataNavigateUrlFields="DriverId" DataContainer="DriverIdSource" DataTextField="DriverCode" />
				<data:HyperLinkField HeaderText="Credential Type Id" DataNavigateUrlFormatString="DriverCredentialTypesEdit.aspx?CredentialTypeId={0}" DataNavigateUrlFields="CredentialTypeId" DataContainer="CredentialTypeIdSource" DataTextField="Code" />
				<asp:BoundField DataField="Number" HeaderText="Number" SortExpression="[Number]"  />
				<asp:BoundField DataField="Expiration" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Expiration" SortExpression="[Expiration]"  />

				<asp:templatefield headertext='Photo Preview'>
				<itemtemplate>
					<ajaxToolkit:ModalPopupExtender id='ModalPopupExtender3' runat='server'
						TargetControlID='LinkButton3' 
						PopupControlID='Panel1' 
						OkControlID='Button1'
						BackgroundCssClass='ModalBackground' 
						DynamicControlID='lblPreview'
						DynamicContextKey='<%# DataBinder.Eval(Container.DataItem, "DriverCredentialId") %>'
						DynamicServiceMethod='GetPhotoContent' />
					<asp:LinkButton ID='LinkButton3' runat='server' Text='Preview' />
				</itemtemplate>
				</asp:templatefield>
	
			</Columns>
			<EmptyDataTemplate>
				<b>No DriverCredentials Found!</b>
			</EmptyDataTemplate>
		</data:EntityGridView>
		<br />
		<asp:Button runat="server" ID="btnDriverCredentials" OnClientClick="javascript:location.href='DriverCredentialsEdit.aspx'; return false;" Text="Add New"></asp:Button>
	</ContentTemplate>
	</asp:UpdatePanel>	
	<asp:Panel ID="Panel1" runat="server" CssClass="popup" >
	    <h2>Content Preview <asp:Button ID="Button1" runat="server"  Text="Close Preview"/></h2><hr /> 
	    <asp:Label ID='lblPreview' runat="server" ></asp:Label>
	</asp:Panel>
		<data:DriverCredentialsDataSource ID="DriverCredentialsDataSource" runat="server"
			SelectMethod="GetPaged"
			EnablePaging="True"
			EnableSorting="True"
			EnableDeepLoad="True"
			>
			<DeepLoadProperties Method="IncludeChildren" Recursive="False">
	            <Types>
					<data:DriverCredentialsProperty Name="DriverCredentialTypes"/> 
					<data:DriverCredentialsProperty Name="Drivers"/> 
				</Types>
			</DeepLoadProperties>
			<Parameters>
				<data:CustomParameter Name="WhereClause" Value="" ConvertEmptyStringToNull="false" />
				<data:CustomParameter Name="OrderByClause" Value="" ConvertEmptyStringToNull="false" />
				<asp:ControlParameter Name="PageIndex" ControlID="GridView1" PropertyName="PageIndex" Type="Int32" />
				<asp:ControlParameter Name="PageSize" ControlID="GridView1" PropertyName="PageSize" Type="Int32" />
				<data:CustomParameter Name="RecordCount" Value="0" Type="Int32" />
			</Parameters>
		</data:DriverCredentialsDataSource>
	    		
</asp:Content>



