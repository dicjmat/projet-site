<%@ Page Title="Accueil" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Intranet._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="SectionAccueil" runat="server">
        <asp:label ID="titreAccueil" CssClass="titre" runat="server" Font-Size="30">Accueil</asp:label>

    <div>
        <asp:Panel class="communique" ID="communique" runat="server" GroupingText="<b>Communiqué</b>" Font-Size="15"></asp:Panel>
    </div>

    </section>

    <section id="FicheEmpl" runat="server" class="fiche">
        <asp:label ID="titreFiche" runat="server" Font-Size="20"><b><br/>Fiche d'employé</b></asp:label>
    <div>
        <fieldset>
            <legend><b>Informations personnelles</b></legend>
                Numéro de l'employé : <asp:label runat="server" ID="lblNoEmp" Font-Size="15"></asp:label><br/>
                Numéro de téléphone : <asp:label runat="server" ID="lblNoTel" Font-Size="15"></asp:label><br/>
                Numéro de céllulaire :<asp:label runat="server" ID="lblNoCell" Font-Size="15"></asp:label><br/>
                Adresse : <asp:label runat="server" ID="lblAdr" Font-Size="15"></asp:label><br/>
        </fieldset><br/>

        <fieldset>
            <legend><b>Informations de travail</b></legend>
                Profession : <asp:label runat="server" ID="lblProf" Font-Size="15"></asp:label><br/>
                Date d'embauche : <asp:label runat="server" ID="lbldateEmbauche" Font-Size="15"></asp:label><br/>
                Vous travaillez à l'hotel <asp:label runat="server" ID="lblNoHotel" Font-Size="15"></asp:label><br/>
                Heures cette semaine : <asp:label runat="server" ID="lblHrSemaine" Font-Size="15"></asp:label><br/>
                Salaire : <asp:label runat="server" ID="lblSalaire" Font-Size="15"></asp:label><br/>
        </fieldset><br />

        <fieldset>
            <legend><b>Jours de congés disponibles</b></legend>
                Jours de vacances : <asp:label runat="server" ID="lblJoursVac" Font-Size="15"></asp:label><br/>
                Jours fériés : <asp:label runat="server" ID="lblJoursFerie" Font-Size="15"></asp:label><br/>
                Jours de maladies : <asp:label runat="server" ID="lblJoursMal" Font-Size="15"></asp:label><br/>
        </fieldset>
    </div>
    </section>

</asp:Content>
