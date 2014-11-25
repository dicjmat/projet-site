<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ProjetSite._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="placefooter" runat="server">
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

<%--    <img src="http://www.multiplemayhemmamma.com/wp-content/uploads/2013/02/Happy-family1.jpg" id="family"/>--%>
        <div id="verif">
        <p>Date de début: <input type="text" id="textboxdebut" /></p>
        <p>Date de fin: <input type="text" id="textboxFin"  /></p>
        <p>Hotel: <select id="nomhotel" runat="server"/></p>
        
        <asp:Button id="btnValid" runat="server" Text="Vérification"/>

    </div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#textboxdebut").wijinputdate(
            {
                showTrigger: true
            });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#textboxFin").wijinputdate(
            {
                showTrigger: true
            });
    });
</script>

</asp:Content>
