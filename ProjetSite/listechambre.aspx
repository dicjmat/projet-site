<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="listechambre.aspx.vb" Inherits="ProjetSite.listechambre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <asp:Repeater runat="server" ID="repeatchambre">
        <ItemTemplate>
            <hr />
             <b><u><%# DataBinder.Eval(Container.DataItem, "noSalle")%></u></b>
   <p>Description de la chambre: <%# DataBinder.Eval(Container.DataItem, "descSalle")%> </p>
   <p>Nombre de places: <%# DataBinder.Eval(Container.DataItem, "nbPlace")%></p> 
   <p>Type de la chambre: <%# DataBinder.Eval(Container.DataItem, "codeTypeSalle")%></p> 
        </ItemTemplate>
        </asp:Repeater>
</asp:Content>
