<%@ Page Title="Fiche Employe" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FicheEmploye.aspx.vb" Inherits="Intranet.FicheEmploye" %>


<asp:Content runat="server" ID="BodyContent"  ContentPlaceHolderID="MainContent">
    <section id="FicheEmpl" runat="server">
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
    </section>
</asp:Content>