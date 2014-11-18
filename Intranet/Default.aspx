<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Intranet._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
