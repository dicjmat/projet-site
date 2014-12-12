Public Class Chambre
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim bd = New P2014_Equipe2_GestionHôtelièreEntities
        Dim chambre = From ch In bd.tblTypeSalle
                  Where ch.codeTypeSalle = "SUP"
                  Select ch

        Dim lit = From ch In bd.tblSalle
                  Where ch.codeTypeSalle = "SUP"
                  Join li In bd.tblTypeLit
                  On li.codeTypeLit Equals ch.codeTypeLit
                  Select li.descTypeLit


        imgChambre.ImageUrl = "~/Images/chambre" + chambre.Single.codeTypeSalle + ".jpg"
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
                      Where gab.codeTypeSalle = "SUP"
                      Select it

            lstItem.DataSource = res.ToList
            lstItem.DataBind()
        End If

    End Sub

End Class