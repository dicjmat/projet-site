<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="ProjetSite.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="placefooter" runat="server">
    
    <h2><%: Title %></h2>
    <p>Your contact page.</p>

    <asp:Repeater runat="server" ID="repeat">
        <ItemTemplate>
            
 <%# DataBinder.Eval(Container.DataItem, "nomHotel")%>
   <%# DataBinder.Eval(Container.DataItem, "noTelHotel")%>
   <%# DataBinder.Eval(Container.DataItem, "noTelecopieur")%>
   <%# DataBinder.Eval(Container.DataItem, "noTelReserv")%>
            
        </ItemTemplate>
    </asp:Repeater>
    
</asp:Content>
