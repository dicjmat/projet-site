<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="forfait.aspx.vb" Inherits="ProjetSite.forfait" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="//code.jquery.com/jquery-latest.min.js"></script>
    <script src="Scripts/unslider.js"></script>
    <asp:DropDownList runat="server" ID="dpHotel" OnSelectedIndexChanged="dpHotel_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
    <div class="banner">
        <ul>
        <asp:ListView runat="server" ID="lsForfait">
            <ItemTemplate>
                <li class="slides"><asp:hyperlink CssClass="el" runat="server" text='<%#String.Concat(Eval("nomForfait"), "<br />", Eval("descForfait"))%>' NavigateUrl='<%#String.Format("~/reservationForfait?noForfait={0}",Eval("noForfait"))%>'></asp:hyperlink></li>
            </ItemTemplate>
            <EmptyDataTemplate>
                <li>Aucun Forfait disponible</li>
            </EmptyDataTemplate>
        </asp:ListView>
        </ul>
        <script>
            $(function () {
                $('.banner').unslider({
                    speed: 500,               //  The speed to animate each slide (in milliseconds)
                    delay: 3000,              //  The delay between slide animations (in milliseconds)
                    complete: function () { },  //  A function that gets called after every slide animation
                    keys: true,               //  Enable keyboard (left, right) arrow shortcuts
                    dots: true,               //  Display dot navigation
                    fluid: true             //  Support responsive design. May break non-responsive designs
                });
            });

        </script>
        <a href="#" class="unslider-arrow prev">Previous slide</a>
<a href="#" class="unslider-arrow next">Next slide</a>
    </div>
</asp:Content>
