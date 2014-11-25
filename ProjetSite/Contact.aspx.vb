Public Class Contact
    Inherits Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        Dim tel = From el In bd.tblHotel Select el.noTelHotel
        Dim telcop = From el In bd.tblHotel Select el.noTelecopieur
        Dim telres = From el In bd.tblHotel Select el.noTelReserv

    End Sub
End Class