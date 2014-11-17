<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Accueil.aspx.vb" Inherits="Intranet.Accueil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Accueil</title>
    <link rel="stylesheet" type="text/css" href='~/Account/CSSIntranet.css' />
</head>
<body>
    <form id="Accueil" runat="server">
        <h3 id="titreAccueil">Accueil</h3>
    <div>
        <asp:Label runat="server" ID="lblIntro"></asp:Label>
        <br/>
        <br/>
    </div>
    <div>
        <asp:Panel ID="communique" runat="server" GroupingText="<b>Communiqué</b>"></asp:Panel>
    </div>
    </form>
</body>
</html>
