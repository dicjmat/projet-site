Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim bd As P2014_Equipe2_GestionHôtelièreEntities
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        erreur.Visible = False
        erreur2.Visible = False
        erreur3.Visible = False
        Dim myControl1 As Control = LoadControl("~/Shared/_header.ascx")
        Controls.Add(myControl1)
        If Not IsPostBack Then
            Dim res = From el In bd.tblHotel Select el
            nomhotel.DataSource = res.ToList
            nomhotel.DataTextField = "nomHotel"
            nomhotel.DataValueField = "noHotel"
            nomhotel.DataBind()
        End If
    End Sub


    Protected Sub btnValid_Click(sender As Object, e As EventArgs) Handles btnValid.Click
        Dim datef As Date
        Dim dated As Date
        Dim noHotel As Integer
        Dim nbChambre As Integer

        dated = textboxdebut.Text
        datef = textboxFin.Text
        noHotel = nomhotel.SelectedValue

        If dated < Now().AddDays(-1) Or datef < Now().AddDays(-1) And dated > datef Then
            erreur3.Visible = True
            erreur.Visible = False
            erreur2.Visible = False
        ElseIf dated < Now().AddDays(-1) Or datef < Now().AddDays(-1) Then
            erreur2.Visible = True
            erreur.Visible = False
            erreur3.Visible = False
        ElseIf dated > datef Then
            erreur.Visible = True
            erreur2.Visible = False
            erreur3.Visible = False
        Else
            erreur.Visible = False
            erreur2.Visible = False
            erreur3.Visible = False
            Response.Redirect("listechambre.aspx?dated=" + dated + "&datef=" + datef + "&noHotel=" + noHotel.ToString + "&nbChambre=" + nbChambre.ToString)
        End If
    End Sub


End Class