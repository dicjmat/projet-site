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
            <p class="textbox">Date de début:
                <asp:TextBox runat="server" CssClass="textboxdebut textbox" ID="textboxdebut" OnTextChanged="textboxdebut_TextChanged" AutoPostBack="true" /></p>
            <p class="textbox">Date de fin:
                <asp:TextBox runat="server" CssClass="textboxfin textbox" ID="textboxFin" /></p>

            <asp:Button ID="btnValid" runat="server" Text="Vérification" />

        <script type="text/javascript">
            $(document).ready(function () {
                $(".textboxdebut").wijinputdate(
                    {
                        showTrigger: true,
                        minDate: Date.now()
                    });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".textboxfin").wijinputdate(
                    {
                        showTrigger: true,
                        readonly: true,
                    });
            });
        </script>
    </div>
</asp:Content>
