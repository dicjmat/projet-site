Public Class reservationForfait
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        If Not IsPostBack Then
            Dim pays = From pa In bd.tblPays
                       Select pa

            lstPays.DataValueField = "codePays"
            lstPays.DataTextField = "nomPays"
            lstPays.DataSource = pays.ToList
            lstPays.DataBind()
            Dim forfait As String = Request.QueryString("noForfait")
            Dim res = From fo In bd.tblForfait
                      Where fo.noForfait = forfait
                      Select fo
            lblnomForfait.Text = res.Single.nomForfait
            lblnbNuitForfait.Text = "Nombre de nuit : " + res.Single.nbNuitForfait.ToString
            lbldescForfait.Text = res.Single.descForfait
            lblTarifForfait.Text = "Tarif : " + res.Single.prixForfait.ToString("#####.##") + " $"
            lblTypeChambreForfait.Text = "Une " + res.Single.tblTypeSalle.nomTypeSalle
            lstPays.SelectedIndex = -1
        End If
    End Sub



    Protected Sub textboxdebut_TextChanged(sender As Object, e As EventArgs)
        setDateFin()
    End Sub

    Protected Sub setDateFin()
        Dim forfait As String = Request.QueryString("noForfait")
        Dim res = From fo In bd.tblForfait
                  Where fo.noForfait = forfait
                  Select fo

        Dim datedebut As Date = CType(textboxdebut.Text, Date)
        Dim nbNuit As Double = res.Single.nbNuitForfait
        Dim datefin As Date = DateAdd("d", nbNuit, datedebut)
        textboxFin.Text = datefin.ToString
    End Sub


    Private Sub lstPays_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstPays.SelectedIndexChanged
        If lstPays.SelectedIndex <> -1 Then
            Dim pays As String = lstPays.SelectedValue
            Dim province = From pro In bd.tblProvince
                           Where pro.codePays = pays
                           Select pro

            lstProvince.DataValueField = "codeProv"
            lstProvince.DataTextField = "nomProv"
            lstProvince.DataSource = province.ToList
            lstProvince.DataBind()
        End If



    End Sub

    Private Sub lstProvince_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstProvince.SelectedIndexChanged
        If lstProvince.SelectedIndex <> -1 Then
            Dim province As String = lstProvince.SelectedValue
            Dim ville = From vi In bd.tblVille
                           Where vi.codeProv = province
                           Select vi

            lstVille.DataValueField = "codeVille"
            lstVille.DataTextField = "nomVille"
            lstVille.DataSource = ville.ToList
            lstVille.DataBind()
        End If
    End Sub

    Private Sub btnValid_Click(sender As Object, e As EventArgs) Handles btnValid.Click
        Dim reserv = New tblDemandeur
        Dim res = New tblReservation
        res.dateDebutSejour = textboxdebut.Text
        res.dateFinSejour = textboxFin.Text
        res.dateReserv = Date.Now
        Dim noSalle = 0
        Dim forfait As String = Request.QueryString("noForfait")
        Dim reser = From fo In bd.tblForfait
                  Where fo.noForfait = forfait
                  Select fo
        res.noHotel = reser.Single.noHotel
        res.prixReserv = reser.Single.prixForfait
        Dim chambre = bd.determinerchambrelibre(textboxdebut.Text, textboxFin.Text, reser.Single.noHotel)
        For Each el In chambre
            If el.nomTypeSalle = reser.Single.tblTypeSalle.nomTypeSalle Then
                noSalle = el.noSalle
                Exit For
            End If
        Next

        res.noSalle = noSalle
        reserv.adrDemandeur = txtAdresse.Text
        reserv.codePostalDemandeur = txtCodePostal.Text
        If txtCell.Text <> "" Then
            reserv.noCellDemandeur = txtCell.Text
        End If
        If txtCommentaire.Text <> "" Then
            reserv.commentaire = txtCommentaire.Text
        End If
        reserv.noTelDemandeur = txtTel.Text
        reserv.codeProv = lstProvince.SelectedValue
        reserv.codeVille = lstVille.SelectedValue
        reserv.dateExpiration = txtDateExpiration.Text
        reserv.emailDemandeur = txtEmail.Text
        reserv.noCarteCredit = txtNoCarteCredit.Text
        reserv.nomDemandeur = txtNom.Text
        reserv.prenDemandeur = txtPrenom.Text
        reserv.typeCarteCredit = listtype.SelectedItem.Text
        bd.tblDemandeur.Add(reserv)
        res.tblDemandeur = reserv
        bd.tblReservation.Add(res)
        bd.SaveChanges()
        Response.Redirect("~/Default")
    End Sub
End Class