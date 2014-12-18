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
                      <asp:RadioButton runat="server" Text="Standard" GroupName="typechambre1" id="rd11" AutoPostBack=True/>
                      <asp:RadioButton runat="server" Text="Supérieur" GroupName="typechambrerd1" id="rd12" AutoPostBack=True/>
                      <asp:RadioButton runat="server" Text="Suite" GroupName="typechambrerd1" id="rd13" AutoPostBack=True/>  
                                            
           <div>
           <asp:Label Class="lblTypeChambre" runat="server" CssClass="typeChambre"></asp:Label>
           <br />
           <asp:Label Class="lblTypeLit" runat="server"></asp:Label>
              </div>
              <asp:Image Class="imgChambre" runat="server" CssClass="imgChambre" />
              <asp:Label Class="Label1" runat="server" CssClass="lbl"><b>Description</b></asp:Label>
              <asp:Label Class="lblDescTypeSalle" runat="server" CssClass="lbl lbldesc"></asp:Label>
           <br />
          <asp:Repeater runat="server" Class="lstItem">
            <ItemTemplate>
            <asp:Label runat="server" Text ='<%#String.Format("- {0}", Eval("nomItem"))%>'></asp:Label>
            <br />
          </ItemTemplate>
          </asp:Repeater>

                  </td>
                </tr>
              </table>

            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <asp:RadioButton runat="server" Text="Standard" GroupName="typechambre2" id="rd21"/>
                      <asp:RadioButton runat="server" Text="Supérieur" GroupName="typechambre2" id="rd22"/>
                      <asp:RadioButton runat="server" Text="Suite" GroupName="typechambre2" id="rd23"/>

                                 <div>
           <asp:Label Class="lblTypeChambre" runat="server" CssClass="typeChambre"></asp:Label>
           <br />
           <asp:Label Class="lblTypeLit" runat="server"></asp:Label>
              </div>
              <asp:Image Class="imgChambre" runat="server" CssClass="imgChambre" />
              <asp:Label Class="Label1" runat="server" CssClass="lbl"><b>Description</b></asp:Label>
              <asp:Label Class="lblDescTypeSalle" runat="server" CssClass="lbl lbldesc"></asp:Label>
           <br />
          <asp:Repeater runat="server" Class="lstItem">
            <ItemTemplate>
            <asp:Label runat="server" Text ='<%#String.Format("- {0}", Eval("nomItem"))%>'></asp:Label>
            <br />
          </ItemTemplate>
          </asp:Repeater>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <asp:RadioButton runat="server" Text="Standard" GroupName="typechambre3" id="rd31"/>
                      <asp:RadioButton runat="server" Text="Supérieur" GroupName="typechambre3" id="rd32"/>
                      <asp:RadioButton runat="server" Text="Suite" GroupName="typechambre3" id="rd33"/>
                                 <div>
           <asp:Label Class="lblTypeChambre" runat="server" CssClass="typeChambre"></asp:Label>
           <br />
           <asp:Label Class="lblTypeLit" runat="server"></asp:Label>
              </div>
              <asp:Image Class="imgChambre" runat="server" CssClass="imgChambre" />
              <asp:Label Class="Label1" runat="server" CssClass="lbl"><b>Description</b></asp:Label>
              <asp:Label Class="lblDescTypeSalle" runat="server" CssClass="lbl lbldesc"></asp:Label>
           <br />
          <asp:Repeater runat="server" Class="lstItem">
            <ItemTemplate>
            <asp:Label runat="server" Text ='<%#String.Format("- {0}", Eval("nomItem"))%>'></asp:Label>
            <br />
          </ItemTemplate>
          </asp:Repeater>
                  </td>
              </table>
            </asp:View>
            <asp:View ID="View4" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <asp:RadioButton runat="server" Text="Standard" GroupName="typechambre4" id="rd41"/>
                      <asp:RadioButton runat="server" Text="Supérieur" GroupName="typechambre4" id="rd42"/>
                      <asp:RadioButton runat="server" Text="Suite" GroupName="typechambre4" id="rd43"/>
                                 <div>
           <asp:Label Class="lblTypeChambre" runat="server" CssClass="typeChambre"></asp:Label>
           <br />
           <asp:Label Class="lblTypeLit" runat="server"></asp:Label>
              </div>
              <asp:Image Class="imgChambre" runat="server" CssClass="imgChambre" />
              <asp:Label Class="Label1" runat="server" CssClass="lbl"><b>Description</b></asp:Label>
              <asp:Label Class="lblDescTypeSalle" runat="server" CssClass="lbl lbldesc"></asp:Label>
           <br />
          <asp:Repeater runat="server" Class="lstItem">
            <ItemTemplate>
            <asp:Label runat="server" Text ='<%#String.Format("- {0}", Eval("nomItem"))%>'></asp:Label>
            <br />
          </ItemTemplate>
          </asp:Repeater>
                  </td>
                </tr>
              </table>
            </asp:View>
          </asp:MultiView>
          <asp:Button runat="server" ID="btnreserv" Text="Réserver"/>
</asp:Content>
