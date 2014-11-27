<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="ProjetSite.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="placefooter" runat="server">
    
    <h2>Pour nous joindre</h2>


    <asp:Repeater runat="server" ID="repeat">
        <ItemTemplate>
            <hr />
 <b><u><%# DataBinder.Eval(Container.DataItem, "nomHotel")%></u></b>
   <p>No téléphone: <%# DataBinder.Eval(Container.DataItem, "noTelHotel")%></p> 
   <p>No télécopieur: <%# DataBinder.Eval(Container.DataItem, "noTelecopieur")%> </p>
   <p>No réservation: <%# DataBinder.Eval(Container.DataItem, "noTelReserv")%></p> 
   <p>Adresse: <%# DataBinder.Eval(Container.DataItem, "adrHotel")%></p> 
   <p>Code Postal: <%# DataBinder.Eval(Container.DataItem, "codePostal")%></p> 
        </ItemTemplate>
    </asp:Repeater>
    
</asp:Content>
