﻿<%@ Page Title="Réinitialiser le mot de passe" Language="vb" MasterPageFile="~/Accueil.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.vb" Inherits="Intranet.ResetPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Entrez votre nouveau mot de passe.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
<%--            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Utilisateur</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="Le champ d’adresse de messagerie est obligatoire." />
            </div>
        </div>--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Mot de passe</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="Le champ du mot de passe est obligatoire." />
                <asp:RegularExpressionValidator ID="Regex1" runat="server" ControlToValidate="Password" Display="Dynamic"
    ValidationExpression="^[a-z](?=.*\d)((?=[a-z0-9]).{6}|(?=[a-z0-9]).{13})$" ErrorMessage="Le mot de passe doit contenir: Soit 7 ou 14 caractères, au moins un chiffre et une lettre et seulement des caractères alphanumériques" CssClass="text-danger"/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirmer le mot de passe </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Le confirmation de mot de passe est requise." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Le mot de passe et le mot de passe de confirmation ne correspondent pas." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Reset_Click" Text="Réinitialiser" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
