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

<%--            <cc1:NumericUpDownExtender   
            ID="NumericUpDownExtender1"  
            runat="server"  
            TargetControlID="TextBox1"  
            Minimum="1"  
            Maximum="25"  
            Width="100"  
            >  
        </cc1:NumericUpDownExtender>  
            <asp:TextBox   
            ID="TextBox1"  
            runat="server"  
            Font-Bold="true"  
            ForeColor="Crimson"  
            BackColor="LightGoldenrodYellow"  
            >  
        </asp:TextBox>  
    
        <br /><br />                          
        <asp:Image   
            ID="Image1"  
            runat="server"  
            ImageUrl="~/Images/RedTree.jpg"  
            Width="50"  
            />  --%> 

            <p>Nombre de chambre: <asp:DropDownList id="nblist" runat="server">
                  <asp:ListItem Text="1" Value="1"></asp:ListItem>
                  <asp:ListItem Text="2" Value="2"></asp:ListItem>
                  <asp:ListItem Text="3" Value="3"></asp:ListItem>
                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
            </asp:DropDownList>
            </p>

    
          <asp:Button Text="Tab 1" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
              OnClick="Tab1_Click" />
          <asp:Button Text="Tab 2" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
              OnClick="Tab2_Click" />
          <asp:Button Text="Tab 3" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
              OnClick="Tab3_Click" />
          <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                    <h3>
                      <span>View 1 </span>
                    </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                    <h3>
                      View 2
                    </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                    <h3>
                      View 3
                    </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
          </asp:MultiView>
     


</asp:Content>
