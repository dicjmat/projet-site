Public Class listechambre
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        Dim gotdated = Request.QueryString("dated")
        Dim gotdatef = Request.QueryString("datef")
        Dim gotnohotel = Request.QueryString("nohotel")
        Dim gotnbCham = Request.QueryString("nbChambre")
        Dim STA As String
        STA = "STA"

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
        rd11.Checked = True
        rd21.Checked = True
        rd31.Checked = True
        rd41.Checked = True
        affichercontenu(STA)
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
  
    Protected Sub rd11_CheckedChanged(sender As Object, e As EventArgs) Handles rd11.CheckedChanged
        Dim STA As String
        STA = "STA"
        affichercontenu(STA)
        rd12.Checked = False
        rd13.Checked = False
    End Sub

    Protected Sub rd12_CheckedChanged(sender As Object, e As EventArgs) Handles rd12.CheckedChanged
        Dim SUP As String
        SUP = "SUP"
        affichercontenu(SUP)
        rd11.Checked = False
        rd13.Checked = False
    End Sub

    Protected Sub rd13_CheckedChanged(sender As Object, e As EventArgs) Handles rd13.CheckedChanged
        Dim SUI As String
        SUI = "SUI"
        affichercontenu(SUI)
        rd11.Checked = False
        rd12.Checked = False
    End Sub

    Protected Sub rd21_CheckedChanged(sender As Object, e As EventArgs) Handles rd21.CheckedChanged
        Dim STA As String
        STA = "STA"
        affichercontenu(STA)
    End Sub

    Protected Sub rd22_CheckedChanged(sender As Object, e As EventArgs) Handles rd22.CheckedChanged
        Dim SUP As String
        SUP = "SUP"
        affichercontenu(SUP)
    End Sub

    Protected Sub rd23_CheckedChanged(sender As Object, e As EventArgs) Handles rd23.CheckedChanged
        Dim SUI As String
        SUI = "SUI"
        affichercontenu(SUI)
    End Sub

    Protected Sub rd31_CheckedChanged(sender As Object, e As EventArgs) Handles rd31.CheckedChanged
        Dim STA As String
        STA = "STA"
        affichercontenu(STA)
    End Sub

    Protected Sub rd32_CheckedChanged(sender As Object, e As EventArgs) Handles rd32.CheckedChanged
        Dim SUP As String
        SUP = "SUP"
        affichercontenu(SUP)
    End Sub

    Protected Sub rd33_CheckedChanged(sender As Object, e As EventArgs) Handles rd33.CheckedChanged
        Dim SUI As String
        SUI = "SUI"
        affichercontenu(SUI)
    End Sub

    Protected Sub rd41_CheckedChanged(sender As Object, e As EventArgs) Handles rd41.CheckedChanged
        Dim STA As String
        STA = "STA"
        affichercontenu(STA)
    End Sub

    Protected Sub rd42_CheckedChanged(sender As Object, e As EventArgs) Handles rd42.CheckedChanged
        Dim SUP As String
        SUP = "SUP"
        affichercontenu(SUP)
    End Sub

    Protected Sub rd43_CheckedChanged(sender As Object, e As EventArgs) Handles rd43.CheckedChanged
        Dim SUI As String
        SUI = "SUI"
        affichercontenu(SUI)
    End Sub

    Protected Sub affichercontenu(type As String)
        Dim chambre = From ch In bd.tblTypeSalle
          Where ch.codeTypeSalle = type
          Select ch

        Dim lit = From ch In bd.tblSalle
                  Where ch.codeTypeSalle = type
                  Join li In bd.tblTypeLit
                  On li.codeTypeLit Equals ch.codeTypeLit
                  Select li.descTypeLit

        imgChambre.ImageUrl = "~/Images/chambre" + type + ".jpg"
        lblTypeChambre.Text = chambre.Single.nomTypeSalle
        For Each li In lit.Distinct.ToList
            If li = lit.Distinct.ToList.Last Then
                lblTypeLit.Text += li.ToString
            Else
                lblTypeLit.Text += li.ToString + " - "
            End If
        Next
        lblDescTypeSalle.Text = chambre.Single.descTypeSalle
        If Not IsPostBack Then
            Dim res = From it In bd.tblItem
                      Join gab In bd.tblGabarit
                      On gab.codeItem Equals it.codeItem
                      Where gab.codeTypeSalle = type
                      Select it

            lstItem.DataSource = res.ToList
            lstItem.DataBind()
        End If
    End Sub

    Protected Sub btnreserv_Click(sender As Object, e As EventArgs) Handles btnreserv.Click
        Response.Redirect("Réservation.aspx")
    End Sub
End Class

