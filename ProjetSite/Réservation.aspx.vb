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
        Try
            Dim client As New tblDemandeur
            client.nomDemandeur = txtnom.Text.Trim
            client.prenDemandeur = txtpren.Text.Trim
            client.noTelDemandeur = txtnotel.Text
            client.noCellDemandeur = txtnocell.Text
            client.adrDemandeur = txtadr.Text.Trim
            client.noCarteCredit = txtnocarte.Text
            client.typeCarteCredit = listtype.SelectedItem.ToString
            client.dateExpiration = txtdateexp.Text
            client.codeVille = listville.SelectedItem.ToString
            client.codeProv = listprov.SelectedItem.ToString
            client.commentaire = txtcomm.Text.Trim
            bd.tblDemandeur.Add(client)
            bd.SaveChanges()
            swag2.Visible = True
        Catch ex As Exception
            swag.Visible = True
        End Try
    End Sub
End Class