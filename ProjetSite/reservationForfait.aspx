<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="reservationForfait.aspx.vb" Inherits="ProjetSite.reservationForfait" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!--jQuery References--> 
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js" type="text/javascript"></script>

<!--Theme-->
<link href="http://cdn.wijmo.com/themes/aristo/jquery-wijmo.css" rel="stylesheet" type="text/css" />

<!--Wijmo Widgets CSS-->
<link href="http://cdn.wijmo.com/jquery.wijmo-pro.all.3.20143.59.min.css" rel="stylesheet" type="text/css" />

<!--Wijmo Widgets JavaScript-->
<script src="http://cdn.wijmo.com/jquery.wijmo-open.all.3.20143.59.min.js" type="text/javascript"></script>
<script src="http://cdn.wijmo.com/jquery.wijmo-pro.all.3.20143.59.min.js" type="text/javascript"></script>
<script src="http://cdn.wijmo.com/interop/wijmo.data.ajax.3.20143.59.js" type="text/javascript"></script>

    <span>Informations du forfait</span>
    <div class="border">
        <asp:Label runat="server" ID="lblnomForfait"></asp:Label>
        <br />
        <asp:Label runat="server" ID="lbldescForfait"></asp:Label>
        <br />
        <asp:Label runat="server" ID="lblTarifForfait"></asp:Label>
        <br />
        <asp:Label runat="server" ID="lblnbNuitForfait"></asp:Label>
        <br />
        <asp:Label runat="server" ID="lblTypeChambreForfait"></asp:Label>
        <br />
    </div>
    <br />
    <span>Informations du client</span>
    <asp:PlaceHolder runat="server" ID="SetPassword"></asp:PlaceHolder>
    <div class="border" title="Informations du client">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPrenom" CssClass="col-md-2 control-label">Prénom</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPrenom" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPrenom"
                    CssClass="text-danger" ErrorMessage="Le champ prénom est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>

        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtNom" CssClass="col-md-2 control-label">Nom</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtNom" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNom"
                    CssClass="text-danger" ErrorMessage="Le champ nom est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtAdresse" CssClass="col-md-2 control-label">Adresse</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtAdresse" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAdresse"
                    CssClass="text-danger" ErrorMessage="Le champ d'adresse est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtTel" CssClass="col-md-2 control-label">Téléphone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtTel" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTel"
                    CssClass="text-danger" ErrorMessage="Le champ téléphone est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCell" CssClass="col-md-2 control-label">Cellulaire</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtCell" CssClass="form-control" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCodePostal" CssClass="col-md-2 control-label">Code Postal</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtCodePostal" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCodePostal"
                    CssClass="text-danger" ErrorMessage="Le champ code postal est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtNoCarteCredit" CssClass="col-md-2 control-label">Type de chambre</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList CssClass="form-control width" ID="listtype" runat="server" AutoPostBack="true" CausesValidation="false">
                    <asp:ListItem Text="VISA" Value="1"></asp:ListItem>
                    <asp:ListItem Text="AMEX" Value="2"></asp:ListItem>
                    <asp:ListItem Text="MAST" Value="3"></asp:ListItem>
                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="listtype"
                    CssClass="text-danger" ErrorMessage="Le champ de type de carte de crédit est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtNoCarteCredit" CssClass="col-md-2 control-label">Numéro de carte de crédit</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtNoCarteCredit" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNoCarteCredit"
                    CssClass="text-danger" ErrorMessage="Le champ de numéro de carte de crédit est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtDateExpiration" CssClass="col-md-2 control-label">Date d'expiration(MM/AA)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtDateExpiration" CssClass="form-control width" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDateExpiration"
                    CssClass="text-danger" ErrorMessage="Le champ de date d'expiration est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Adresse Courriel</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                    CssClass="text-danger" ErrorMessage="Le champ d'adresse mail est requis."
                    Display="Dynamic" ValidationGroup="SetPassword" />
            </div>
        </div>
        <br />
        <br />
        <asp:UpdatePanel runat="server">
        <ContentTemplate>
<div class="form-group">
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
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCommentaire" CssClass="col-md-2 control-label">Commentaires</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtCommentaire" CssClass="form-control width3" ></asp:TextBox>
            </div>
        </div>
        <br />
        <br />
        <div>
            <p class="textbox">
                Date de début:
                <asp:TextBox runat="server" CssClass="textboxdebut textbox" ID="textboxdebut" OnTextChanged="textboxdebut_TextChanged" AutoPostBack="true" />
            </p>
            <p class="textbox">
                Date de fin:
                <asp:TextBox runat="server" CssClass="textboxfin textbox" ID="textboxFin" />
            </p>
                    </div>
        <script type="text/javascript">
            function pageLoad(sender, args) {
                $(".textboxdebut").wijinputdate(
                    {
                        showTrigger: true,
                        minDate: Date.now(),
                    });
                    $(".textboxfin").wijinputdate(
                        {
                            showTrigger: true,
                            readonly: true,
                        });
            };
        </script>
        </ContentTemplate>
        </asp:UpdatePanel>

            <asp:Button ID="btnValid" runat="server" Text="Vérification" ValidationGroup="SetPassword" />
    </div>
</asp:Content>
