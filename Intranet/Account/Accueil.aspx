<%@ Page Title="Accueil" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Accueil.aspx.vb" Inherits="Intranet.Accueil" %>

<asp:Content runat="server" ID="BodyContent"  ContentPlaceHolderID="MainContent">
    <section id="SectionAccueil" runat="server">
        <h3 id="titreAccueil">Accueil</h3>
    <div>
        <asp:Label runat="server" ID="lblIntro"></asp:Label>
        <br/>
        <br/>
    </div>
    <div>
        <asp:Panel ID="communique" runat="server" GroupingText="<b>Communiqué</b>"></asp:Panel>
    </div>
    </section>
</asp:Content>