<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ProjetSite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="placefooter" runat="server">
        <div id="verif">
        <p>Date de début: <asp:Calendar runat="server" ID="dpDebut" CssClass="dpDebut" /></p>
        <p>Date de fin: <asp:Calendar runat="server" ID="dpFin" CssClass="dpFin" /></p>
        <p>Hotel: <select id="nomhotel" runat="server"/></p>

        <asp:Button id="btnValid" runat="server" Text="Vérification"/>
    </div>

</asp:Content>
