<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="listechambre.aspx.vb" Inherits="ProjetSite.listechambre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%--    <div id="chambre">--%>
       <asp:Repeater runat="server" ID="repeatchambre">
        <ItemTemplate>
            <hr  />
            <div id="clickable">
             <b><u> <%# DataBinder.Eval(Container.DataItem, "nomTypeSalle")%></u></b>
             <p>Nombre de chambre disponible: <%# DataBinder.Eval(Container.DataItem, "nbChambre")%> </p>
             <asp:image ImageUrl='<%# String.Format("~/Images/chambre{0}.jpg", Eval("codeTypeSalle"))%>' runat="server" CssClass="imagechambre"/>
             <asp:button runat="server" Text="Plus d'informations" CssClass="btninfo"></asp:button>
            </div>
        </ItemTemplate>
        </asp:Repeater>
<%--    </div>--%>
<%--    <div id="contframe">
        <iframe src="chambre" border="0" frameborder="0" id="frame"></iframe>
    </div>--%>

</asp:Content>
