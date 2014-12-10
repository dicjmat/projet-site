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


            <p>Nombre de chambre: <asp:DropDownList id="nblist" runat="server" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="nblist_SelectedIndexChanged">
                  <asp:ListItem Text="1" Value="1"></asp:ListItem>
                  <asp:ListItem Text="2" Value="2"></asp:ListItem>
                  <asp:ListItem Text="3" Value="3"></asp:ListItem>
                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
            </asp:DropDownList>
            </p>

    
          <asp:Button Text="Chambre 1" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
              OnClick="Tab1_Click" />
          <asp:Button Text="Chambre 2" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
              OnClick="Tab2_Click" />
          <asp:Button Text="Chambre 3" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
              OnClick="Tab3_Click" />
          <asp:Button Text="Chambre 4" BorderStyle="None" ID="Tab4" CssClass="Initial" runat="server"
              OnClick="Tab4_Click" />
          <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <asp:RadioButton runat="server" Text="Standard" GroupName="typechambre" />
                      <asp:RadioButton runat="server" Text="Supérieur" GroupName="typechambre"/>
                      <asp:RadioButton runat="server" Text="Suite" GroupName="typechambre"/>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <asp:RadioButton runat="server" Text="Standard" GroupName="typechambre2" />
                      <asp:RadioButton runat="server" Text="Supérieur" GroupName="typechambre2"/>
                      <asp:RadioButton runat="server" Text="Suite" GroupName="typechambre2"/>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <asp:RadioButton runat="server" Text="Standard" GroupName="typechambre3" />
                      <asp:RadioButton runat="server" Text="Supérieur" GroupName="typechambre3"/>
                      <asp:RadioButton runat="server" Text="Suite" GroupName="typechambre3"/>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View4" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <asp:RadioButton runat="server" Text="Standard" GroupName="typechambre4" />
                      <asp:RadioButton runat="server" Text="Supérieur" GroupName="typechambre4"/>
                      <asp:RadioButton runat="server" Text="Suite" GroupName="typechambre4"/>
                  </td>
                </tr>
              </table>
            </asp:View>
          </asp:MultiView>

</asp:Content>
