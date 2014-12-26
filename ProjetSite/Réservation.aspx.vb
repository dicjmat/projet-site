Public Class Réservation
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
            lstPays.SelectedIndex = -1
        End If
        réussite.Visible = False
        echec.Visible = False
    End Sub

    Protected Sub Unnamed1_Click(sender As Object, e As EventArgs)
        Dim gotdated = Request.QueryString("gotdated")
        Dim gotdatef = Request.QueryString("gotdatef")
        Dim gotnohotel = Request.QueryString("gotnohotel")
        Dim nbSTA = Request.QueryString("nbSTA")
        Dim nbSUP = Request.QueryString("nbSUP")
        Dim nbSUI = Request.QueryString("nbSUI")
        Dim i As Integer

        Dim res = From el In bd.tblSalle Where el.codeTypeSalle = "STA" Select el
        Dim res2 = From le In bd.tblTypeSalleHotel Where le.noHotel = gotnohotel And le.codeTypeSalle = "STA" Select le
        Dim ras = From al In bd.tblSalle Where al.codeTypeSalle = "SUP" Select al
        Dim ras2 = From la In bd.tblTypeSalleHotel Where la.noHotel = gotnohotel And la.codeTypeSalle = "SUP" Select la
        Dim rus = From ul In bd.tblSalle Where ul.codeTypeSalle = "SUI" Select ul
        Dim rus2 = From lu In bd.tblTypeSalleHotel Where lu.noHotel = gotnohotel And lu.codeTypeSalle = "SUI" Select lu


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
        client.codeProv = lstProvince.SelectedItem.ToString
        client.codeVille = lstVille.SelectedItem.ToString
            client.commentaire = txtcomm.Text.Trim
        bd.tblDemandeur.Add(client)
        Try
            bd.SaveChanges()
        Catch ex As Exception
            echec.Visible = True
        End Try


        For i = 0 To nbSTA
            Try
                Dim reserv As New tblReservation
                reserv.dateDebutSejour = gotdated
                reserv.dateFinSejour = gotdatef
                reserv.dateReserv = Today
                reserv.prixReserv = res2.First.prixSalle
                reserv.commentaire = txtcomm.Text.Trim
                reserv.noSalle = res.First.noSalle
                reserv.noHotel = gotnohotel
                reserv.noDemandeur = client.noDemandeur
                bd.tblReservation.Add(reserv)
                bd.SaveChanges()

            Catch ex As Exception
                echec.Visible = True
            End Try
        Next

        For i = 0 To nbSUP
            Try
                Dim reserv As New tblReservation
                reserv.dateDebutSejour = gotdated
                reserv.dateFinSejour = gotdatef
                reserv.dateReserv = Today
                reserv.prixReserv = ras2.First.prixSalle
                reserv.commentaire = txtcomm.Text.Trim
                reserv.noSalle = ras.First.noSalle
                reserv.noHotel = gotnohotel
                reserv.noDemandeur = client.noDemandeur
                bd.tblReservation.Add(reserv)
                bd.SaveChanges()

            Catch ex As Exception
                echec.Visible = True
            End Try
        Next

        For i = 0 To nbSUI
            Try
                Dim reserv As New tblReservation
                reserv.dateDebutSejour = gotdated
                reserv.dateFinSejour = gotdatef
                reserv.dateReserv = Today
                reserv.prixReserv = rus2.First.prixSalle
                reserv.commentaire = txtcomm.Text.Trim
                reserv.noSalle = rus.First.noSalle
                reserv.noHotel = gotnohotel
                reserv.noDemandeur = client.noDemandeur
                bd.tblReservation.Add(reserv)
                bd.SaveChanges()

            Catch ex As Exception
                echec.Visible = True
            End Try
        Next
        réussite.Visible = True
    End Sub

    Protected Sub lstProvince_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstProvince.SelectedIndexChanged
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

    Protected Sub lstPays_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstPays.SelectedIndexChanged
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
End Class