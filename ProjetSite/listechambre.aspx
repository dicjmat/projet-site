<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="listechambre.aspx.vb" Inherits="ProjetSite.listechambre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <asp:Repeater runat="server" ID="repeatchambre">
        <ItemTemplate>
            <hr />
             <b><u><p>Type de chambre: <%# DataBinder.Eval(Container.DataItem, "nomTypeSalle")%></p></u></b>
   <p>Nombre de chambre disponible: <%# DataBinder.Eval(Container.DataItem, "nbChambre")%> </p>

        </ItemTemplate>
        </asp:Repeater>
</asp:Content>
