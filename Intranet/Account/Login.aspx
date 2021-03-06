﻿<%@ Page Title="Se connecter" Language="vb" AutoEventWireup="false" MasterPageFile="~/Accueil.Master" CodeBehind="Login.aspx.vb" Inherits="Intranet.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Connexion.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Connectez-vous à l'aide de votre identifiant</h4>
                    <hr />
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Identifiant</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="Le champ d’utilisateur est obligatoire." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Mot de passe</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <div id="ForgotPasswordLink"><%--<asp:HyperLink ID="ForgotPasswordHyperLink" runat="server" NavigateUrl="#">Forgot Password</asp:HyperLink>--%></div>        
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Le champ mot de passe est requis." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Mémoriser le mot de passe ?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Se connecter" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                <p>
                    <%-- Activez ceci une fois que vous avez activé la confirmation de votre compte pour la fonctionnalité de réinitialisation du mot de passe
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Vous avez oublié votre mot de passe ? </asp:HyperLink>
                    --%>
                </p>
            </section>
        </div>

        <div class="oublie"><br/>
            <h3 runat="server" class="titreOublie" Font-Size="15"><b>Mot de passe oublié</b></h3>
            <asp:Label runat="server">Si vous avez oublié votre identifiant ou votre mot de passe, veuillez contacter l'administrateur de votre hotel.</asp:Label>
        </div>

<%--        <div class="col-md-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>--%>
    </div>
</asp:Content>
