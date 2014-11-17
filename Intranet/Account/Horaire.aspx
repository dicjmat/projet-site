<%@ Page Title="Horaire" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horaire.aspx.vb" Inherits="Intranet.Horaire" %>

<asp:Content runat="server" ID="BodyContent"  ContentPlaceHolderID="MainContent">
    <section id="creerHoraire" runat="server">
        <h3 id="titreHoraire">Horaire</h3>
        <asp:Calendar runat="server" ID="calendar1"
            TodayDayStyle-BackColor="LightBlue"
            SelectedDayStyle-BackColor ="CadetBlue"
            TitleStyle-BackColor="CadetBlue"
            TitleStyle-Font-Size ="20"
            DayStyle-Font-Size ="15"
            DayStyle-Height ="100"
            DayStyle-Width ="100"
            OtherMonthDayStyle-ForeColor ="Gray"          
            ></asp:Calendar>
        <asp:Label ID="lblHoraire" runat="server" Text=""></asp:Label>
    </section>
</asp:Content>
