<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ProjetSite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="placefooter" runat="server">
        <div id="verif">
        <p id="lbldeb">Date de début: <asp:Calendar runat="server" OnDayRender="DayRenderEventHandler" OnSelectionChanged="Unnamed1_SelectionChanged" /></p>
        <p>Date de fin: <asp:Calendar runat="server" OnDayRender="DayRenderEventHandler" /></p>
        <p>Hotel: <select id="nomhotel" runat="server"/></p>

        <asp:Button id="btnValid" runat="server" Text="Vérification"/>
    </div>

</asp:Content>
