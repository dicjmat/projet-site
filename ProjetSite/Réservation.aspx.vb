Public Class Réservation
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        Dim res = From el In bd.tblVille Select el
        listville.DataSource = res.ToList
        listville.DataTextField = "codeVille"
        listville.DataBind()
        Dim res2 = From el In bd.tblProvince Select el
        listprov.DataSource = res2.ToList
        listprov.DataTextField = "codeProv"
        listprov.DataBind()
        swag.Visible = False
        swag2.Visible = False
    End Sub

    Protected Sub Unnamed1_Click(sender As Object, e As EventArgs)
        Dim gotdated = Request.QueryString("gotdated")
        Dim gotdatef = Request.QueryString("gotdatef")
        Dim gotnohotel = Request.QueryString("gotnohotel")

        Dim res = From el In bd.tblSalle Where el.codeTypeSalle = "STA" Select el
        Dim res2 = From le In bd.tblTypeSalleHotel Where le.noHotel = gotnohotel And le.codeTypeSalle = "STA" Select le
        Dim noClient As String
        'Try
        Dim client As New tblDemandeur
        client.nomDemandeur = txtnom.Text.Trim
        client.prenDemandeur = txtpren.Text.Trim
        client.noTelDemandeur = txtnotel.Text.Trim
        client.noCellDemandeur = txtnocell.Text.Trim
        client.adrDemandeur = txtadr.Text.Trim
        client.codePostalDemandeur = txtcodepostal.Text.Trim
        client.emailDemandeur = txtemail.Text.Trim
        client.noCarteCredit = txtnocarte.Text.Trim
        client.typeCarteCredit = listtype.SelectedItem.ToString
        client.dateExpiration = txtdateexp.Text.Trim
        client.codeVille = listville.SelectedItem.ToString
        client.codeProv = listprov.SelectedItem.ToString
        client.commentaire = txtcomm.Text.Trim
        bd.tblDemandeur.Add(client)
        bd.SaveChanges()
        noClient = client.noDemandeur
        swag2.Visible = True
        'Catch ex As Exception
        swag.Visible = True
        'End Try
        Try
            Dim reserv As New tblReservation
            reserv.dateDebutSejour = gotdated
            reserv.dateFinSejour = gotdatef
            reserv.dateReserv = Today
            reserv.prixReserv = res2.First.prixSalle
            reserv.commentaire = txtcomm.Text.Trim
            reserv.noSalle = res.First.noSalle
            reserv.noHotel = gotnohotel
            reserv.noClient = noClient
            bd.tblReservation.Add(reserv)
            bd.SaveChanges()
        Catch ex As Exception

        End Try
    End Sub
End Class