<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="listechambre.aspx.vb" Inherits="ProjetSite.listechambre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <asp:Repeater runat="server" ID="repeatchambre">
        <ItemTemplate>
            <hr />
             <b><u> <%# DataBinder.Eval(Container.DataItem, "nomTypeSalle")%></u></b>
             <p>Nombre de chambre disponible: <%# DataBinder.Eval(Container.DataItem, "nbChambre")%> </p>
             <asp:image ImageUrl='<%# String.Format("~/Images/chambre{0}.jpg", Eval("codeTypeSalle"))%>' runat="server" CssClass="imagechambre"/>
        </ItemTemplate>
        </asp:Repeater>
</asp:Content>
