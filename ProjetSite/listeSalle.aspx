<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="listeSalle.aspx.vb" Inherits="ProjetSite.listeSalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Repeater runat="server" ID="listeSalleHotel">
         <ItemTemplate>
             <asp:Label runat="server" Text='<%#Eval("nomHotel") %>'  CssClass='<%#String.Format("{0} titre", Eval("noHotel"))%>'></asp:Label>
             <hr />
             <asp:ListView runat="server">
                 <ItemTemplate>
                     <asp:Label runat="server" Text='<%#Eval("nomSalle")%>'></asp:Label>
                     <br />
                     <asp:Label runat="server" Text='<%#String.Format("Nombre de places : {0}", Eval("nbPlace"))%>'></asp:Label>
                     <asp:Button runat="server" CssClass='<%#String.Format("{0}              bouton", Eval("noSalle"))%>' Text="Consulter les informations" ID="btnSalle" OnClick="btnSalle_Click" />
                     <br />
                     <br />
                     <br /> 
                 </ItemTemplate>
                 <EmptyDataTemplate>
                     Aucune Salle
                     <br />
                     <br />
                     <br />
                 </EmptyDataTemplate>
             </asp:ListView>
         </ItemTemplate>
     </asp:Repeater>
</asp:Content>
