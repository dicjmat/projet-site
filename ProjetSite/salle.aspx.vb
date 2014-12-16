Public Class salle
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        If Not IsPostBack Then
            Dim noHotel = Request.QueryString("noHotel")
            Dim noSalle = Request.QueryString("noSalle")
            Dim res = From sa In bd.tblSalle
                      Where sa.noSalle = noSalle And sa.noHotel = noHotel
                      Select sa

            lblnomSalle.Text = res.Single.nomSalle
            imgSalle.ImageUrl = "~/Images/salle" + noSalle + "-" + noHotel + ".jpg"
            lblDescSalle.Text = res.Single.descSalle
            lblNombrePlace.Text = "Nombre de places : " + res.Single.nbPlace.ToString
        End If
    End Sub

End Class