<%@ Page Title="Accueil" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Intranet._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="SectionAccueil" runat="server">
        <asp:label ID="titreAccueil" CssClass="titre" runat="server" Font-Size="30">Accueil</asp:label>

    <div>
        <asp:Panel class="communique" ID="communique" runat="server" GroupingText="<b>Communiqué</b>" Font-Size="15"></asp:Panel>
    </div>

    </section>

    <section id="FicheEmpl" runat="server" class="fiche">
        <asp:label ID="titreFiche" runat="server" Font-Size="15"><b><br/>Fiche d'employé</b></asp:label>
    <div>

        <asp:label runat="server" ID="lblNoEmp" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblNoTel" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblNoCell" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblAdr" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblProf" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lbldateEmbauche" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblNoHotel" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblHrSemaine" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblSalaire" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblJoursVac" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblJoursFerie" Font-Size="15"></asp:label><br/>
        <asp:label runat="server" ID="lblJoursMal" Font-Size="15"></asp:label><br/>
    </div>
    </section>

</asp:Content>
