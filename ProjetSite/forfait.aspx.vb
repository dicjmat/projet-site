Public Class forfait
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        If Not IsPostBack Then
            Dim res = From ho In bd.tblHotel
                      Select ho

            dpHotel.DataSource = res.ToList
            dpHotel.DataTextField = "nomHotel"
            dpHotel.DataValueField = "noHotel"
            dpHotel.DataBind()
        End If
        changerForfait()
    End Sub

    Protected Sub dpHotel_SelectedIndexChanged(sender As Object, e As EventArgs)
        changerForfait()
    End Sub

    Protected Sub changerForfait()
        Dim forfait = From fo In bd.tblForfait
              Where fo.noHotel = dpHotel.SelectedItem.Value
              Select fo

        lsForfait.DataSource = forfait.ToList
        lsForfait.DataBind()
    End Sub
End Class