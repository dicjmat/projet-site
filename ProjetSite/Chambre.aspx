<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Chambre.aspx.vb" Inherits="ProjetSite.Chambre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Label ID="lblTypeChambre" runat="server" CssClass="typeChambre lbl"></asp:Label>
        <br />
        <asp:Label ID="lblTypeLit" runat="server" CssClass="lbl"></asp:Label>
    </div>
    <asp:Image ID="imgChambre" runat="server" CssClass="imgChambre" />
    <br />
    <asp:Label ID="lblDescTypeSalle" runat="server"></asp:Label>
</asp:Content>
