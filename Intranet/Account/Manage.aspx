﻿<%@ Page Title="Gérer le compte" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Manage.aspx.vb" Inherits="Intranet.Manage" %>

<%@ Import Namespace="ProjetSite" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="SuccessMessagePlaceHolder" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <section id="passwordForm">
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                    <p>
                        Vous ne possédez pas de mot de passe local pour ce site. Ajoutez un mot de passe
                        local pour pouvoir vous connecter sans ID de connexion externe.
                    </p>
                    <div class="form-horizontal">
                        <h4>Formulaire de définition de mot de passe</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Mot de passe</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                    CssClass="text-danger" ErrorMessage="Le champ mot de passe est requis."
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-danger" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirmer le mot de passe </asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Le champ confirmer le mot de passe est requis."
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Le mot de passe et le mot de passe de confirmation ne correspondent pas."
                                    ValidationGroup="SetPassword" />

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Définir le mot de passe" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="modifierInfo" Visible="True">
                    <p>Vous êtes connecté en tant que <strong><%: User.Identity.GetUserName() %></strong>.</p>
                    <div class="form-horizontal">
                        <h4>Changer les informations relatives au client</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" ID="Label1" AssociatedControlID="Nom" CssClass="col-md-2 control-label">Nom</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Nom" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Nom"
                                    CssClass="text-danger" ErrorMessage="Le nom est requis."
                                    ValidationGroup="ChangeInfo" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="Label2" AssociatedControlID="Prenom" CssClass="col-md-2 control-label">Prénom</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Prenom" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Prenom"
                                    CssClass="text-danger" ErrorMessage="Le prénom est requis."
                                    ValidationGroup="ChangeInfo" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="Label3" AssociatedControlID="Adresse" CssClass="col-md-2 control-label">Adresse</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Adresse" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Adresse"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="L'adresse est requise."
                                    ValidationGroup="ChangeInfo" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="Label4" AssociatedControlID="Telephone" CssClass="col-md-2 control-label">Téléphone</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Telephone" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Telephone"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Le numéro de téléphone est requis."
                                    ValidationGroup="ChangeInfo" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="Label5" AssociatedControlID="TelephoneSup" CssClass="col-md-2 control-label">Téléphone Cellulaire ou travail</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="TelephoneSup" CssClass="form-control" />
                             </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Modifier les informations" OnClick="ChangeInfo_Click" CssClass="btn btn-default" ValidationGroup="ChangeInfo" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    <div class="form-horizontal">
                        <h4>Changer la forme du mot de passe</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Mot de passe actuel</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="text-danger" ErrorMessage="Le champ confirmer le mot de passe est requis."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">Nouveau mot de passe</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="text-danger" ErrorMessage="Le nouveau mot de passe est requis."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirmer le nouveau mot de passe</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="La confirmation du nouveau mot de passe est requise."
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Le nouveau mot de passe et le mot de passe de confirmation ne correspondent pas."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Modifier le mot de passe" OnClick="ChangePassword_Click" CssClass="btn btn-default" ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </section>

            <%--<section id="externalLoginsForm">

                <asp:ListView runat="server"
                    ItemType="Microsoft.AspNet.Identity.UserLoginInfo"
                    SelectMethod="GetLogins" DeleteMethod="RemoveLogin" DataKeyNames="LoginProvider,ProviderKey">

                    <LayoutTemplate>
                        <h4>Connexions inscrites</h4>
                        <table class="table">
                            <tbody>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </tbody>
                        </table>

                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#: Item.LoginProvider %></td>
                            <td>
                                <asp:Button runat="server" Text="Supprimer" CommandName="Delete" CausesValidation="false"
                                    ToolTip='<%# "Supprimer cette " + Item.LoginProvider + " connexion de votre compte" %>'
                                    Visible="<%# CanRemoveExternalLogins %>" CssClass="btn btn-default" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <uc:openauthproviders runat="server" returnurl="~/Account/Manage" />
            </section>--%>
        </div>
    </div>
</asp:Content>

