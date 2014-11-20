Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim bd As P2014_Equipe2_GestionHôtelièreEntities
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        Dim myControl1 As Control = LoadControl("~/Shared/_header.ascx")
        Controls.Add(myControl1)
        Dim res = From el In bd.tblHotel Select el
        nomhotel.DataSource = res.ToList
        nomhotel.DataTextField = "nomHotel"
        nomhotel.DataValueField = "noHotel"

        nomhotel.DataBind()


    End Sub
End Class