﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="SAFE.Website._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
	<META HTTP-EQUIV=REFRESH CONTENT="5; URL=/admin/">.
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>
			<!-- Remove the meta refresh tag in the header to remove this redirection !-->
            <h2>This page will be redirected to the admin section in five seconds.</h2>
        </div>
    </form>

    <script type="text/xml-script">
        <page xmlns:script="http://schemas.microsoft.com/xml-script/2005">
            <references>
            </references>
            <components>
            </components>
        </page>
    </script>
</body>
</html>
