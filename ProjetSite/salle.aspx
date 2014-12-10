<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="salle.aspx.vb" Inherits="ProjetSite.salle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label runat="server" ID="lblnomSalle" CssClass="titre"></asp:Label>
    <hr />
    <div Class="imgChambre img">
        <asp:Image runat="server" ID="imgSalle" CssClass="imgChambre" />
    </div>
    <div class="desc">    
        <asp:Label runat="server" ID="lblDescSalle"></asp:Label>
    </div>

    <br />
    <br />
    <asp:Label runat="server" ID="lblNombrePlace"></asp:Label>
</asp:Content>
