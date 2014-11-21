<%@ Page Title="Horaire" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horaire.aspx.vb" Inherits="Intranet.Horaire" %>

<asp:Content runat="server" ID="BodyContent"  ContentPlaceHolderID="MainContent">
    <section id="creerHoraire" runat="server">
        <h3 id="titreHoraire">Horaire</h3>
        <asp:Calendar runat="server" ID="calendar1" CssClass="calendrier"
            TodayDayStyle-BackColor="LightBlue"
            SelectedDayStyle-BackColor ="CadetBlue"
            TitleStyle-BackColor="CadetBlue"
            TitleStyle-Font-Size ="20"
            DayStyle-Font-Size ="15"
            DayStyle-Height ="80"
            DayStyle-Width ="80"
            OtherMonthDayStyle-ForeColor ="Gray"
            DayStyle-BackColor ="White"         
            ></asp:Calendar>
        <asp:Label ID="lblHoraire" runat="server" Text="" CssClass="horaire"></asp:Label>
    </section>
</asp:Content>
