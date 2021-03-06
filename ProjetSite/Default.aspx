﻿<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ProjetSite._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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


 
        <div id="verif">
        <p class="p">Date de début: <asp:textbox runat="server" cssclass="textboxdebut" id="textboxdebut"/></p>
        <p class="p">Date de fin: <asp:textbox runat="server" cssclass="textboxFin" ID="textboxFin"  /></p>
        <p class="p">Hotel: <asp:DropDownList id="nomhotel" runat="server"/></p>

<%--        <p class="p">Nb de chambre: <asp:DropDownList runat="server" ID="ddlist">
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                <asp:ListItem Text="4" Value="4"></asp:ListItem>
        </asp:DropDownList></p>--%>

        <asp:Button id="btnValid" runat="server" Text="Vérification"/>
        <div>
            <asp:label id="erreur" CssClass="erreur" runat="server">La date de fin ne peut être avant la date de début.</asp:label>
            <asp:label id="erreur2" CssClass="erreur" runat="server">La date choisie ne peut être avant aujourd'hui.</asp:label>
            <asp:label id="erreur3" CssClass="erreur" runat="server">La date de fin ne peut être avant la date de début et la date choisie ne peut être avant aujourd'hui.</asp:label>
        </div>
    </div>
        <asp:Image runat="server" ImageUrl="~/Images/logo-hotel.png" CssClass="logo" />
        <asp:Image runat="server" ImageUrl="http://makingitbeautifulforyou.com/wp-content/uploads/2014/02/happy-family.jpg" CssClass="happy" />

    <div id="bloc">
<%--        <div id ="blocspa">
        <asp:Image runat="server" ImageUrl="~/Images/spa-couple.jpg" CssClass="imgspa" />
            <p>Profitez de nos forfaits de relaxation.</p>
        </div>--%>
    </div>
       
<script type="text/javascript">
    $(document).ready(function () {
        $(".textboxdebut").wijinputdate(
            {
                showTrigger: true
            });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".textboxFin").wijinputdate(
            {
                showTrigger: true
            });
    });
</script>

</asp:Content>
