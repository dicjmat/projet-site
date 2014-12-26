<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Réservation.aspx.vb" Inherits="ProjetSite.Réservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>Faire la réservation</h1>
        <div><p>Nom:</p> <asp:textbox runat="server" cssclass="txtprofil" id="txtnom"/></div>
        <div><p>Prénom:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtpren"/></div>
        <div><p>No téléphone:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtnotel"/></div>
        <div><p>No cellulaire:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtnocell"/></div>
        <div><p>Adresse:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtadr"/></div>
        <div><p>Code postal:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtcodepostal"/></div>
        <div><p>Email:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtemail"/></div>
        <div><p>Type de carte crédit:</p><asp:DropDownList id="listtype" runat="server" AutoPostBack="true" CausesValidation="false" >
                <asp:ListItem Text="VISA" Value="1"></asp:ListItem>
                <asp:ListItem Text="AMEX" Value="2"></asp:ListItem>
                <asp:ListItem Text="MAST" Value="3"></asp:ListItem>
        </asp:DropDownList></div>
        <div><p>No carte de crédit:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtnocarte"/></div>
        <div><p>Date d'expiration:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtdateexp"/></div>
        <div><p>Commentaires:</p><asp:textbox runat="server" cssclass="txtprofil" id="txtcomm"/></div>
        <asp:Label runat="server" AssociatedControlID="lstPays" CssClass="col-md-2 control-label">Pays</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList CssClass="form-control width2" ID="lstPays" runat="server" AutoPostBack="true" CausesValidation="false">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lstPays"
                    CssClass="text-danger" ErrorMessage="Le champ pays est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lstProvince" CssClass="col-md-2 control-label">Province</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList CssClass="form-control width2" ID="lstProvince" runat="server" AutoPostBack="true" CausesValidation="false">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lstProvince"
                    CssClass="text-danger" ErrorMessage="Le champ province est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lstVille" CssClass="col-md-2 control-label">Ville</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList CssClass="form-control width2" ID="lstVille" runat="server" AutoPostBack="true" CausesValidation="false">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lstVille"
                    CssClass="text-danger" ErrorMessage="Le champ pays est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <asp:Button runat="server" Text="Confirmer" OnClick="Unnamed1_Click" />
        <asp:label runat="server" id="réussite">La réservation s'est effectué avec succès.</asp:label>
         <asp:label runat="server" id="echec">Vous avez oublié de remplir un champ.</asp:label>
    
</asp:Content>
