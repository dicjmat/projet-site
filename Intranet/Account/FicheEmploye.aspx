<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FicheEmploye.aspx.vb" Inherits="Intranet.FicheEmploye" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Fiche d'employé</title>
    <link rel="stylesheet" type="text/css" href='~/Account/CSSIntranet.css' />
</head>
<body>
    <form id="FicheEmp" runat="server">
        <h3 id="titreFiche"><b>Fiche d'employé</b></h3>
    <div>
        <asp:label runat="server" ID="lblIntroFiche"></asp:label><br/>
        <br/>
        <asp:label runat="server" ID="lblNoEmp"></asp:label><br/>
        <asp:label runat="server" ID="lblNoTel"></asp:label><br/>
        <asp:label runat="server" ID="lblAdr"></asp:label><br/>
        <asp:label runat="server" ID="lblCodeProf"></asp:label><br/>
        <asp:label runat="server" ID="lbldateEmbauche"></asp:label>
    </div>
    </form>
</body>
</html>
