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

        afficheronglet(nblist)
        If Not IsPostBack Then
            Tab1.CssClass = "Clicked"
            MainView.ActiveViewIndex = 0
        End If
        affichercontenu(STA)
    End Sub

    Protected Sub Tab1_Click(sender As Object, e As EventArgs)
        Dim STA As String
        STA = "STA"
        Tab1.CssClass = "Clicked"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Initial"
        MainView.ActiveViewIndex = 0
        affichercontenu(STA)
    End Sub

    Protected Sub Tab2_Click(sender As Object, e As EventArgs)
        Dim SUP As String
        SUP = "SUP"
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Clicked"
        Tab3.CssClass = "Initial"
        MainView.ActiveViewIndex = 1
        affichercontenu2(SUP)
    End Sub

    Protected Sub Tab3_Click(sender As Object, e As EventArgs)
        Dim SUI As String
        SUI = "SUI"
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Clicked"
        MainView.ActiveViewIndex = 2
        affichercontenu3(SUI)
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

    Protected Sub affichercontenu2(type As String)
        Dim chambre = From ch In bd.tblTypeSalle
          Where ch.codeTypeSalle = type
          Select ch

        Dim lit = From ch In bd.tblSalle
                  Where ch.codeTypeSalle = type
                  Join li In bd.tblTypeLit
                  On li.codeTypeLit Equals ch.codeTypeLit
                  Select li.descTypeLit

        imgChambre2.ImageUrl = "~/Images/chambre" + type + ".jpg"
        lblTypeChambre2.Text = chambre.Single.nomTypeSalle
        For Each li In lit.Distinct.ToList
            If li = lit.Distinct.ToList.Last Then
                lblTypeLit2.Text += li.ToString
            Else
                lblTypeLit2.Text += li.ToString + " - "
            End If
        Next
        lblDescTypeSalle2.Text = chambre.Single.descTypeSalle
        If Not IsPostBack Then
            Dim res = From it In bd.tblItem
                      Join gab In bd.tblGabarit
                      On gab.codeItem Equals it.codeItem
                      Where gab.codeTypeSalle = type
                      Select it

            lstItem2.DataSource = res.ToList
            lstItem2.DataBind()
        End If
    End Sub

    Protected Sub affichercontenu3(type As String)
        Dim chambre = From ch In bd.tblTypeSalle
          Where ch.codeTypeSalle = type
          Select ch

        Dim lit = From ch In bd.tblSalle
                  Where ch.codeTypeSalle = type
                  Join li In bd.tblTypeLit
                  On li.codeTypeLit Equals ch.codeTypeLit
                  Select li.descTypeLit

        imgChambre3.ImageUrl = "~/Images/chambre" + type + ".jpg"
        lblTypeChambre3.Text = chambre.Single.nomTypeSalle
        For Each li In lit.Distinct.ToList
            If li = lit.Distinct.ToList.Last Then
                lblTypeLit3.Text += li.ToString
            Else
                lblTypeLit3.Text += li.ToString + " - "
            End If
        Next
        lblDescTypeSalle3.Text = chambre.Single.descTypeSalle
        If Not IsPostBack Then
            Dim res = From it In bd.tblItem
                      Join gab In bd.tblGabarit
                      On gab.codeItem Equals it.codeItem
                      Where gab.codeTypeSalle = type
                      Select it

            lstItem3.DataSource = res.ToList
            lstItem3.DataBind()
        End If
    End Sub

    Protected Sub btnreserv_Click(sender As Object, e As EventArgs) Handles btnreserv.Click
        Dim gotdated = Request.QueryString("dated")
        Dim gotdatef = Request.QueryString("datef")
        Dim gotnohotel = Request.QueryString("nohotel")
        Response.Redirect("Réservation.aspx?gotdated=" + gotdated + "&gotdatef=" + gotdatef + "&gotnohotel=" + gotnohotel)
    End Sub
End Class

