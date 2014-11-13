Public Class PageAccueil
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim myControl1 As Control = LoadControl("~/Shared/_header.ascx")
        Controls.Add(myControl1)
    End Sub

End Class