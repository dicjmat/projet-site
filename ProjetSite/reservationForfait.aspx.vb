Public Class reservationForfait
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        If Not IsPostBack Then
            Dim forfait As String = Request.QueryString("noForfait")
            Dim res = From fo In bd.tblForfait
                      Where fo.noForfait = forfait
                      Select fo
            lblnomForfait.Text = res.Single.nomForfait
            lblnbNuitForfait.Text = "Nombre de nuit : " + res.Single.nbNuitForfait.ToString
            lbldescForfait.Text = res.Single.descForfait
            lblTarifForfait.Text = "Tarif : " + res.Single.prixForfait.ToString("#####.##") + " $"
            lblTypeChambreForfait.Text = "Une " + res.Single.tblTypeSalle.nomTypeSalle
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
End Class