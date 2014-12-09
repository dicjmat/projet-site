Public Class listechambre
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        Dim gotdated = Request.QueryString("dated")
        Dim gotdatef = Request.QueryString("datef")
        Dim gotnohotel = Request.QueryString("nohotel")

        repeatchambre.DataSource() = bd.determinertypechambrelibre(gotdated, gotdatef, gotnohotel).ToList
        repeatchambre.DataBind()


    End Sub


End Class