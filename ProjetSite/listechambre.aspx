<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="listechambre.aspx.vb" Inherits="ProjetSite.listechambre" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>  
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%--       <asp:Repeater runat="server" ID="repeatchambre">
        <ItemTemplate>
            <hr  />
            <div id="clickable">
             <b><u> <%# DataBinder.Eval(Container.DataItem, "nomTypeSalle")%></u></b>
             <p>Nombre de chambre disponible: <%# DataBinder.Eval(Container.DataItem, "nbChambre")%> </p>
             <asp:image ImageUrl='<%# String.Format("~/Images/chambre{0}.jpg", Eval("codeTypeSalle"))%>' runat="server" CssClass="imagechambre"/>
             <asp:button runat="server" Text="Plus d'informations" CssClass="btninfo"></asp:button>
 
            </div>
        </ItemTemplate>
        </asp:Repeater>--%>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
          <asp:Button Text="Standard" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
              OnClick="Tab1_Click" />
          <asp:Button Text="Supérieur" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
              OnClick="Tab2_Click" />
          <asp:Button Text="Suite" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
              OnClick="Tab3_Click" />
          <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
           <div>
           <asp:Label id="lblTypeChambre" runat="server" CssClass="typeChambre"></asp:Label>
           <br />
           <asp:Label id="lblTypeLit" runat="server"></asp:Label>
              </div>
              <asp:Image id="imgChambre" runat="server" CssClass="imgChambre" />
              <asp:Label id="Label1" runat="server" CssClass="lbl"><b>Description</b></asp:Label>
              <asp:Label id="lblDescTypeSalle" runat="server" CssClass="lbl lbldesc"></asp:Label>
           <br />
          <asp:Repeater runat="server" id="lstItem">
            <ItemTemplate>
            <asp:Label runat="server" Text ='<%#String.Format("- {0}", Eval("nomItem"))%>'></asp:Label>
            <br />
          </ItemTemplate>
          </asp:Repeater>
           <p>Nombre de chambre: <asp:DropDownList id="nblist" runat="server" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="nblist_SelectedIndexChanged">
                  <asp:ListItem Text="0" Value="0"></asp:ListItem>
                  <asp:ListItem Text="1" Value="1"></asp:ListItem>
                  <asp:ListItem Text="2" Value="2"></asp:ListItem>
                  <asp:ListItem Text="3" Value="3"></asp:ListItem>
                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
            </asp:DropDownList>
            </p>

                  </td>
                </tr>
              </table>

            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                                 <div>
           <asp:Label id="lblTypeChambre2" runat="server" CssClass="typeChambre"></asp:Label>
           <br />
           <asp:Label id="lblTypeLit2" runat="server"></asp:Label>
              </div>
              <asp:Image id="imgChambre2" runat="server" CssClass="imgChambre" />
              <asp:Label id="Label2" runat="server" CssClass="lbl"><b>Description</b></asp:Label>
              <asp:Label id="lblDescTypeSalle2" runat="server" CssClass="lbl lbldesc"></asp:Label>
           <br />
          <asp:Repeater runat="server" id="lstItem2">
            <ItemTemplate>
            <asp:Label runat="server" Text ='<%#String.Format("- {0}", Eval("nomItem"))%>'></asp:Label>
            <br />
          </ItemTemplate>
          </asp:Repeater>
           <p>Nombre de chambre: <asp:DropDownList id="nblist2" runat="server" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="nblist_SelectedIndexChanged">
               <asp:ListItem Text="0" Value="0"></asp:ListItem>   
               <asp:ListItem Text="1" Value="1"></asp:ListItem>
                  <asp:ListItem Text="2" Value="2"></asp:ListItem>
                  <asp:ListItem Text="3" Value="3"></asp:ListItem>
                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
            </asp:DropDownList>
            </p>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                                                       <div>
           <asp:Label id="lblTypeChambre3" runat="server" CssClass="typeChambre"></asp:Label>
           <br />
           <asp:Label id="lblTypeLit3" runat="server"></asp:Label>
              </div>
              <asp:Image id="imgChambre3" runat="server" CssClass="imgChambre" />
              <asp:Label id="Label3" runat="server" CssClass="lbl"><b>Description</b></asp:Label>
              <asp:Label id="lblDescTypeSalle3" runat="server" CssClass="lbl lbldesc"></asp:Label>
           <br />
          <asp:Repeater runat="server" id="lstItem3">
            <ItemTemplate>
            <asp:Label runat="server" Text ='<%#String.Format("- {0}", Eval("nomItem"))%>'></asp:Label>
            <br />
          </ItemTemplate>
          </asp:Repeater>
           <p>Nombre de chambre: <asp:DropDownList id="nblist3" runat="server" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="nblist_SelectedIndexChanged">
               <asp:ListItem Text="0" Value="0"></asp:ListItem>   
               <asp:ListItem Text="1" Value="1"></asp:ListItem>
                  <asp:ListItem Text="2" Value="2"></asp:ListItem>
                  <asp:ListItem Text="3" Value="3"></asp:ListItem>
                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
            </asp:DropDownList>
            </p>
                  </td>
              </table>
            </asp:View>
          </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>

          <asp:Button runat="server" ID="btnreserv" Text="Réserver"/>
</asp:Content>
