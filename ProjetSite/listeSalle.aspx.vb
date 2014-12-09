Public Class listeSalle
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        If Not IsPostBack Then
            Dim res = From ho In bd.tblHotel
                      Select ho

            listeSalleHotel.DataSource = res.ToList
            listeSalleHotel.DataBind()
        End If

    End Sub

    Private Sub listeSalleHotel_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles listeSalleHotel.ItemDataBound
        Dim lst As Repeater = sender
        Dim hotel As Label = e.Item.Controls.Item(1)
        Dim res = From sa In bd.tblSalle
                  Join ho In bd.tblHotel
                  On ho.noHotel Equals sa.noHotel
        Where sa.codeTypeSalle = "REU" And ho.noHotel = hotel.CssClass.Substring(0, 2).TrimEnd
                  Select sa
        Dim salle As ListView = e.Item.Controls.Item(3)
        salle.DataSource = res.ToList
        salle.DataBind()
    End Sub

    Protected Sub btnSalle_Click(sender As Object, e As EventArgs)
        Dim btn As Button = sender
        Dim hotel As Label = btn.Parent.Parent.Parent.Controls.Item(1)
        Response.Redirect("~/salle?noSalle=" + btn.CssClass.Substring(0, 6).TrimEnd + "&noHotel=" + hotel.CssClass.Substring(0, 2).TrimEnd)
    End Sub
End Class