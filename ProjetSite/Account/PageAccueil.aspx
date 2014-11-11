<%@ Control Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="PageAccueil.aspx.vb" Inherits="ProjetSite.PageAccueil" className="" %>
<%@ Register src="~/Shared/_header.ascx" tagname="Header" tagprefix="abc" %>
<%@ Register Src="~/Shared/_footer.ascx" tagname="Footer" TagPrefix="cba"%>
<asp:Content  runat="server" ContentPlaceHolderID="MainContent">
        <html>
        
        <body>
               <div id="header">
                <abc:Header ID="abcHeader" runat="server" />
            </div> 
               <div id="footer">
                <cba:Footer ID="cbaFooter" runat="server" />
            </div> 
        </body>
    </html>
</asp:Content>

