Public Class listechambre
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        Dim gotdated = Request.QueryString("dated")
        Dim gotdatef = Request.QueryString("datef")
        Dim gotnohotel = Request.QueryString("nohotel")
        Dim gotnbCham = Request.QueryString("nbChambre")

        'repeatchambre.DataSource() = bd.determinertypechambrelibre(gotdated, gotdatef, gotnohotel).ToList
        'repeatchambre.DataBind()

        Tab1.Visible = False
        Tab2.Visible = False
        Tab3.Visible = False
        Tab4.Visible = False
        afficheronglet(nblist)
        If Not IsPostBack Then
            Tab1.CssClass = "Clicked"
            MainView.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub Tab1_Click(sender As Object, e As EventArgs)
        Tab1.CssClass = "Clicked"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Initial"
        Tab4.CssClass = "Initial"
        MainView.ActiveViewIndex = 0
    End Sub

    Protected Sub Tab2_Click(sender As Object, e As EventArgs)
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Clicked"
        Tab3.CssClass = "Initial"
        Tab4.CssClass = "Initial"
        MainView.ActiveViewIndex = 1
    End Sub

    Protected Sub Tab3_Click(sender As Object, e As EventArgs)
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Clicked"
        Tab4.CssClass = "Initial"
        MainView.ActiveViewIndex = 2
    End Sub
    Protected Sub Tab4_Click(sender As Object, e As EventArgs)
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Initial"
        Tab4.CssClass = "Clicked"
        MainView.ActiveViewIndex = 3
    End Sub


    Protected Sub nblist_SelectedIndexChanged(sender As Object, e As EventArgs) Handles nblist.SelectedIndexChanged
        afficheronglet(nblist)
    End Sub

    Protected Sub afficheronglet(nblist As DropDownList)
        Dim nbChambre As Integer
        Dim i As Integer = 1
        nbChambre = nblist.SelectedValue
        While i <= nbChambre
            Dim mybutton As Button = TryCast(nblist.Parent.FindControl("Tab" + (i).ToString), Button)
            mybutton.Visible = True
            i += 1
        End While
    End Sub
End Class

