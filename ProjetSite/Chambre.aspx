<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Chambre.aspx.vb" Inherits="ProjetSite.Chambre" %>
<asp:Content ID="Content1"  ContentPlaceHolderId="MainContent" runat="server">

   
    <div>
        <asp:Label ID="lblTypeChambre" runat="server" CssClass="typeChambre"></asp:Label>
        <br />
        <asp:Label ID="lblTypeLit" runat="server"></asp:Label>
    </div>
    <asp:Image ID="imgChambre" runat="server" CssClass="imgChambre" />
    <asp:Label ID="Label1" runat="server" CssClass="lbl"><b>Description</b></asp:Label>
    <asp:Label ID="lblDescTypeSalle" runat="server" CssClass="lbl lbldesc"></asp:Label>
    <br />
    <asp:Repeater runat="server" ID="lstItem">
        <ItemTemplate>
            <asp:Label runat="server" Text ='<%#String.Format("- {0}", Eval("nomItem"))%>'></asp:Label>
            <br />
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
